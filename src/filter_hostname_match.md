# --hostname-match

Most `yb_stats` query options allow to filter on hostname. This is done with the `--hostname-match` switch. The hostname match switch uses a regex to filter out entries using the hostname:port specification.

Very simple use of `--hostname-match` is to filter on the port number, to specify only the tablet servers:
```shell
yb_stats --hostname-match 9000
```

Or specify to use only the tablet server and master servers, thereby filtering the node-exporter, YEDIS, YCQL and YSQL output:
```shell
yb_stats --hostname-match '(7000|9000)'
```

Because the filter is based on regex pattern matching, it is also easy to specify a master (=7000) for a class C ip network with hostnumber 82 (class C means for example 192.168.66/24, so one octet remains, so '82'), which means you can filter in this way:
```shell
yb_stats --hostname-match '82:7000'
```
