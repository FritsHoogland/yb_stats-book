# --stat-name-match

For the statistic names with the performance metrics for a memory or snapshot diff, as well as for the gflags name and mem-trackers id values, it is possible to filter. The filter name for that is `--stat-name-match`. This is a regex for filtering.

For example if you are only interested in master and tserver cpu statistics:
```shell
yb_stats --stat-name-match 'cpu_.time'
Begin metrics snapshot created, press enter to create end snapshot for difference calculation.

Time between snapshots:    0.900 seconds
192.168.66.80:12000  server   cpu_stime                              15 ms              16.502 /s
192.168.66.80:7000   server   cpu_stime                               2 ms               2.200 /s
192.168.66.80:7000   server   cpu_utime                               8 ms               8.801 /s
192.168.66.80:9000   server   cpu_stime                              14 ms              15.402 /s
192.168.66.81:12000  server   cpu_stime                               6 ms               6.608 /s
192.168.66.81:12000  server   cpu_utime                               9 ms               9.912 /s
192.168.66.81:7000   server   cpu_stime                               8 ms               8.801 /s
192.168.66.81:9000   server   cpu_stime                               7 ms               7.709 /s
192.168.66.81:9000   server   cpu_utime                               9 ms               9.912 /s
192.168.66.82:12000  server   cpu_stime                               6 ms               6.645 /s
192.168.66.82:12000  server   cpu_utime                              10 ms              11.074 /s
192.168.66.82:7000   server   cpu_utime                               8 ms               8.840 /s
192.168.66.82:9000   server   cpu_stime                               6 ms               6.637 /s
192.168.66.82:9000   server   cpu_utime                              11 ms              12.168 /s
```

Or a more sophisticated filter to look at tserver and master cpu time, as well as voluntary and involuntary context switches:
```shell
yb_stats --stat-name-match '(cpu_.time|voluntary_context_switches)'
Begin metrics snapshot created, press enter to create end snapshot for difference calculation.

Time between snapshots:    0.915 seconds
192.168.66.80:12000  server   cpu_utime                               12 ms              13.086 /s
192.168.66.80:12000  server   voluntary_context_switches             234 csws           255.180 /s
192.168.66.80:7000   server   cpu_stime                                2 ms               2.181 /s
192.168.66.80:7000   server   cpu_utime                                9 ms               9.815 /s
192.168.66.80:7000   server   voluntary_context_switches             105 csws           114.504 /s
192.168.66.80:9000   server   cpu_utime                                13 ms              14.177 /s
192.168.66.80:9000   server   voluntary_context_switches             235 csws           256.270 /s
192.168.66.81:12000  server   cpu_stime                                6 ms               6.550 /s
192.168.66.81:12000  server   cpu_utime                                8 ms               8.734 /s
192.168.66.81:12000  server   voluntary_context_switches             262 csws           286.026 /s
192.168.66.81:7000   server   cpu_utime                                7 ms               7.625 /s
192.168.66.81:7000   server   voluntary_context_switches              70 csws            76.253 /s
192.168.66.81:9000   server   cpu_stime                                6 ms               6.543 /s
192.168.66.81:9000   server   cpu_utime                                8 ms               8.724 /s
192.168.66.81:9000   server   voluntary_context_switches             263 csws           286.805 /s
192.168.66.82:12000  server   cpu_stime                                6 ms               6.565 /s
192.168.66.82:12000  server   cpu_utime                                8 ms               8.753 /s
192.168.66.82:12000  server   voluntary_context_switches             272 csws           297.593 /s
192.168.66.82:7000   server   cpu_utime                                8 ms               8.762 /s
192.168.66.82:7000   server   voluntary_context_switches              65 csws            71.194 /s
192.168.66.82:9000   server   cpu_stime                                6 ms               6.565 /s
192.168.66.82:9000   server   cpu_utime                                8 ms               8.753 /s
192.168.66.82:9000   server   voluntary_context_switches             269 csws           294.311 /s
```
