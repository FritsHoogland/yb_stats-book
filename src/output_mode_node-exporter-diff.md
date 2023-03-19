# node-exporter-diff mode

The purpose of node-exporter-diff mode is to read two snapshots which must be locally stored, and show a difference report.

Additional switches:
- `--hostname-match`: filter by hostname or port regular expression.
- `--stat-name-match`: filter by statistic name regular expression.
- `--details-enable`: add the source of summarized counters, and some filtered out counters.
- `--gauges-enable`: add non-counter statistics to the output.
- `-b`/`--begin`: set the begin snapshot number.
- `-e`/`--end`: set the end snapshot number.

node-exporter-diff mode means using already stored snapshots, which can be from a cluster that currently is unavailable or even deleted, 
because the node-exporter-diff mode only uses the information that is stored in the locally available snapshot (JSON) data.
This gives a lot of options for investigation that otherwise would be hard or painful, and allows to investigate airgapped clusters (clusters that are not connected to the internet). 

The way to invoke versions-diff mode is to use the `--node-exporter-diff` switch. 

If `--node-exporter-diff` is used without `-b`/`--begin` <snapshot number> and `-e`/`--end` <snapshot number> options, 
it will present the available snapshot numbers with their timestamp and comments and ask for the option that is not specified. 
Otherwise the node-exporter-diff is directly created and shown.

versions-diff without begin/end specification:
```shell
yb_stats --node-exporter-diff
  0 2023-03-18 14:13:01.407795 +01:00
  1 2023-03-18 14:13:53.959694 +01:00
  2 2023-03-18 14:14:05.162338 +01:00
  3 2023-03-19 14:20:50.977417 +01:00
  4 2023-03-19 14:21:14.418544 +01:00
  5 2023-03-19 14:24:17.733927 +01:00
Enter begin snapshot: 4
Enter end snapshot: 5
192.168.66.80:9300   counter  node_context_switches_total                                                     169483.000000         926.137 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_idle                                                        169.720000           0.927 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_iowait                                                        0.010000           0.000 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_irq                                                           5.350000           0.029 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_softirq                                                       1.300000           0.007 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_system                                                        2.110000           0.012 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_user                                                          0.090000           0.000 /s
192.168.66.80:9300   counter  node_disk_io_time_seconds_total_sda                                                  0.076000           0.000 /s
...lots more output
```

versions-diff with begin/end specification:
```shell
yb_stats -node-exporter-diff -b 4 -e 5
192.168.66.80:9300   counter  node_context_switches_total                                                     169483.000000         926.137 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_idle                                                        169.720000           0.927 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_iowait                                                        0.010000           0.000 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_irq                                                           5.350000           0.029 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_softirq                                                       1.300000           0.007 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_system                                                        2.110000           0.012 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_user                                                          0.090000           0.000 /s
192.168.66.80:9300   counter  node_disk_io_time_seconds_total_sda                                                  0.076000           0.000 /s
...lots more output
```
