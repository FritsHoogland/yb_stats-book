# snapshot-nonmetrics-diff mode
The purpose of snapshot-nonmetrics-diff mode is to read two snapshots which must be locally stored, and show a difference report.
The special purpose of _nonmetrics_ is that it excludes the quite numerous detailed statistics, and only shows the differences for:
- entities
- masters
- tablet servers
- vars (gflags)
- versions
- healthcheck 

Additional switches:
- `--hostname-match`: filter by hostname or port regular expression.
- `--stat-name-match`: filter by statistic name regular expression.
- `--details-enable`: split table and tablet statistics, instead of summarizing these per server.
  ➜ yb_stats --snapshot-nonmetrics-diff -b 0 -e 2
+ Object:   ysql.yugabyte.t, state: RUNNING, id: 000033e8000030008000000000004100
+ Tablet:   ysql.yugabyte.t.3b964b2604ae4201a1f865097f3eacdf, state: RUNNING, leader: yb-1.local:9100
+ Replica:  yb-1.local:9100:ysql.yugabyte.t.3b964b2604ae4201a1f865097f3eacdf, Type: VOTER
  = Tserver:  yb-1.local:9000, status: ALIVE, uptime: 2619->0
  = 192.168.66.80:12000  Vars: heap_profile_path                                  /tmp/yb-tserver.1052->/tmp/yb-tserver.8389 Default
  = 192.168.66.80:9000   Vars: heap_profile_path                                  /tmp/yb-tserver.1052->/tmp/yb-tserver.8389 Default- `-b`/`--begin`: set the begin snapshot number.
- `-e`/`--end`: set the end snapshot number.

snapshot-nonmetric-diff mode means using already stored snapshots, which can be from a cluster that currently is unavailable or even deleted, 
because the snapshot-nonmetric-diff mode only uses the information that is stored in the locally available snapshot (CSV) data.
This gives a lot of options for investigation that otherwise would be hard or painful, and allows to investigate airgapped clusters (clusters that are not connected to the internet). 

The way to invoke snapshot-diff mode is to use the `--snapshot-nonmetric-diff` switch. 

If `--snapshot-nonmetric-diff` is used without `-b`/`--begin` <snapshot number> and `-e`/`--end` <snapshot number> options, it will present the available snapshot numbers with their timestamp and comments and ask for the option that is not specified. Otherwise the snapshot-diff is directly created and shown.

snapshot-nonmetric-diff without begin/end specification:
```shell
➜ yb_stats --snapshot-nonmetrics-diff
  0 2023-03-18 14:13:01.407795 +01:00
  1 2023-03-18 14:13:53.959694 +01:00
  2 2023-03-18 14:14:05.162338 +01:00
Enter begin snapshot: 0
Enter end snapshot: 2
+ Object:   ysql.yugabyte.t, state: RUNNING, id: 000033e8000030008000000000004100
+ Tablet:   ysql.yugabyte.t.3b964b2604ae4201a1f865097f3eacdf, state: RUNNING, leader: yb-1.local:9100
+ Replica:  yb-1.local:9100:ysql.yugabyte.t.3b964b2604ae4201a1f865097f3eacdf, Type: VOTER
= Tserver:  yb-1.local:9000, status: ALIVE, uptime: 2619->0
= 192.168.66.80:12000  Vars: heap_profile_path                                  /tmp/yb-tserver.1052->/tmp/yb-tserver.8389 Default
= 192.168.66.80:9000   Vars: heap_profile_path                                  /tmp/yb-tserver.1052->/tmp/yb-tserver.8389 Default
```
For an explanation of the changes, see below.

snapshot-nonmetrics-diff with begin/end specification:
```shell
➜ yb_stats --snapshot-nonmetrics-diff -b 0 -e 2
+ Object:   ysql.yugabyte.t, state: RUNNING, id: 000033e8000030008000000000004100
+ Tablet:   ysql.yugabyte.t.3b964b2604ae4201a1f865097f3eacdf, state: RUNNING, leader: yb-1.local:9100
+ Replica:  yb-1.local:9100:ysql.yugabyte.t.3b964b2604ae4201a1f865097f3eacdf, Type: VOTER
= Tserver:  yb-1.local:9000, status: ALIVE, uptime: 2619->0
= 192.168.66.80:12000  Vars: heap_profile_path                                  /tmp/yb-tserver.1052->/tmp/yb-tserver.8389 Default
= 192.168.66.80:9000   Vars: heap_profile_path                                  /tmp/yb-tserver.1052->/tmp/yb-tserver.8389 Default
```
In this example, a begin snapshot (`0`) and end snapshot (`2`) are specified, and the differences found between snapshot number 0 and 2 are:
- An object ysql.yugabyte.t is added (`+`).
- A tablet ysql.yugabyte.t.3b964b2604ae4201a1f865097f3eacdf is added (`+`) on yb-1.local:9100.
- A replica yb-1.local:9100:ysql.yugabyte.t.3b964b2604ae4201a1f865097f3eacdf is added (`+`).
- A change (`=`) is detected on Tserver yb-1.local:9000, the uptime has changed from 2619->0, indicating it has been restarted.
- A change (`=`) is detected on 192.168.66.80:12000 for the var/gflag heap_profile_path.
- A change (`=`) is detected on 192.168.66.80:9000 identical to port 12000. Port 12000 (the YCQL port) shows identical information to port 9000, the general default tablet server port.
