# --gauges-enable

The default output for metrics shows the values of metrics of the type *counter*. Counters are ever increasing values. In most cases, a counter value on itself is not that useful, but the difference between two points in time is. That is the reason metrics requires two snapshots: to have the ability to calculate the difference, and thus understand how much a counter has changed.

But, there are also metrics that show absolute values, for which the value is not ever increasing, but instead just shows the current situation. This means that the difference between two points in time does not provide the same meaning as for a counter. The difference between the two points in time for absolute values can still be important. Such as value is called a gauge.

By default, `yb_stats` does NOT show gauge values. To make `yb_stats` show gauge values additional to the counters, is using the `--gauges-enable` switch.

This is `yb_stats` in ad-hoc mode (not showing gauges):
```shell
yb_stats
Begin metrics snapshot created, press enter to create end snapshot for difference calculation.

Time between snapshots:    1.019 seconds
192.168.66.80:12000  server   cpu_stime                                                                            2 ms               2.200 /s
192.168.66.80:12000  server   cpu_utime                                                                           13 ms              14.301 /s
192.168.66.80:12000  server   server_uptime_ms                                                                   910 ms            1001.100 /s
192.168.66.80:12000  server   voluntary_context_switches                                                         233 csws           256.326 /s
```

This is `yb_stats` in ad-hoc mode showing gauges:
```shell
yb_stats --gauges-enable
Begin metrics snapshot created, press enter to create end snapshot for difference calculation.

Time between snapshots:    1.053 seconds
192.168.66.80:12000  server   cpu_stime                                                                            2 ms               1.927 /s
192.168.66.80:12000  server   cpu_utime                                                                           13 ms              12.524 /s
192.168.66.80:12000  server   generic_current_allocated_bytes                                               26914872 bytes            +1120
192.168.66.80:12000  server   generic_heap_size                                                             43188224 bytes               +0
192.168.66.80:12000  server   hybrid_clock_error                                                              500000 us                  +0
192.168.66.80:12000  server   hybrid_clock_hybrid_time                                               6824678428388270080 us         +4253745152
192.168.66.80:12000  server   server_uptime_ms                                                                  1038 ms            1000.000 /s
192.168.66.80:12000  server   tcmalloc_current_total_thread_cache_bytes                                      2560384 bytes          +137976
192.168.66.80:12000  server   tcmalloc_max_total_thread_cache_bytes                                         33554432 bytes               +0
192.168.66.80:12000  server   tcmalloc_pageheap_free_bytes                                                   3579904 bytes           -90112
192.168.66.80:12000  server   tcmalloc_pageheap_unmapped_bytes                                               7847936 bytes            -8192
192.168.66.80:12000  server   threads_running                                                                     45 threads              +0
192.168.66.80:12000  server   threads_running_CQLServer_reactor                                                    1 threads              +0
192.168.66.80:12000  server   threads_running_acceptor                                                             1 threads              +0
192.168.66.80:12000  server   threads_running_iotp_CQLServer                                                       4 threads              +0
192.168.66.80:12000  server   threads_running_rpc_thread_pool                                                     15 threads              +0
192.168.66.80:12000  server   voluntary_context_switches                                                         294 csws           283.237 /s
```
The gauge values can be spotted because they do not end with '/s', because they do not show its value per second. Instead, the first value is the value of the END snapshot, and the second value is the difference with the FIRST snapshot.
