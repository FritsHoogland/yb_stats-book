# print-health-check
Print the health check output from the master leader from a live cluster or from a snapshot.

- `--print-health-check <snapshot number>`: print the health check output from a stored snapshot.
- `--print-health-check`: print the health check output from a live cluster.

Example:
```
➜ yb_stats --print-health-check
{
  "hostname_port": "192.168.66.82:7000",
  "timestamp": "2023-03-18T14:42:09.572026+01:00",
  "dead_nodes": [],
  "most_recent_uptime": 261,
  "under_replicated_tablets": [],
  "failed_tablets": null
}
```

This is using the `/api/v1/health-check` endpoint, and uses the information from the current master leader.