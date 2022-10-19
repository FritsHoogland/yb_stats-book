# print-gflags

The `--print-gflags` switch takes a single argument, which is a snapshot number.

Additional switches:
- `--hostname-match` to filter one or more hosts.
- `--stat-name-match` to filter by one or more gflag names.

Example:
```shell
 yb_stats --print-gflags 2 --hostname-match 82:700 --stat-name-match wal
--------------------------------------------------------------------------------------------------------------------------------------
Host: 192.168.66.82:7000, Snapshot number: 2, Snapshot time: 2022-10-18 15:26:20.128980 +02:00
--------------------------------------------------------------------------------------------------------------------------------------
cdc_wal_retention_time_secs                                                      14400
time_based_wal_gc_clock_delta_usec                                               0
bytes_durable_wal_write_mb                                                       1
durable_wal_write                                                                true
interval_durable_wal_write_ms                                                    1000
require_durable_wal_write                                                        false
save_index_into_wal_segments                                                     false
fs_wal_dirs                                                                      /mnt/d0
skip_wal_rewrite                                                                 true
TEST_download_partial_wal_segments                                               false
TEST_pause_rbs_before_download_wal                                               false
TEST_fault_crash_after_wal_deleted                                               0
```
