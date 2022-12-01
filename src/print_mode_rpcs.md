# print-rpcs
Print RPC (remote procedure call) information from a snapshot.

- `--print-rpcs <snapshot number>`: print rpc information from a stored snapshot.

By default, `--print-rpcs` prints out a summary (a count of RPCs) per host and port. Use `--details-enable` to see all individual RPCs.
`--print-rpcs` includes port 13000 (YSQL), which means the YSQL connections.

Additional flags:
- `--details-enable`: print all individual RPC connections, instead of a summary.
- `--hostname-match`: filter by hostname or port regular expression.

Example:
```
% yb_stats --print-rpcs 2
----------------------------------------------------------------------------------------------------
Host: 192.168.66.80; port: 13000, count: 2; port: 7000, count: 20; port: 9000, count: 49
----------------------------------------------------------------------------------------------------
Host: 192.168.66.81; port: 13000, count: 1; port: 7000, count: 19; port: 9000, count: 41
----------------------------------------------------------------------------------------------------
Host: 192.168.66.82; port: 13000, count: 1; port: 7000, count: 57; port: 9000, count: 40
----------------------------------------------------------------------------------------------------
```

With `--details-enable` and `--hostname-match` it's posssible to see the current connections to YSQL for a node, for example:
```
% yb_stats --print-rpcs 27 --details-enable --hostname-match 80:13000

----------------------------------------------------------------------------------------------------
Host: 192.168.66.80; port: 13000, count: 2
----------------------------------------------------------------------------------------------------
192.168.66.80:13000 idle yugabyte client backend ysqlsh 127.0.0.1
192.168.66.80:13000   checkpointer
```