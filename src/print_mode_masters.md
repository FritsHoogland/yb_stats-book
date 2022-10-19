# print-masters

The `--print-masters` siwtch takes a single argument, which is a snapshot number.

Additional switches:
- `--hostname-match` to filter one or more hosts.

Example:
```shell
yb_stats --print-masters 2 --hostname-match 80
--------------------------------------------------------------------------------
Source host: 192.168.66.80:7000, snapshot time: 2022-10-18 15:26:20.210094 +02:00
--------------------------------------------------------------------------------
Permanent UUID:1a11d26f9add4b799c23a1660fd0418d, Instance Seqno:1666096364509506, Start time:1666096364509506us, Cloud:local, Region:local, Zone:local, Role:FOLLOWER
RPC addresses: ( yb-2.local:7100  )
HTTP addresses: ( yb-2.local:7000  )
Permanent UUID:748f9c424d114586b29a0311d0ac4d75, Instance Seqno:1666096333830061, Start time:1666096333830061us, Cloud:local, Region:local, Zone:local, Role:LEADER
RPC addresses: ( yb-1.local:7100  )
HTTP addresses: ( yb-1.local:7000  )
Permanent UUID:c15b0b8033574547946b9aa9fdde9336, Instance Seqno:1666096396652361, Start time:1666096396652361us, Cloud:local, Region:local, Zone:local, Role:FOLLOWER
RPC addresses: ( yb-3.local:7100  )
HTTP addresses: ( yb-3.local:7000  )
```
