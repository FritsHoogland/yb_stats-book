# snapshot-diff mode
The purpose of snapshot-diff mode is to read two snapshots which must be locally stored, and show a difference report.

Additional switches:
- `--hostname-match`: filter by hostname or port regular expression.
- `--stat-name-match`: filter by statistic name regular expression.
- `--table-name-match`: filter by table name regular expression (requires `--details-enable` to split table and tablet statistics out).
- `--details-enable`: split table and tablet statistics, instead of summarizing these per server.
- `--gauges-enable`: add non-counter statistics to the output.
- `-b`/`--begin`: set the begin snapshot number.
- `-e`/`--end`: set the end snapshot number.

snapshot-diff mode means using already stored snapshots, which can be from a cluster that currently is unavailable or even deleted, 
because the snapshot-diff mode only uses the information that is stored in the locally available snapshot (JSON) data.
This gives a lot of options for investigation that otherwise would be hard or painful, and allows to investigate airgapped clusters (clusters that are not connected to the internet). 

The way to invoke snapshot-diff mode is to use the `--snapshot-diff` switch. 

If `--snapshot-diff` is used without `-b`/`--begin` <snapshot number> and `-e`/`--end` <snapshot number> options, it will present the available snapshot numbers with their timestamp and comments and ask for the option that is not specified. Otherwise the snapshot-diff is directly created and shown.

snapshot-diff without begin/end specification:
```shell
yb_stats --snapshot-diff
  0 2022-10-17 19:50:58.048195 +02:00
  1 2022-10-17 19:52:34.413494 +02:00 second snap
  2 2022-10-18 15:26:20.061213 +02:00
Enter begin snapshot: 0
Enter end snapshot: 1
192.168.66.80:12000  server   cpu_stime                                                                          654 ms               6.792 /s
192.168.66.80:12000  server   cpu_utime                                                                          311 ms               3.230 /s
192.168.66.80:12000  server   involuntary_context_switches                                                         1 csws             0.010 /s
192.168.66.80:12000  server   server_uptime_ms                                                                 96292 ms            1000.000 /s
192.168.66.80:12000  server   threads_started                                                                      4 threads           0.042 /s
192.168.66.80:12000  server   threads_started_thread_pool                                                          4 threads           0.042 /s
192.168.66.80:12000  server   voluntary_context_switches                                                       21821 csws           226.613 /s
```

snapshot-diff with begin/end specification:
```shell
yb_stats --snapshot-diff -b 0 -e 1
192.168.66.80:12000  server   cpu_stime                                                                          654 ms               6.792 /s
192.168.66.80:12000  server   cpu_utime                                                                          311 ms               3.230 /s
192.168.66.80:12000  server   involuntary_context_switches                                                         1 csws             0.010 /s
192.168.66.80:12000  server   server_uptime_ms                                                                 96292 ms            1000.000 /s
192.168.66.80:12000  server   threads_started                                                                      4 threads           0.042 /s
192.168.66.80:12000  server   threads_started_thread_pool                                                          4 threads           0.042 /s
192.168.66.80:12000  server   voluntary_context_switches                                                       21821 csws           226.613 /s
...etc...
```

The `--snapshot-diff` shows all different data points for showing differences:
- Metrics
- (YSQL) statements
- Node-exporter
- Versions (master and tablet server software versions)
- Entities (YSQL and YCQL objects (tables, indexes and materialized views), databases/keyspaces, tablets and replicas)
- Master status
- Tablet server status
- Vars (gflags)
- Health check (from the master)