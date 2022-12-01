This is an overview of the data sources, the type of daemon where it comes from, the ports (if default), and the http endpoint it is using.

| Datasource       | Type           | Default Port(s)       | Endpoint               |
|------------------|----------------|-----------------------|------------------------|
| Metrics          | tserver/master | 7000,9000,12000,13000 | /metrics               |
| Statements       | tserver        | 13000                 | /statements            |
| Metrics          | node-exporter  | 9300                  | /metrics               |
| Gflags           | tserver/master | 7000,9000             | /varz                  |
| Vars             | tserver/master | 7000,9000             | /api/v1/varz           |
| Threads          | tserver/master | 7000,9000             | /threadz               |
| Mem-trackers     | tserver/master | 7000,9000             | /mem-trackers          |
| Logging          | tserver/master | 7000,9000             | /logs                  |
| Version          | tserver/master | 7000,9000             | /api/v1/version        |
| Entities         | master         | 7000                  | /dump-entities         |
| Masters          | master         | 7000                  | /api/v1/masters        |
| Tablet-servers   | master         | 7000                  | /api/v1/tablet-servers |
| RPCs             | tserver/master | 7000,9000,12000,13000 | /rpcz                  |
| Pprof            | tserver/master | 7000,9000             | /pprof/growth          |
| Memory breakdown | tserver/master | 7000,9000             | /memz                  |

Based on the datasources, these are the options for the differences sources:

| Datasource       | Snapshot | Ad-hoc | Diff | Print snap | Print ad-hoc   | Raw |
|------------------| ---      | ---    | ---  |------------|----------------|-----|
| Metrics          | ✅       | ✅      | ✅  | ❌         | ❌            | ❌  |
| Statement        | ✅       | ✅      | ✅  | ❌         | ❌            | ❌  |
| Metrics          | ✅       | ✅      | ✅  | ❌         | ❌            | ❌  |
| Gflags           | ✅       | ❌      | ❌  | ✅         | ❌            | ❌  |
| Vars             | ✅       | ✅      | ✅  | ✅         | ✅            | ❌  |
| Thread           | ✅       | ❌      | ❌  | ✅         | ❌            | ❌  |
| Mem-trackers     | ✅       | ❌      | ❌  | ✅         | ❌            | ❌  |
| Logging          | ✅       | ❌      | ❌  | ✅         | ❌            | ❌  |
| Version          | ✅       | ✅      | ✅  | ✅         | ✅            | ❌  |
| Entities         | ✅       | ✅      | ✅  | ✅         | ✅            | ❌  |
| Masters          | ✅       | ✅      | ✅  | ✅         | ✅            | ❌  |
| Tablet-servers   | ✅       | ✅      | ✅  | ✅         | ✅            | ❌  |
| RPCs             | ✅       | ❌      | ❌  | ✅         | ❌            | ❌  |
| Pprof            | ✅       | ❌      | ❌  | ❌         | ❌            | ✅  |
| Memory breakdown | ✅       | ❌      | ❌  | ❌         | ❌            | ✅  |

- Snapshot: datasources is captured with the snapshot command.
- Ad-hoc: the datasources that are involved in an ad-hoc (non-snapshot) use.
- Diff: the datasources that are involved in a snapshot-diff use. This is identical to ad-hoc, but the data taken from snapshots, instead of 'live'.
- Print: the datasources that are queryable via a yb_stats print-<datasource> command.
- Raw: the datasources that are captured in the snapshot directory, but require reading the file directly, no print or diff command exists.
