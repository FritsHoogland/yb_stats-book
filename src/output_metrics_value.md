# Value statistics

In the output generated by ad-hoc or snapshot-diff mode, the first group of statistics shown are value statistics. 
The captured statistics are essentially a statistic name, and a statistic value. 
The values to be displayed are ordered by hostname, metric_type and statistic name.

By default, `counters` are shown, for which the value is the difference between the end and begin values.
- If a counter is zero during both the begin and end snapshot, the statistic is skipped.
- If a counter is non-zero and existing in the end snapshot, and the statistic is not existing in the begin snapshot, the end snapshot value is taken as value.
- If a counter is non-zero and existing in the begin snapshot, and not existing in the end snapshot, the value is skipped.
- If a counter is non-zero in the begin and end snapshots, but subtracting leads to zero, then the statistic is not printed. Supposedly nothing happened, but previously something happened.
- If a counter is non-zero in the begin and end snapshots, but the end value is lower than the begin value: this is a suspicious situation. Currently the resulting negative value is shown. 


# counters 
This is how value statistic output looks like:
```
192.168.66.80:12000  server   cpu_stime                                                                            5 ms               6.188 /s
192.168.66.80:12000  server   cpu_utime                                                                            9 ms              11.139 /s
192.168.66.80:12000  server   server_uptime_ms                                                                   807 ms             998.762 /s
192.168.66.80:12000  server   voluntary_context_switches                                                         217 csws           268.564 /s
```
Explanation:

| hostname:port       | metric_type | statistic name             | value | unit | value / snapshot time (s) |
|---------------------|-------------|----------------------------|-------|------|---------------------------|
| 192.168.66.80:12000 | server      | cpu_stime                  | 5     | ms   | 6.188 /s                  |
| 192.168.66.80:12000 | server      | cpu_utime                  | 9     | ms   | 11.139 /s                 |
| 192.168.66.80:12000 | server      | server_uptime_ms           | 807   | ms   | 998.762 /s                |
| 192.168.66.80:12000 | server      | voluntary_context_switches | 217   | csws | 268.564 /s                |

# gauges
If the `--gauges-enable` switch is used, gauge values are shown alongside counter values.
A gauge value is a value that can get higher and lower during its runtime.
Therefore, we show the end value of such a value, and show the difference with the begin snapshot value with plus and minus.

- If a gauge is zero during both the begin and end snapshot, the statistic is skipped.
- If a gauge is non-zero and existing in the end snapshot, and the statistic is not existing in the begin snapshot, the end snapshot value is taken as value.
- If a gauge is non-zero and existing in the begin snapshot, and not existing in the end snapshot, the value is skipped.
- if a gauge is non-zero in the begin and end snapshots, and subtracting leads to zero, the value is printed(!).

This is how that looks like:
```
192.168.66.80:12000  server   cpu_stime                                                                           10 ms              10.893 /s
192.168.66.80:12000  server   cpu_utime                                                                            5 ms               5.447 /s
192.168.66.80:12000  server   generic_current_allocated_bytes                                               26908008 bytes           +25472
192.168.66.80:12000  server   generic_heap_size                                                             43188224 bytes               +0
192.168.66.80:12000  server   hybrid_clock_error                                                              500000 us                  +0
192.168.66.80:12000  server   hybrid_clock_hybrid_time                                               6824687165143556096 us         +3762429952
192.168.66.80:12000  server   server_uptime_ms                                                                   918 ms            1000.000 /s
192.168.66.80:12000  server   tcmalloc_current_total_thread_cache_bytes                                      2675304 bytes          +124184
192.168.66.80:12000  server   tcmalloc_max_total_thread_cache_bytes                                         33554432 bytes               +0
192.168.66.80:12000  server   tcmalloc_pageheap_free_bytes                                                   1228800 bytes           -90112
192.168.66.80:12000  server   tcmalloc_pageheap_unmapped_bytes                                               9977856 bytes               +0
192.168.66.80:12000  server   threads_running                                                                     47 threads              +0
192.168.66.80:12000  server   threads_running_CQLServer_reactor                                                    1 threads              +0
192.168.66.80:12000  server   threads_running_acceptor                                                             1 threads              +0
192.168.66.80:12000  server   threads_running_iotp_CQLServer                                                       4 threads              +0
192.168.66.80:12000  server   threads_running_rpc_thread_pool                                                     15 threads              +0
192.168.66.80:12000  server   voluntary_context_switches                                                         262 csws           285.403 /s
```
These are a gauge values:
```
192.168.66.80:12000  server   generic_current_allocated_bytes                                               26908008 bytes           +25472
192.168.66.80:12000  server   generic_heap_size                                                             43188224 bytes               +0
192.168.66.80:12000  server   hybrid_clock_error                                                              500000 us                  +0
```
Explanation:

