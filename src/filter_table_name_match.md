# --table-name-match

`yb_stats` by default sums up per table and tablet statistics per hostname-port number combination, to try to sensibly reduce the amount of output. However, `yb_stats` can be set to display per table and tablet statistics individually using the `--details-enable` switch.

If the `--details-enable` switch is set, the table name is stored with the statistics for both the table and tablet data. The `--table-name-match` switch allows you to filter on the table name, to have the ability to look at the statistics of only the tables of interest.

Additionally, the `--table-name-match` switch can also be used for the printing the details of the entities data, which also are tables.

Example: filter for the sys.catalog (postgres catalog) entries in the master. Please mind the `--hostname-match` option is also used, because otherwise the node-exporter output would still be shown, because that data is not filtered by `--table-name-match`
```shell
yb_stats --details-enable --table-name-match catalog --hostname-match 7000
Begin metrics snapshot created, press enter to create end snapshot for difference calculation.

Time between snapshots:    0.679 seconds

Begin ad-hoc in-memory snapshot created, press enter to create end snapshot for difference calculation.

Time between snapshots:    1.621 seconds
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_block_cache_bytes_read                                                 4095007 bytes      2545063.393 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_block_cache_data_hit                                                        97 blocks          60.286 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_block_cache_hit                                                            172 blocks         106.899 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_block_cache_index_hit                                                       75 blocks          46.613 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_block_cache_single_touch_bytes_read                                    4095007 bytes      2545063.393 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_block_cache_single_touch_hit                                               172 blocks         106.899 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_db_iter_bytes_read                                                     1353537 bytes       841228.713 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_no_table_cache_iterators                                                    48 iters           29.832 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_number_db_next                                                            2180 keys          1354.879 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_number_db_next_found                                                      2225 keys          1382.846 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_number_db_seek                                                             131 keys            81.417 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_number_db_seek_found                                                       122 keys            75.823 /s
192.168.66.81:7000   tablet   00000000000000000000000000000000 sys.catalog                    rocksdb_number_superversion_acquires                                                 4 nr               2.486 /s
```
