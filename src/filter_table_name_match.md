# --table-name-match

`yb_stats` by default sums up per table and tablet statistics per hostname-port number combination, to try to sensibly reduce the amount of output. However, `yb_stats` can be set to display per table and tablet statistics individually using the `--details-enable` switch.

If the `--details-enable` switch is set, the table name is stored with the statistics for both the table and tablet data. The `--table-name-match` switch allows you to filter on the table name, to have the ability to look at the statistics of only the tables of interest.

Additionally, the `--table-name-match` switch can also be used for the printing the details of the entities data, which also are tables.

Example: filter for the sys.catalog (postgres catalog) entries in the master. Please mind the `--hostname-match` option is also used, because otherwise the node-exporter output would still be shown, because that data is not filtered by `--table-name-match`
```shell
yb_stats --details-enable --table-name-match catalog --hostname-match 7000
Begin metrics snapshot created, press enter to create end snapshot for difference calculation.

Time between snapshots:    0.679 seconds
192.168.66.80:7000   tablet   000000000000000                 sys.catalog                    rocksdb_block_cache_bytes_read                       300447 bytes       441185.022 /s
192.168.66.80:7000   tablet   000000000000000                 sys.catalog                    rocksdb_block_cache_data_hit                              6 blocks           8.811 /s
192.168.66.80:7000   tablet   000000000000000                 sys.catalog                    rocksdb_block_cache_hit                                  15 blocks          22.026 /s
192.168.66.80:7000   tablet   000000000000000                 sys.catalog                    rocksdb_block_cache_index_hit                             9 blocks          13.216 /s
192.168.66.80:7000   tablet   000000000000000                 sys.catalog                    rocksdb_block_cache_single_touch_bytes_read          300447 bytes       441185.022 /s
192.168.66.80:7000   tablet   000000000000000                 sys.catalog                    rocksdb_block_cache_single_touch_hit                     15 blocks          22.026 /s
192.168.66.80:7000   tablet   000000000000000                 sys.catalog                    rocksdb_db_iter_bytes_read                              618 bytes          907.489 /s
192.168.66.80:7000   tablet   000000000000000                 sys.catalog                    rocksdb_no_table_cache_iterators                          6 iters            8.811 /s
192.168.66.80:7000   tablet   000000000000000                 sys.catalog                    rocksdb_number_db_next                                    9 keys            13.216 /s
192.168.66.80:7000   tablet   000000000000000                 sys.catalog                    rocksdb_number_db_next_found                              9 keys            13.216 /s
192.168.66.80:7000   tablet   000000000000000                 sys.catalog                    rocksdb_number_db_seek                                    6 keys             8.811 /s
192.168.66.80:7000   tablet   000000000000000                 sys.catalog                    rocksdb_number_db_seek_found                              6 keys             8.811 /s
```
