# CountSum statistics

In the output genered by ad-hoc or snapshot-diff mode, the second group of statistics shown are 'countsum' statistics. These statistics are named in this way, because for the use of `yb_stats`, the count (total_count) and sum (total_sum) fields are the only usable statistical values. The way 'countsum' statistics work is that an event in the code that is tracked by 'countsum' statistics keeps a count for the number of times the event was triggered, and a sum for what it measures. In a lot of cases this is time (to capture latency of the event), but can also be bytes (to capture the size of for example an IO), or something else.

This is how countsum statistic output looks like:
```
192.168.66.80:7000   server   handler_latency_outbound_call_queue_time                                             3                  2.899 /s avg:         0 tot:               0 us
192.168.66.80:7000   server   handler_latency_outbound_call_send_time                                              3                  2.899 /s avg:         0 tot:               0 us
192.168.66.80:7000   server   handler_latency_outbound_call_time_to_response                                       3                  2.899 /s avg:      2666 tot:            8000 us
192.168.66.80:7000   server   handler_latency_yb_master_MasterHeartbeat_TSHeartbeat                                3                  2.899 /s avg:       128 tot:             386 us
192.168.66.80:7000   server   rpc_incoming_queue_time                                                              3                  2.899 /s avg:       146 tot:             439 us
```
- The first column contains the  ip address or hostname a colon and the port number.
- The second column is the type (metric_type) of the statistic. Possible values are server, cluster, table, tablet and cdc. Currently, countsum values are found in server and table types.
- The third column is the metric name.
- The fourth column is the count, the number of times this event was triggered.
- The fifth column is the count per second, the number of count divided by the time in the snapshot.
- If we don not count '/s', 'avg:' and 'tot:' as true columns, then:
- The sixth column is the sum amount divided by the time in the snapshot.
- The seventh column is the total sum. 
- The eighth column shows the unit of 'sum'. In the above case it's all 'us': microseconds.

If the `--details-enable` switch is used, 
```
192.168.66.80:9000   server   -               -               -                              rpc_incoming_queue_time                                                            143                 13.877 /s avg:       103 tot:           14807 us
192.168.66.80:9000   server   -               -               -                              transaction_pool_cache                                                               1                  0.097 /s avg:         0 tot:               0 us
192.168.66.80:9000   table    000000000004000 yugabyte        t                              log_append_latency                                                                   4                  0.388 /s avg:        45 tot:             182 us
192.168.66.80:9000   table    000000000004000 yugabyte        t                              log_entry_batches_per_group                                                          3                  0.291 /s avg:         1 tot:               4 requests
192.168.66.80:9000   table    000000000004000 yugabyte        t                              log_group_commit_latency                                                             3                  0.291 /s avg:      2319 tot:            6958 us
192.168.66.80:9000   table    000000000004000 yugabyte        t                              log_sync_latency                                                                     1                  0.097 /s avg:      6706 tot:            6706 us
192.168.66.80:9000   table    000000000004000 yugabyte        t                              rocksdb_bytes_per_write                                                              3                  0.291 /s avg:        12 tot:              36 bytes
192.168.66.80:9000   table    000000000004000 yugabyte        t                              rocksdb_db_write_micros                                                              3                  0.291 /s avg:        11 tot:              34 us
```
The columns added are the third, fourth and fifth columns.

- The third column shows the metric_id, which for the tablet is the tablet UUID, for the a table is table_id, and for cdc is ?.
- The fourth column shows the namespace_name.
- The sixth column shows the object_name (it says 'table_name' in the attributes in the metric page, but an object can be an index or materialized view too). A 'server' metric_type does not carry meaningful a meaningful value in 'metric_id', and the namespace_name and object name is not present. Therefore, for server a '-' is shown.

Countsum statistics are called 'course_histograms' in the YugabyteDB sourcecode, and are known as 'summaries' in prometheus. YugabyteDB adds the fields min, mean, max, percentile_75, percentile_95, percentile_99, percentile_99_9, and percentile_99_99 to its metrics. These fields are reset when the metrics are read.
