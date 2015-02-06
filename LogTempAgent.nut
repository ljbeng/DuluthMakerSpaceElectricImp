
//MakerSpace1
const FEED_ID = "834281402";
const API_KEY = "bYAZvdwjXQaQm3PsuK98tuqolpUBNTk31MQI3a1N1YUTfmdF";
//https://xively.com/feeds/834281402

//MakerSpace2
//const FEED_ID = "1337300021";
//const API_KEY = "fHTtcQOlg8Fd2ln2CKieTtvIiqDniRXG8XrlH5nVdqBI4XNh";
//https://xively.com/feeds/

//MakerSpace3
//const FEED_ID = "478746511";
//const API_KEY = "2mAVsmscPV7jtXmjwo4a8Apt5txyQEwE7mzdIfoBFukq8oyT";
//https://xively.com/feeds/1337300021

//MakerSpace4
//const FEED_ID = "1891661655";
//const API_KEY = "HQHA5ffUzf9uYH5sysgMCknNuhWVqg1NVqdYYHy3aBK5p4dd";
//https://xively.com/feeds/1891661655

//MakerSpace5
//const FEED_ID = "952604001";
//const API_KEY = "BuHNRzFzcZkMoPU9yqeTkGIIGi5dFFqqE8OBvoFDup3YgIYs";
//https://xively.com/feeds/

//MakerSpace6
//const FEED_ID = "1349689587";
//const API_KEY = "R2n0rfrclGnO5Lqn1fVONFSeTa7VczLgtgy0oNIfmPSsCK1n";
//https://xively.com/feeds/


// When Device sends new readings, Run this!
device.on("new_readings" function(body) {

    local xively_url = "https://api.xively.com/v2/feeds/" + FEED_ID + ".csv";       //setup url for csv
    server.log(xively_url);
    server.log(body);       //print body for testing
    local req = http.put(xively_url, {"X-ApiKey":API_KEY, "Content-Type":"text/csv", "User-Agent":"xively-Imp-Lib/1.0"}, body);     //add headers
    local res = req.sendsync();         //send request
 
});