| hostname:port       | metric_type | statistic name                  | value    | unit  | end value - begin value |
|---------------------|-------------|---------------------------------|----------|-------|-------------------------|
| 192.168.66.80:12000 | server      | generic_current_allocated_bytes | 26908008 | bytes | +25472                  |
| 192.168.66.80:12000 | server      | generic_heap_size               | 43188224 | bytes | +0                      |
| 192.168.66.80:12000 | server      | hybrid_clock_error              | 500000   | us    | +0                      |

# details 
For the metric_types of `table`, `tablet` and `cdc`, the statistics are kept per `table`, `tablet` or `cdc` object. 
To reduce the amount of data shown, these by default are summed together per server.
If the `--details-enable` switch is used, the output changes to include metric_id, namespace and object_name. 
This allows seeing the statistics per individual object.
This is how that looks like:
```
192.168.66.80:9000   server   -               -               -                              tcp_bytes_received                                                               75765 bytes         4293.608 /s
192.168.66.80:9000   server   -               -               -                              tcp_bytes_sent                                                                   80901 bytes         4584.665 /s
192.168.66.80:9000   server   -               -               -                              threads_started                                                                      5 threads           0.283 /s
192.168.66.80:9000   server   -               -               -                              transaction_pool_cache_queries                                                       1 qry              0.057 /s
192.168.66.80:9000   server   -               -               -                              voluntary_context_switches                                                        6232 csws           353.168 /s
192.168.66.80:9000   tablet   d3265ac130b2b1f yugabyte        t                              log_bytes_logged                                                                   403 bytes           22.838 /s
192.168.66.80:9000   tablet   d3265ac130b2b1f yugabyte        t                              rocksdb_bytes_written                                                               12 bytes            0.677 /s
192.168.66.80:9000   tablet   d3265ac130b2b1f yugabyte        t                              rocksdb_sequence_number                                                              2 rows             0.113 /s
192.168.66.80:9000   tablet   d3265ac130b2b1f yugabyte        t                              rocksdb_write_self                                                                   1 writes           0.056 /s
192.168.66.80:9000   tablet   d3265ac130b2b1f yugabyte        t                              rows_inserted                                                                        2 rows             0.113 /s
192.168.66.80:9000   tablet   97122de784c10a3 yugabyte        i_t_f1                         log_bytes_logged                                                                   389 bytes           22.045 /s
192.168.66.80:9000   tablet   97122de784c10a3 yugabyte        i_t_f1                         rocksdb_bytes_written                                                               12 bytes            0.677 /s
192.168.66.80:9000   tablet   97122de784c10a3 yugabyte        i_t_f1                         rocksdb_number_db_seek                                                               1 keys             0.057 /s
192.168.66.80:9000   tablet   97122de784c10a3 yugabyte        i_t_f1                         rocksdb_number_superversion_acquires                                                 1 nr               0.057 /s
192.168.66.80:9000   tablet   97122de784c10a3 yugabyte        i_t_f1                         rocksdb_sequence_number                                                              1 rows             0.057 /s
192.168.66.80:9000   tablet   97122de784c10a3 yugabyte        i_t_f1                         rocksdb_write_self                                                                   1 writes           0.056 /s
192.168.66.80:9000   tablet   97122de784c10a3 yugabyte        i_t_f1                         rows_inserted                                                                        1 rows             0.056 /s
192.168.66.80:9000   tablet   654e97ca348833d system          transactions                   log_bytes_logged                                                                  1199 bytes           67.947 /s
192.168.66.80:9000   tablet   04d3aadfcc0c75e system          transactions                   log_bytes_logged                                                                   395 bytes           22.385 /s
```
Explanation:

