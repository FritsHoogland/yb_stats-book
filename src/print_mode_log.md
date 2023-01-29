# print-log
Print log information from a live cluster or from a snapshot.

- `--print-log <snapshot number>`: print log information from a stored snapshot.
- `--print-log`: print log information from a live cluster.

Additional switches:
- `--hostname-match`: filter by hostname or port regular expression.
- `--log-severity` filters log lines by the letter that indicates the severity. Default: WEF, optional: I.  
- `--stat-name-match`: filters log lines by the sourcefile name and line number (such as "leader_election.cc:216") or message fields via a regular expression.
 
Explanation of the severity letters (increasing in severity):  
- I: Informal 
- W: Warning 
- E: Error
- F: Fatal

The `--print-log` option prints the log lines based on the timestamp found in the log line. 
The log lines are taken from the different servers, and ordered on time, which is the local timestamp, so you have to be aware of clock skew.
The timestamps in the logs are UTC time, so timezone settings should not require recalculation of the timestamp.

Example:
```
% yb_stats --print-log --log-severity IWEF --hostname-match '(7000|9000)
...
192.168.66.80:9000   2023-01-29 12:29:45.447729 UTC I raft_consensus.cc:3356 T 5652a6b7a4ea47d198f0142895addf09 P 414ad0910477464fb4c17dfbd912de10 [term 1 FOLLOWER]: Calling mark dirty synchronously for reason code FOLLOWER_NO_OP_COMPLETE
192.168.66.81:9000   2023-01-29 12:29:45.448503 UTC I raft_consensus.cc:3356 T 5652a6b7a4ea47d198f0142895addf09 P 8e317433953244dfbff8dea89bdd7d77 [term 1 FOLLOWER]: Calling mark dirty synchronously for reason code FOLLOWER_NO_OP_COMPLETE
192.168.66.82:7000   2023-01-29 12:29:45.448714 UTC I catalog_manager.cc:7115 Peer 8e317433953244dfbff8dea89bdd7d77 sent incremental report for 5652a6b7a4ea47d198f0142895addf09, prev state op id: -1, prev state term: 1, prev state has_leader_uuid: 1. Consensus state: current_term: 1 leader_uuid: "0f41bb1e8bc34afe801d422c3c3064b4" config { opid_index: -1 peers { permanent_uuid: "0f41bb1e8bc34afe801d422c3c3064b4" member_type: VOTER last_known_private_addr { host: "yb-3.local" port: 9100 } cloud_info { placement_cloud: "local" placement_region: "local" placement_zone: "local3" } } peers { permanent_uuid: "414ad0910477464fb4c17dfbd912de10" member_type: VOTER last_known_private_addr { host: "yb-1.local" port: 9100 } cloud_info { placement_cloud: "local" placement_region: "local" placement_zone: "local1" } } peers { permanent_uuid: "8e317433953244dfbff8dea89bdd7d77" member_type: VOTER last_known_private_addr { host: "yb-2.local" port: 9100 } cloud_info { placement_cloud: "local" placement_region: "local" placement_zone: "local2" } } }
192.168.66.82:7000   2023-01-29 12:29:45.449941 UTC I catalog_manager.cc:7115 Peer 414ad0910477464fb4c17dfbd912de10 sent incremental report for 5652a6b7a4ea47d198f0142895addf09, prev state op id: -1, prev state term: 1, prev state has_leader_uuid: 1. Consensus state: current_term: 1 leader_uuid: "0f41bb1e8bc34afe801d422c3c3064b4" config { opid_index: -1 peers { permanent_uuid: "0f41bb1e8bc34afe801d422c3c3064b4" member_type: VOTER last_known_private_addr { host: "yb-3.local" port: 9100 } cloud_info { placement_cloud: "local" placement_region: "local" placement_zone: "local3" } } peers { permanent_uuid: "414ad0910477464fb4c17dfbd912de10" member_type: VOTER last_known_private_addr { host: "yb-1.local" port: 9100 } cloud_info { placement_cloud: "local" placement_region: "local" placement_zone: "local1" } } peers { permanent_uuid: "8e317433953244dfbff8dea89bdd7d77" member_type: VOTER last_known_private_addr { host: "yb-2.local" port: 9100 } cloud_info { placement_cloud: "local" placement_region: "local" placement_zone: "local2" } } }
192.168.66.82:7000   2023-01-29 12:29:45.457672 UTC I ysql_transaction_ddl.cc:55 Verifying Transaction { transaction_id: c57ef1a4-8917-437d-8fc6-a00328d6fc95 isolation: SNAPSHOT_ISOLATION status_tablet: ecc3d88a304f4a82894229c65831bb9f priority: 15800696521729142229 start_time: { physical: 1674995385026221 } locality: GLOBAL old_status_tablet: }
192.168.66.82:7000   2023-01-29 12:29:45.459448 UTC I ysql_transaction_ddl.cc:110 Got Response for { transaction_id: c57ef1a4-8917-437d-8fc6-a00328d6fc95 isolation: SNAPSHOT_ISOLATION status_tablet: ecc3d88a304f4a82894229c65831bb9f priority: 15800696521729142229 start_time: { physical: 1674995385026221 } locality: GLOBAL old_status_tablet: }, resp: status: PENDING status_hybrid_time: 6860781098837565439 propagated_hybrid_time: 6860781098837594112 aborted_subtxn_set { }
192.168.66.80:9000   2023-01-29 12:29:45.480443 UTC I table_creator.cc:363 Created table yugabyte.t of type PGSQL_TABLE_TYPE
192.168.66.82:7000   2023-01-29 12:29:45.668880 UTC I catalog_manager.cc:4098 T 00000000000000000000000000000000 P 52d4dda57d5740459c014a1a9dc07eae: Table transaction succeeded: t [id=000033e8000030008000000000004000]
```
These are some informal messages which are produced when a table is created, and show some of the internal dealing with RAFT, and the master (indicated by port 7000, and the network address implicitly shows the master leader), managing the table and therefore tablet creation.


