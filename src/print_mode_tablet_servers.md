# print-tablet-servers
Print the current tablet servers from a live cluster or from a snapshot.

- `--print-tablet-servers <snapshot number>`: print tablet servers from a stored snapshot.
- `--print-tablet-servers`: print tablet servers from a live cluster.

Additional switches:
- `--details-enable`: print the tablet servers information from all masters.

In order to get the current information, `yb_stats` fetches to learn the master leader first, and then obtain the tablet servers information from the master leader, unless the `--details-enable` switch is set.

Example:
```
yb-2.local:9000      ALIVE Cloud: local, Region: local, Zone: local2
                     HB time: 2.1s, Uptime: 0, Ram 8.39 MB
                     SST files: nr: 0, size: 0 B, uncompressed: 0 B
                     ops read: 0, write: 0
                     tablets: active: 14, user (leader/total): 7/20, system (leader/total): 0/12
                     Path: /mnt/d0, total: 10724835328, used: 992555008 (9.25%)
yb-1.local:9000      ALIVE Cloud: local, Region: local, Zone: local1
                     HB time: 0.0s, Uptime: 0, Ram 9.44 MB
                     SST files: nr: 0, size: 0 B, uncompressed: 0 B
                     ops read: 0, write: 0
                     tablets: active: 16, user (leader/total): 6/20, system (leader/total): 0/12
                     Path: /mnt/d0, total: 10724835328, used: 441438208 (4.12%)
yb-3.local:9000      ALIVE Cloud: local, Region: local, Zone: local3
                     HB time: 0.1s, Uptime: 1118, Ram 62.46 MB
                     SST files: nr: 13, size: 4.46 MB, uncompressed: 15.24 MB
                     ops read: 0, write: 0
                     tablets: active: 32, user (leader/total): 6/20, system (leader/total): 5/12
                     Path: /mnt/d0, total: 10724835328, used: 922292224 (8.60%)
```