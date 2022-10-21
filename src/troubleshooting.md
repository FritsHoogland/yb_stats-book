# Troubleshooting

`yb_stats` by default prints as little as it can to the screen, and will therefore NOT show issues that it can overcome. 

In order to let `yb_stats` provide more information about what it encountering, you can increase the logging level. The default logging level is `error`, which will also terminate execution. This is how that is done:

Logging level warning: `warn`:
```shell
RUST_LOG=warn yb_stats
[2022-10-21T09:38:56Z WARN  yb_stats::metrics] statistic that is unknown or inconsistent: hostname_port: 192.168.66.82:12000, type: server, namespace: -, table_name: -: RejectedU64MetricValue {
        name: "threads_running_thread_pool",
        value: 18446744073709551614,
    }
[2022-10-21T09:38:56Z WARN  yb_stats::metrics] statistic that is unknown or inconsistent: hostname_port: 192.168.66.82:7000, type: cluster, namespace: -, table_name: -: RejectedBooleanMetricValue {
        name: "is_load_balancing_enabled",
        value: false,
    }
[2022-10-21T09:38:56Z WARN  yb_stats::metrics] statistic that is unknown or inconsistent: hostname_port: 192.168.66.81:12000, type: server, namespace: -, table_name: -: RejectedU64MetricValue {
        name: "threads_running_thread_pool",
        value: 18446744073709551614,
    }
[2022-10-21T09:38:56Z WARN  yb_stats::metrics] statistic that is unknown or inconsistent: hostname_port: 192.168.66.81:7000, type: cluster, namespace: -, table_name: -: RejectedBooleanMetricValue {
        name: "is_load_balancing_enabled",
        value: true,
    }
[2022-10-21T09:38:56Z WARN  yb_stats::metrics] statistic that is unknown or inconsistent: hostname_port: 192.168.66.80:12000, type: server, namespace: -, table_name: -: RejectedU64MetricValue {
        name: "threads_running_thread_pool",
        value: 18446744073709551614,
    }
[2022-10-21T09:38:56Z WARN  yb_stats::metrics] statistic that is unknown or inconsistent: hostname_port: 192.168.66.80:7000, type: cluster, namespace: -, table_name: -: RejectedBooleanMetricValue {
        name: "is_load_balancing_enabled",
        value: false,
    }
Begin metrics snapshot created, press enter to create end snapshot for difference calculation.
```
These are some statistics that do not fit the type (both have been solved, but not yet made it to a public release).
The `warn` level still is reasonably silent.

All available log levels, with increased verbosity are:
- `error` (default)
- `warn`
- `info`
- `debug`
- `trace`  

Please be aware that beyond info, the amount of output can be high.

# Advanced logging
If you want to understand more about a specific module, you can enable a logging level for that module only. This requires an understanding of the module system in rust, however, the module can be seen in the output such as seen previously:
```
[2022-10-21T09:38:56Z WARN  yb_stats::metrics] statistic that is unknown or inconsistent: hostname_port: 192.168.66.80:7000, type: ...
```
`yb_stats::metrics` is the module and submodule here.

In order to produce `trace` level logging for `yb_stats::metrics` only use:
```
RUST_LOG="yb_stats::metrics=trace" yb_stats
```

To set different logging levels for different modules, separate them with a comma:
```
RUST_LOG="yb_stats::metrics=trace,yb_stats::rpcs=info" ./target/release/yb_stats --snapshot
[2022-10-21T10:01:13Z INFO  yb_stats::rpcs] perform_rpcs_snapshot
[2022-10-21T10:01:13Z INFO  yb_stats::metrics] perform_snapshot (metrics)
[2022-10-21T10:01:13Z INFO  yb_stats::rpcs] Could not parse 192.168.66.82:9300/rpcz json data for rpcs, error: expected value at line 1 column 1
[2022-10-21T10:01:13Z INFO  yb_stats::metrics] (192.168.66.82:9300) error parsing /metrics json data for metrics, error: expected value at line 1 column 1
[2022-10-21T10:01:13Z INFO  yb_stats::rpcs] Could not parse 192.168.66.81:9300/rpcz json data for rpcs, error: expected value at line 1 column 1
[2022-10-21T10:01:13Z INFO  yb_stats::rpcs] Could not parse 192.168.66.80:9300/rpcz json data for rpcs, error: expected value at line 1 column 1
[2022-10-21T10:01:13Z INFO  yb_stats::metrics] (192.168.66.81:9300) error parsing /metrics json data for metrics, error: expected value at line 1 column 1
[2022-10-21T10:01:13Z INFO  yb_stats::metrics] (192.168.66.80:9300) error parsing /metrics json data for metrics, error: expected value at line 1 column 1
[2022-10-21T10:01:13Z TRACE yb_stats::metrics] metric_type: server, metric_id: yb.ysqlserver, metric_attribute_namespace_name: -, metric_attribute_table_name: -
[2022-10-21T10:01:13Z TRACE yb_stats::metrics] metric_type: server, metric_id: yb.cqlserver, metric_attribute_namespace_name: -, metric_attribute_table_name: -
[2022-10-21T10:01:13Z WARN  yb_stats::metrics] statistic that is unknown or inconsistent: hostname_port: 192.168.66.82:12000, type: server, namespace: -, table_name: -: RejectedU64MetricValue {
        name: "threads_running_thread_pool",
        value: 18446744073709551613,
    }
[2022-10-21T10:01:13Z TRACE yb_stats::metrics] metric_type: server, metric_id: yb.tabletserver, metric_attribute_namespace_name: -, metric_attribute_table_name: -
[2022-10-21T10:01:13Z TRACE yb_stats::metrics] metric_type: tablet, metric_id: 5abf0e6155ea4f64860325f6cfd2332a, metric_attribute_namespace_name: system, metric_attribute_table_name: transactions
[2022-10-21T10:01:13Z TRACE yb_stats::metrics] metric_type: tablet, metric_id: e0ac5a9011874a668654e97ca348833d, metric_attribute_namespace_name: system, metric_attribute_table_name: transactions
[2022-10-21T10:01:13Z TRACE yb_stats::metrics] metric_type: tablet, metric_id: 21962b8b5dbd4a6f99c3f3d5bc0780a6, metric_attribute_namespace_name: yugabyte, metric_attribute_table_name: t
```
