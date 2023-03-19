# masters diff

Whenever `yb_stats` is used in ad-hoc diff mode or in snapshot-diff mode, it will read the master metadata from the master leader during the begin and the end snapshot.

In this way, any changes to the masters, such as a reboot/restart or a role change can be seen.

Example of a leader change because of a restart:
```
* Master b460d504c6aa488d97bfe266ab506ab6 FOLLOWER->LEADER Cloud: local, Region: local, Zone: local,
                                          Seqno: 1669798949509360, Start time: 1669798949509360
                                          Http ( yb-3.local:7000 )
                                          Rpc ( yb-3.local:7100 )
* Master d3db2544098b4b808c0c65d4d19f4d3a LEADER->FOLLOWER Cloud: local, Region: local, Zone: local,
                                          Seqno: 1669798888831913->1669824380213235, Start time: 1669798888831913->1669824380213235
                                          Http ( yb-1.local:7000 )
                                          Rpc ( yb-1.local:7100 )
```
Here the master `d3db2544098b4b808c0c65d4d19f4d3a` had it's role changed from LEADER to FOLLOWER.
In the same snapshot, the master `b460d504c6aa488d97bfe266ab506ab6` had it's role changed from FOLLOWER to LEADER.

The reason for role change from LEADER to FOLLOWER can not be seen, but the start time and the seqno properties also did change.
The change of start time shows the start time was renewed, indicating the master was restarted.
The sequence number is identical to the start time, and therefore changed along with the start time.

Please mind that if no changed happened between the begin and end snapshot, no output will be shown.
