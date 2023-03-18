# vars diff

Whenever `yb_stats` is used in ad-hoc diff mode or in snapshot-diff mode, it will read the vars (gflags) using the `/api/v1/varz` endpoint.
This is executed for both the masters and the tablet servers.
This is done during the begin and end snapshots.

Example of a changed var on all servers between and begin and end snapshot:
```
* 192.168.66.80:9000   Vars: ysql_enable_packed_row                             false->true Default->Custom
* 192.168.66.81:9000   Vars: ysql_enable_packed_row                             false->true Default->Custom
* 192.168.66.82:9000   Vars: ysql_enable_packed_row                             false->true Default->Custom
```
This shows that on the servers 192.168.66.80, 192.168.66.81 and 192.168.66.82 servers on endpoint 9000 (the default tablet server port) a change was detected and reported.
- The var/gflag is `ysql_enabled_packed_row`.
- The value is changed from `false` to `true`.
- The change of var changed the type of var from `Default` (non changed) to `Custom` (changed).