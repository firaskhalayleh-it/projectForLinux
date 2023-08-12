# projectForLinux
this project performs following tasks : 
 It performs the following tasks:

- Creates a directory named logging in the user's home directory to store log files.
- Defines the names of cumulative and compressed cumulative log files.
- Uses a loop to continuously collect logs every hour.
- Appends the collected logs to a cumulative log file.
- Compresses the current log file.
- Appends the compressed log to the cumulative compressed log file.
- Uploads the cumulative compressed log file to Dropbox using dbxcli.
- Removes the current compressed and log files.
