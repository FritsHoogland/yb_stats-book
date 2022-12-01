# print-vars
Print the current vars (gflags) from a live cluster or from a snapshot.

- `--print-vars <snapshot number>`: print variables/gflags from every server (endpoint) in a stored snapshot.
- `--print-vars`: print variables/gflags from every server (endpoint) in the cluster.

Additional switches:
- `--details-enable`: print variables with 'Default' type too.
- `--hostname-match`: filter by hostname or port regular expression.
- `--stat-name-filter`: filter by variable name regular expression.

Example:
```
% yb_stats --print-vars --hostname-match 192.168.66.82:9000
192.168.66.82:9000   log_filename                                       yb-tserver                               NodeInfo
192.168.66.82:9000   placement_cloud                                    local                                    NodeInfo
192.168.66.82:9000   placement_region                                   local                                    NodeInfo
192.168.66.82:9000   placement_zone                                     local3                                   NodeInfo
192.168.66.82:9000   rpc_bind_addresses                                 0.0.0.0                                  NodeInfo
192.168.66.82:9000   webserver_interface                                                                         NodeInfo
192.168.66.82:9000   webserver_port                                     9000                                     NodeInfo
192.168.66.82:9000   client_read_write_timeout_ms                       600000                                   Custom
192.168.66.82:9000   cql_proxy_bind_address                             0.0.0.0:9042                             Custom
192.168.66.82:9000   db_block_cache_size_percentage                     10                                       Custom
192.168.66.82:9000   default_memory_limit_to_ram_ratio                  0.59999999999999998                      Custom
192.168.66.82:9000   flagfile                                           /opt/yugabyte/conf/tserver.conf          Custom
192.168.66.82:9000   fs_data_dirs                                       /mnt/d0                                  Custom
192.168.66.82:9000   global_log_cache_size_limit_mb                     32                                       Custom
192.168.66.82:9000   leader_lease_duration_ms                           4000                                     Custom
192.168.66.82:9000   log_cache_size_limit_mb                            16                                       Custom
192.168.66.82:9000   mem_tracker_tcmalloc_gc_release_bytes              5062950                                  Custom
192.168.66.82:9000   pg_yb_session_timeout_ms                           600000                                   Custom
192.168.66.82:9000   pgsql_proxy_bind_address                           0.0.0.0:5433                             Custom
192.168.66.82:9000   raft_heartbeat_interval_ms                         1000                                     Custom
192.168.66.82:9000   redis_proxy_bind_address                           0.0.0.0:6379                             Custom
192.168.66.82:9000   server_tcmalloc_max_total_thread_cache_bytes       33554432                                 Custom
192.168.66.82:9000   start_pgsql_proxy                                  true                                     Custom
192.168.66.82:9000   tserver_master_addrs                               yb-1.local:7100,yb-2.local:7100,yb-3.local:7100 Custom
192.168.66.82:9000   yb_num_shards_per_tserver                          2                                        Custom
192.168.66.82:9000   ysql_num_shards_per_tserver                        1                                        Custom
192.168.66.82:9000   regular_tablets_data_block_key_value_encoding      three_shared_parts                       Auto
192.168.66.82:9000   TEST_auto_flags_initialized                        true                                     Auto
```

This is using the new `/api/v1/varz` endpoint. For older versions, use `--print-gflags`.

The new variables/gflags page shows a classification or 'type' per variable/gflag.
- Default
- NodeInfo
- Custom
- Auto

Variables of the type `Auto` are not changed, and therefore are not shown by default.