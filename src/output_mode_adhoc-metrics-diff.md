# adhoc-metrics-diff

When `yb_stats` is run with the `--adhoc-metrics-diff`, it will perform a snapshot in memory, and wait for enter to perform the next snapshot and present the difference.
This is called 'adhoc mode', however, the `--adhoc-metrics-diff` mode will only take the metrics (excluding node-exporter), and show the difference.

The usage of either adhoc mode or snapshot mode should be carefully considered. 
adhoc alias in-memory snapshots does not write anything. 

In most cases performing snapshots persisting all the available information is the best way, so results can be reviewed later, and cannot get lost, because they are stored.
However, if you are performing repeated tests where storing all snapshot information would simply be too much and would require you to remove all the snapshots after testing anyways AND you are shure what to look for, then adhoc mode might be used.

# Example
This is how the first snapshot looks like in ad-hoc mode:
```
yb_stats --adhoc-metrics-diff
Begin metrics snapshot created, press enter to create end snapshot for difference calculation.
```
After the snapshot is created, you can perform the task under investigation. Once that is done, press enter:
```
Time between snapshots:    2.910 seconds
192.168.66.80:12000  server   cpu_stime                                                                           49 ms              17.008 /s
192.168.66.80:12000  server   cpu_utime                                                                            2 ms               0.694 /s
192.168.66.80:12000  server   involuntary_context_switches                                                         1 csws             0.347 /s
192.168.66.80:12000  server   server_uptime_ms                                                                  2879 ms             999.306 /s
192.168.66.80:12000  server   threads_started                                                                      2 threads           0.694 /s
...etcetera
```