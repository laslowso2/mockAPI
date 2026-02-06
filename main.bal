import ballerina/http;


listener http:Listener httpDefaultListener = http:getDefaultListener();

# Description.
service /scan on httpDefaultListener {
    
    resource function get list(string customerID) returns Scan[] {
        do {
            return from Scan scan in Scans
            where scan.customerID == customerID
            select scan;
        } 
    }


    
    resource function post create(Scan payload) returns Scan {
        do {
            Scans.add(payload);
            return payload;
        }
    }

}
