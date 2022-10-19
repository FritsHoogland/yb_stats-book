# print-entities

The `--print-entities` siwtch takes a single argument, which is a snapshot number.

Additional switches:
- `--hostname-match` to filter one or more entity source hosts.
- `--table-name-match` to filter an object name.

When using `--print-entities` to find objects and their layout on a cluster, be aware that all masters, so the leader as well as the followers provide data via the /dump-entities endpoint. Using the entities information from multiple masters can be handy to validate synchronisation and split-brain situations, but the most common usecase that I see would be to lookup objects.

Looking up object is most logical to do from the master leader, because that would be place where the cluster will get its data. Two common ways of doing that are:
- Using `--print-masters` for the snapshot number you want to use, and then look for the Role:LEADER.
- Use `--snapshot-diff`: 
```shell
yb_stats --snapshot-diff --hostname-match 7000 --gauges-enable --stat-name-match is_raft_leader -b 1 -e 2
192.168.66.80:7000   tablet   is_raft_leader                                                                       1 y/n                 +1
```
This shows that master 192.168.66.80:7000 was LEADER at end snapshot `2`, and the `+1` says that it wasn't the LEADER in snapshot 1. 

Now with this information, use `--hostname-match` to filter the master LEADER output for the snapshot, and `--table-name-match` for the object you want to see:
```shell
yb_stats --print-entities 2 --hostname-match 80 --table-name-match transactions
192.168.66.80:7000 ycql system transactions d75b983d5f8548c282034129fc2300d1 RUNNING
tablet:1150848aeb004a1b813d208c7cc60f23 RUNNING : ( VOTER,yb-1.local:9100,LEADER VOTER,yb-3.local:9100,FOLLOWER VOTER,yb-2.local:9100,FOLLOWER )
tablet:3c7ece0980cc4755a97b6ceb2df6845e RUNNING : ( VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,LEADER VOTER,yb-2.local:9100,FOLLOWER )
tablet:4b723064c6064a36afb822d8125ae24d RUNNING : ( VOTER,yb-1.local:9100,LEADER VOTER,yb-3.local:9100,FOLLOWER VOTER,yb-2.local:9100,FOLLOWER )
tablet:4ea37645092f46068250b46551623c85 RUNNING : ( VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,LEADER VOTER,yb-2.local:9100,FOLLOWER )
tablet:4eca47aa83dd47a3bc7e1d54474ddaa4 RUNNING : ( VOTER,yb-1.local:9100,LEADER VOTER,yb-3.local:9100,FOLLOWER VOTER,yb-2.local:9100,FOLLOWER )
tablet:540c6c39858d4679bf6a1ffa41417be8 RUNNING : ( VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,LEADER VOTER,yb-2.local:9100,FOLLOWER )
tablet:5abf0e6155ea4f64860325f6cfd2332a RUNNING : ( VOTER,yb-1.local:9100,LEADER VOTER,yb-3.local:9100,FOLLOWER VOTER,yb-2.local:9100,FOLLOWER )
tablet:a0820acf79bb425ea30b511e5166830e RUNNING : ( VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,LEADER VOTER,yb-2.local:9100,FOLLOWER )
tablet:d4012adab48741f98d9287715e4f94a5 RUNNING : ( VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,FOLLOWER VOTER,yb-2.local:9100,LEADER )
tablet:e0ac5a9011874a668654e97ca348833d RUNNING : ( VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,FOLLOWER VOTER,yb-2.local:9100,LEADER )
tablet:eb0f8f0ea4c446c3912ab7fe45846d0a RUNNING : ( VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,FOLLOWER VOTER,yb-2.local:9100,LEADER )
tablet:f89c996a4b724e28804d3aadfcc0c75e RUNNING : ( VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,FOLLOWER VOTER,yb-2.local:9100,LEADER )
```
