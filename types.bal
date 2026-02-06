


type Scan readonly & record {|
    string customerID;
    string scanType;
    string targetUrl;
    string scanName;
    string priority;
    string scheduledTime;
    string notificationEmail;
|};

table<Scan> key(customerID) Scans = table [];
