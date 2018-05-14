# apache-access-log-analyzer
A script to summarize errors and requests from an apache access log

### How to Use

``` bash
$ /path/to/script.rb /path/to/apache.log 
(Typically either /var/log/apache2/access.log or /var/log/httpd/access_log) 
```

### Sample Output

IP 10.10.10.1 hit 263 times. Secret requested 4 time(s).

IP 74.25.55.31 hit 843 times. Secret requested 8 time(s).

IP 192.168.2.3 hit 64 times. Secret requested 32 time(s).

IP 195.38.4.7 hit 3 times. Secret requested 0 time(s).
