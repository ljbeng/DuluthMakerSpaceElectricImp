// initialize pins
local led = hardware.pin1;
local tmp36 = hardware.pin2;
tmp36.configure(ANALOG_IN);
led.configure(DIGITAL_OUT);

// global variable to track current state of LED pin
state <- 0;
// set LED pin to initial value (0 = off, 1 = on)
led.write(state);

t1f <- 0.0;
light <- 0.0;
f_str <- "";

// function returns temperature from tmp36
function getTemperature() {
    local supplyVoltage = hardware.voltage();
    local voltage = supplyVoltage * tmp36.read() / 65535.0;
    local c = ((voltage - 0.5) * 100)* 1.8 + 32 ;//convert to F
    return(c);
}

// function to send sensor data to be plotted
function sendDataToAgent() {
    t1f = getTemperature();
    light = hardware.lightlevel().tofloat();
    light = (light * 100 / 65535);//% of light
    
    f_str = format("Room_Temp,%.1f\nLight_Level,%.1f\n",t1f,light);
    
    agent.send("new_readings", f_str);
    // How often to make http request (seconds)
    imp.wakeup(15, sendDataToAgent);
}

// function to blink LED
function blink() {
  // flip the state variable
  state = 1 - state;
  
  led.write(state);         // set LED pin to new value
  
  imp.wakeup(0.5, blink);   // schedule the blink function to run again in .5 seconds
}

// Initialize Loop
sendDataToAgent();
blink();
