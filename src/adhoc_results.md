# yb_stats ad-hoc results

When `yb_stats` is run without any switch, or only the data or filter switches, it will perform a snapshot in memory, and wait for enter to perform the next snapshot and present the difference.
This is called 'ad-hoc mode'.

This will not only show the difference for performance based statistics (the metric counters and optionally gauges), but also any change in the cluster, such as:
- The addition or removal of tablet servers or masters.
- Restarts of tablet servers or masters.
- The creation or removal of database objects (tables, indexes, materialized views, databases/keyspaces).
- The change of any gflags of the tablet servers or masters.
- Any change for a replica, notably the LEADER or FOLLOWER state.
- Role changes for the masters.

The usage of either ad-hoc mode or snapshot mode should be carefully considered. 
ad-hoc alias in-memory snapshots does not write anything. 
In most cases performing snapshots persisting all the available information is the best way, so results can be reviewed later, and cannot get lost, because they are stored.
However, if you are performing repeated tests where storing all snapshot information would simply be too much and would require you to remove all the snapshots after testing anyways AND you are shure what to look for, then ad-hoc mode might be used.

# Example
This is how the first snapshot looks like in ad-hoc mode:
```
% yb_stats
Begin metrics snapshot created, press enter to create end snapshot for difference calculation.
```
After the snapshot is created, you can perform the task under investigation. Once that is done, press enter:
```

Time between snapshots:   70.166 seconds
192.168.66.80:12000  server   cpu_stime                                                                          874 ms              12.458 /s
192.168.66.80:12000  server   cpu_utime                                                                            7 ms               0.100 /s
...etcetera
```