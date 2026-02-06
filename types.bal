
type Tags string[];

type Scan readonly & record {|
    string customerID;
    string scanType;
    string targetUrl;
    string scanName;
    string priority;
    string scheduledTime;
    string notificationEmail;
    Tags tags;
|};

table<Scan> key(customerID) Scans = table [];
