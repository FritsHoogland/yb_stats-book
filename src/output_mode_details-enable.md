# --details-enable

By default, statistics of the metric_types table, tablet and cdc are summed by metric_type and statistic name. This is done to reduce the amount of output in an as sensible way as possible without harming facts and truth.

However, sometimes it is necessary to split up the statistics per metric_type to understand metrics about specific table, tablet or cdc metric_types statistics. This can be done using the `--details-enable` switch. This switch introduces a few more columns in the output to detail the table, tablet or cdc metric type statistics.

This is how the regular output looks like:
```shell
yb_stats --snapshot-diff -b 0 -e 1 --hostname-match 82:7000 --stat-name-match rocksdb
192.168.66.81:7000   tablet   rocksdb_block_cache_bytes_read                                                11760999 bytes       865351.998 /s
192.168.66.81:7000   tablet   rocksdb_block_cache_data_hit                                                       255 blocks          18.762 /s
192.168.66.81:7000   tablet   rocksdb_block_cache_hit                                                            548 blocks          40.321 /s
192.168.66.81:7000   tablet   rocksdb_block_cache_index_hit                                                      293 blocks          21.558 /s
192.168.66.81:7000   tablet   rocksdb_block_cache_single_touch_bytes_read                                   11760999 bytes       865351.998 /s
192.168.66.81:7000   tablet   rocksdb_block_cache_single_touch_hit                                               548 blocks          40.321 /s
192.168.66.81:7000   tablet   rocksdb_db_iter_bytes_read                                                     1695826 bytes       124775.660 /s
192.168.66.81:7000   tablet   rocksdb_no_table_cache_iterators                                                   193 iters           14.201 /s
192.168.66.81:7000   tablet   rocksdb_number_db_next                                                            2783 keys           204.768 /s
192.168.66.81:7000   tablet   rocksdb_number_db_next_found                                                      2783 keys           204.768 /s
192.168.66.81:7000   tablet   rocksdb_number_db_seek                                                             268 keys            19.719 /s
192.168.66.81:7000   tablet   rocksdb_number_db_seek_found                                                       257 keys            18.910 /s
192.168.66.81:7000   tablet   rocksdb_number_superversion_acquires                                                 3 nr               0.221 /s
```
This is filtered down to statistics that are happening on the tablet metric type.

This is how that output looks like when `--details-enable` is added:
```shell
yb_stats --snapshot-diff -b 0 -e 1 --hostname-match 82:7000 --stat-name-match rocksdb --details-enable
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_block_cache_bytes_read                                                11760999 bytes       865351.998 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_block_cache_data_hit                                                       255 blocks          18.762 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_block_cache_hit                                                            548 blocks          40.321 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_block_cache_index_hit                                                      293 blocks          21.558 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_block_cache_single_touch_bytes_read                                   11760999 bytes       865351.998 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_block_cache_single_touch_hit                                               548 blocks          40.321 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_db_iter_bytes_read                                                     1695826 bytes       124775.660 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_no_table_cache_iterators                                                   193 iters           14.201 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_number_db_next                                                            2783 keys           204.768 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_number_db_next_found                                                      2783 keys           204.768 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_number_db_seek                                                             268 keys            19.719 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_number_db_seek_found                                                       257 keys            18.910 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_number_superversion_acquires                                                 3 nr               0.221 /s
```
In this case, the statistics were generated by a single tablet. However if multiple tablets were involved, the statistics for all of these would be shown.
The `--details-enable` switch introduces a couple of extra columns:
- A column for the UUID or number of the metric object
- A column that shows the namespace and the object name.
