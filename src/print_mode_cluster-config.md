# print-cluster-config
Print the current cluster configuration from a live cluster or from a snapshot.

- `--print-cluster-config <snapshot number>`: print the cluster configuration from a stored snapshot.
- `--print-cluster-config`: print the cluster configuration from a live cluster.

Example:
```
➜ yb_stats --print-cluster-config
{
  "hostname_port": "192.168.66.80:7000",
  "timestamp": "2023-03-18T14:29:18.929159+01:00",
  "version": 0,
  "replication_info": null,
  "server_blacklist": null,
  "cluster_uuid": "e9e7c5bb-9494-4a56-b3c0-c3b1d9a7caf7",
  "encryption_info": null,
  "consumer_registry": null,
  "leader_blacklist": null
}
```

This is using the `/api/v1/cluster-config` endpoint, and uses the information from the current master leader.