| hostname:port      | metric_type | object_id       | namespace | object name   | statistic name     | value | unit    | value / snapshot time (s) |
|--------------------|-------------|-----------------|-----------|---------------|--------------------|-------|---------|---------------------------|
| 192.168.66.80:9000 | server      | -               | -         | -             | tcp_bytes_received | 75765 | bytes   | 4293.608 /s               |
| 192.168.66.80:9000 | tablet      | d3265ac130b2b1f | yugabyte  | t             | log_bytes_logged   | 403   | bytes   | 22.838 /s                 |
| 192.168.66.80:9000 | tablet      | 654e97ca348833d | system    | transactions  | log_bytes_logged   | 1199  | bytes   | 67.947 /s                 |

The columns added are the third, fourth and fifth columns. 
- The third column shows the metric_id, which for the tablet is the tablet UUID, for the a table is table_id, and for cdc is ?. The snapshot stores the full metric_id, the length shown is 15 characters.
- The sixth column shows the object_name (it says 'table_name' in the attributes in the metric page, but an object can be an index or materialized view too).
- A 'server' metric_type does not carry meaningful a meaningful value in 'metric_id', and the namespace_name and object name is not present. Therefore, for server a '-' is shown. 

# details and gauges
The switches `--details-enable` and `--gauges-enable` work individually, but do influence each other.
This means that when `--gauges-enable` is set, `--details-enable` will also show gauge data per `table`, `tablet` or `cdc` object:

```
192.168.66.80:9000   server   -               -               -                              tcp_bytes_received                                                                4694 bytes         3684.458 /s
192.168.66.80:9000   server   -               -               -                              tcp_bytes_sent                                                                    4101 bytes         3218.995 /s
192.168.66.80:9000   server   -               -               -                              threads_running                                                                     46 threads              +0
192.168.66.80:9000   server   -               -               -                              ts_split_compaction_added                                                           15 reqs                +0
192.168.66.80:9000   server   -               -               -                              voluntary_context_switches                                                         413 csws           324.176 /s
192.168.66.80:9000   tablet   a06ff106f2b846d system          transactions                   follower_lag_ms                                                                     97 ms                -722
192.168.66.80:9000   tablet   a06ff106f2b846d system          transactions                   in_progress_ops                                                                      1 ops                 +0
192.168.66.80:9000   tablet   a06ff106f2b846d system          transactions                   log_wal_size                                                                   1048576 bytes               +0
192.168.66.80:9000   tablet   a06ff106f2b846d system          transactions                   raft_term                                                                            9 terms               +0
192.168.66.80:9000   tablet   cf45509727f9601 system          transactions                   follower_lag_ms                                                                    281 ms                -339
```

| hostname:port       | metric_type | object_id       | namespace | object name   | statistic name  | value    | unit    | end value - begin value |
|---------------------|-------------|-----------------|-----------|---------------|-----------------|----------|---------|-------------------------|
| 192.168.66.80:9000  | server      | -               | -         | -             | threads_running | 46       | threads | +0                      |
| 192.168.66.80:9000  | tablet      | a06ff106f2b846d | system    | transactions  | log_wal_size    | 1048576  | bytes   | +0                      |