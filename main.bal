import ballerina/http;
import ballerina/random;


listener http:Listener httpDefaultListener = http:getDefaultListener();

# Description.
service /scan on httpDefaultListener {
    
    resource function get list/[string customerID]() returns Scan[] {
        do {
            return from Scan scan in Scans
            where scan.customerCode == customerID
            select scan;
        } 
    }
    
    resource function post create(Scan payload) returns Scan|error {
        do {
            string id = check newID(8);
           
            // Create a new Scan value with the generated ID 
            Scan scanToSave = {
                uID: id,
                customerCode: payload.customerCode,
                scanType: payload.scanType,
                targetUrl: payload.targetUrl,
                scanName: payload.scanName,
                priority: payload.priority,
                scheduledTime: payload.scheduledTime,
                notificationEmail: payload.notificationEmail
            };
            Scans.add(scanToSave);
            return scanToSave;
        }
    }

}

    function newID(int Size) returns string|error {
        string randomString = "";
        string charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    
        foreach int i in 0 ..< Size {
            int index = check random:createIntInRange(0, charset.length());
            randomString += charset[index];
        }

        return randomString;
    }
