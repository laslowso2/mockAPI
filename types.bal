


type Scan readonly & record {|
    string uID;
    string customerCode;
    string scanType;
    string targetUrl;
    string scanName;
    string priority;
    string scheduledTime;
    string notificationEmail;
|};

table<Scan> key(ID) Scans = table [];
