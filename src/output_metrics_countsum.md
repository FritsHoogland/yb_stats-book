# CountSum statistics

In the output genered by ad-hoc or snapshot-diff mode, the second group of statistics shown are 'countsum' statistics. 
These statistics are named in this way, because for the use of `yb_stats`, the count (total_count) and sum (total_sum) fields are the only usable statistical values. 
The way 'countsum' statistics work is that an event in the code that is tracked by 'countsum' statistics keeps a count for the number of times the event was triggered, and a sum for what it measures. 
In a lot of cases the unit the sum is taking is time (to capture the latency of the event), but can also be bytes (to capture the size of for example an IO), or something else.

The count and sum statistics are counters, for which the value that is used is the difference between the end and begin values.
For the count value difference:
- If the value is zero during both the begin and end snapshot, the statistic is skipped.
- If the value is non-zero and existing in the end snapshot, and the statistic is not existing in the begin snapshot, the end snapshot value is taken as value.
- If the value is non-zero and existing in the begin snapshot, and not existing in the end snapshot, the value is skipped.
- If the value is non-zero in the begin and end snapshots, but subtracting leads to zero, then the statistic is not printed. Supposedly nothing happened, but previously something happened.
- If the value is non-zero in the begin and end snapshots, but the end value is lower than the begin value: this is a suspicious situation. Currently the resulting negative value is shown.

This is how countsum statistic output looks like:
```
192.168.66.80:7000   server   handler_latency_outbound_call_queue_time                                             3                  2.899 /s avg:         0 tot:               0 us
192.168.66.80:7000   server   handler_latency_outbound_call_send_time                                              3                  2.899 /s avg:         0 tot:               0 us
192.168.66.80:7000   server   handler_latency_outbound_call_time_to_response                                       3                  2.899 /s avg:      2666 tot:            8000 us
192.168.66.80:7000   server   handler_latency_yb_master_MasterHeartbeat_TSHeartbeat                                3                  2.899 /s avg:       128 tot:             386 us
192.168.66.80:7000   server   rpc_incoming_queue_time                                                              3                  2.899 /s avg:       146 tot:             439 us
```
Explanation:

| hostname:port       | metric_type | statistic name                                        | count | count / snapshot time (s)  | sum / count | sum total   | sum unit |
|---------------------|-------------|-------------------------------------------------------|-------|----------------------------|-------------|-------------|----------|
| 192.168.66.80:7000  | server      | handler_latency_outbound_call_queue_time              | 3     | 2.899 /s                   | avg:  0     | tot:   0    | us       |
| 192.168.66.80:7000  | server      | handler_latency_outbound_call_send_time               | 3     | 2.899 /s                   | avg:  0     | tot:   0    | us       | 
| 192.168.66.80:7000  | server      | handler_latency_outbound_call_time_to_response        | 3     | 2.899 /s                   | avg:  2666  | tot: 8000   | us       |
| 192.168.66.80:7000  | server      | handler_latency_yb_master_MasterHeartbeat_TSHeartbeat | 3     | 2.899 /s                   | avg:  128   | tot:  386   | us       |
| 192.168.66.80:7000  | server      | rpc_incoming_queue_time                               | 3     | 2.899 /s                   | avg:  146   | tot:  439   | us       |

# gauges
There is no gauges-like statistic type in 'countsum' statistics.

# details enable
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
Explanation:

| hostname:port       | metric_type | object_id       | namespace | object name | statistic name                | count | count snapshot time (s) | sum / count     | sum total             | sum unit |
|---------------------|-------------|-----------------|-----------|-------------|-------------------------------|-------|-------------------------|-----------------|-----------------------|----------|
| 192.168.66.80:9000  | server      | -               | -         | -           | rpc_incoming_queue_time       | 143   | 13.877 /s               | avg:       103  | tot:           14807  | us       |
| 192.168.66.80:9000  | server      | -               | -         | -           | transaction_pool_cache        | 1     | 0.097 /s                | avg:         0  | tot:               0  | us       |
| 192.168.66.80:9000  | table       | 000000000004000 | yugabyte  | t           | log_append_latency            | 4     | 0.388 /s                | avg:        45  | tot:             182  | us       |
| 192.168.66.80:9000  | table       | 000000000004000 | yugabyte  | t           | log_entry_batches_per_group   | 3     | 0.291 /s                | avg:         1  | tot:               4  | requests |
| 192.168.66.80:9000  | table       | 000000000004000 | yugabyte  | t           | log_group_commit_latency      | 3     | 0.291 /s                | avg:      2319  | tot:            6958  | us       |
| 192.168.66.80:9000  | table       | 000000000004000 | yugabyte  | t           | log_sync_latency              | 1     | 0.097 /s                | avg:      6706  | tot:            6706  | us       |
| 192.168.66.80:9000  | table       | 000000000004000 | yugabyte  | t           | rocksdb_bytes_per_write       | 3     | 0.291 /s                | avg:        12  | tot:              36  | bytes    |
| 192.168.66.80:9000  | table       | 000000000004000 | yugabyte  | t           | rocksdb_db_write_micros       | 3     | 0.291 /s                | avg:        11  | tot:              34  | us       |

Countsum statistics are called 'course_histograms' in the YugabyteDB sourcecode, and have the fields `count` and `sum` in common with 'summaries' in prometheus, however quantile items are not available. YugabyteDB adds the fields min, mean, max, percentile_75, percentile_95, percentile_99, percentile_99_9, and percentile_99_99 to its metrics. These fields are reset when the metrics are read.
