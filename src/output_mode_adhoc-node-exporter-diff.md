# adhoc-node-exporter-diff

When `yb_stats` is run with the `--adhoc-node-exporter-diff`, it will perform a snapshot in memory, and wait for enter to perform the next snapshot and present the difference.
This is called 'adhoc mode', however, the `--adhoc-node-exporter-diff` mode will only take the metrics from node-exporter, and show the difference.
Node-exporter shows the operating system statistics.

The usage of either adhoc mode or snapshot mode should be carefully considered. 
adhoc alias in-memory snapshots does not write anything. 

In most cases performing snapshots persisting all the available information is the best way, so results can be reviewed later, and cannot get lost, because they are stored.
However, if you are performing repeated tests where storing all snapshot information would simply be too much and would require you to remove all the snapshots after testing anyways AND you are shure what to look for, then adhoc mode might be used.

# Example
This is how the first snapshot looks like in ad-hoc mode:
```
yb_stats --adhoc-metrics-diff
Begin ad-hoc in-memory snapshot created, press enter to create end snapshot for difference calculation.
```
After the snapshot is created, you can perform the task under investigation. Once that is done, press enter:
```
Time between snapshots:   18.843 seconds
192.168.66.80:9300   counter  node_context_switches_total                                                      14946.000000         830.333 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_idle                                                         17.610000           0.978 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_irq                                                           0.510000           0.028 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_softirq                                                       0.130000           0.007 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_system                                                        0.220000           0.012 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_user                                                          0.010000           0.001 /s
192.168.66.80:9300   counter  node_disk_io_time_seconds_total_sda                                                  0.004000           0.000 /s
192.168.66.80:9300   counter  node_disk_io_time_weighted_seconds_total_sda                                         0.003000           0.000 /s
...etcetera
```
For an explanation of the fields see: [Node-exporter statistics](./output_metrics_nodeexporter.md)