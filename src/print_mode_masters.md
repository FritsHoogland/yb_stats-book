# print-masters
Print the current masters from a live cluster or from a snapshot.

- `--print-masters <snapshot number>`: print masters from a stored snapshot.
- `--print-masters`: print masters from a live cluster.

Additional switches:
- `--details-enable`: print the master information from all masters.
 
In order to get the current information, `yb_stats` fetches information to learn the master leader first, and then obtains the entity information from the master leader, unless the `--details-enable` switch is set.

Example:
```
% yb_stats --print-masters
d3db2544098b4b808c0c65d4d19f4d3a LEADER   Cloud: local, Region: local, Zone: local
                                 Seqno: 1669886426374545 Start time: 1669886426374545
                                 RPC addresses: ( yb-1.local:7100  )
                                 HTTP addresses: ( yb-1.local:7000  )
5334e8170e74496c9780d64e09177010 FOLLOWER Cloud: local, Region: local, Zone: local
                                 Seqno: 1669886456237856 Start time: 1669886456237856
                                 RPC addresses: ( yb-2.local:7100  )
                                 HTTP addresses: ( yb-2.local:7000  )
b460d504c6aa488d97bfe266ab506ab6 FOLLOWER Cloud: local, Region: local, Zone: local
                                 Seqno: 1669886489682609 Start time: 1669886489682609
                                 RPC addresses: ( yb-3.local:7100  )
                                 HTTP addresses: ( yb-3.local:7000  )
```
