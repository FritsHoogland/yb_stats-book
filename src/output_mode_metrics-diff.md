# metrics-diff mode

The purpose of metrics-diff mode is to read two snapshots which must be locally stored, and show a difference report.

Additional switches:
- `--hostname-match`: filter by hostname or port regular expression.
- `--stat-name-match`: filter by statistic name regular expression.
- `--table-name-match`: filter by table name regular expression (requires `--details-enable` to split table and tablet statistics out).
- `--details-enable`: split table and tablet statistics, instead of summarizing these per server.
- `--gauges-enable`: add non-counter statistics to the output.
- `-b`/`--begin`: set the begin snapshot number.
- `-e`/`--end`: set the end snapshot number.

metrics-diff mode means using already stored snapshots, which can be from a cluster that currently is unavailable or even deleted, 
because the metrics-diff mode only uses the information that is stored in the locally available snapshot (JSON) data.
This gives a lot of options for investigation that otherwise would be hard or painful, and allows to investigate airgapped clusters (clusters that are not connected to the internet). 

The way to invoke versions-diff mode is to use the `--metrics-diff` switch. 

If `--metrics-diff` is used without `-b`/`--begin` <snapshot number> and `-e`/`--end` <snapshot number> options, 
it will present the available snapshot numbers with their timestamp and comments and ask for the option that is not specified. 
Otherwise the metrics-diff is directly created and shown.

versions-diff without begin/end specification:
```shell
yb_stats --metrics-diff
  0 2023-03-18 14:13:01.407795 +01:00
  1 2023-03-18 14:13:53.959694 +01:00
  2 2023-03-18 14:14:05.162338 +01:00
  3 2023-03-19 14:20:50.977417 +01:00
  4 2023-03-19 14:21:14.418544 +01:00
  5 2023-03-19 14:24:17.733927 +01:00
Enter begin snapshot: 4
Enter end snapshot: 5
192.168.66.80:12000  server   cpu_stime                                                                         2669 ms              14.531 /s
192.168.66.80:12000  server   cpu_utime                                                                           80 ms               0.436 /s
192.168.66.80:12000  server   involuntary_context_switches                                                        36 csws             0.196 /s
192.168.66.80:12000  server   server_uptime_ms                                                                183203 ms             997.441 /s
192.168.66.80:12000  server   spinlock_contention_time                                                       1018673 us            5546.123 /s
192.168.66.80:12000  server   threads_started                                                                     12 threads           0.065 /s
192.168.66.80:12000  server   threads_started_thread_pool                                                         12 threads           0.065 /s
192.168.66.80:12000  server   voluntary_context_switches                                                       52096 csws           283.635 /s
...lots more output
```

versions-diff with begin/end specification:
```shell
yb_stats --snapshot-diff -b 4 -e 5
192.168.66.80:12000  server   cpu_stime                                                                         2669 ms              14.531 /s
192.168.66.80:12000  server   cpu_utime                                                                           80 ms               0.436 /s
192.168.66.80:12000  server   involuntary_context_switches                                                        36 csws             0.196 /s
192.168.66.80:12000  server   server_uptime_ms                                                                183203 ms             997.441 /s
192.168.66.80:12000  server   spinlock_contention_time                                                       1018673 us            5546.123 /s
192.168.66.80:12000  server   threads_started                                                                     12 threads           0.065 /s
192.168.66.80:12000  server   threads_started_thread_pool                                                         12 threads           0.065 /s
192.168.66.80:12000  server   voluntary_context_switches                                                       52096 csws           283.635 /s
...lots more output
```
