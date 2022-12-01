# print-entities
Print entities (database, database object, tablet, replica) from a live cluster or from a snapshot.

- `--print-entities <snapshot number>`: print entities from a stored snapshot.
- `--print-entities`: print entities from a live cluster.
 
Additional switches:
- `--hostname-match`: filter by hostname or port regular expression.
- `--table-name-match`: filter by object name regular expression.
- `--details-enable`: print the entity information from all masters.

The entity information is available on the masters, on the leader and the followers.
In order to get the current information, `yb_stats` fetches information to learn the master leader first, and then obtains the entity information from the master leader, unless the `--details-enable` switch is set.

For YSQL objects/entities, `yb_stats` takes the OID from the object id and filters out OIDs lower than 16384, because these are system OIDs.

Example:
```
% yb_stats --print-entities
Object:   ysql.yugabyte.t, state: RUNNING, id: 000033e8000030008000000000004000
Tablet:   ysql.yugabyte.t.7f4fc16eba28432e8ed2baf4603f9590 state: RUNNING
            ( VOTER,yb-2.local:9100,LEADER VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,FOLLOWER )
Tablet:   ysql.yugabyte.t.ce1302dada834f619e67dffc847a80fe state: RUNNING
            ( VOTER,yb-2.local:9100,FOLLOWER VOTER,yb-1.local:9100,LEADER VOTER,yb-3.local:9100,FOLLOWER )
Tablet:   ysql.yugabyte.t.f035128dd43d43d3a1a9d4c44727df99 state: RUNNING
            ( VOTER,yb-2.local:9100,FOLLOWER VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,LEADER )
Object:   ysql.yugabyte.tt, state: RUNNING, id: 000033e8000030008000000000004100
Tablet:   ysql.yugabyte.tt.3ae53662d5374897b8a55899f7ceb9c4 state: RUNNING
            ( VOTER,yb-2.local:9100,FOLLOWER VOTER,yb-1.local:9100,LEADER VOTER,yb-3.local:9100,FOLLOWER )
Tablet:   ysql.yugabyte.tt.880a7b69ae4a474b96d3ff0b7117867b state: RUNNING
            ( VOTER,yb-2.local:9100,LEADER VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,FOLLOWER )
Tablet:   ysql.yugabyte.tt.e844bce904794c9799301a2a95cdbe82 state: RUNNING
            ( VOTER,yb-2.local:9100,FOLLOWER VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,LEADER )
Object:   ysql.yugabyte.ysql_bench_history, state: RUNNING, id: 000033e800003000800000000000413b
Tablet:   ysql.yugabyte.ysql_bench_history.11476b9ff3bd4cdeb89a6b188de44b51 state: RUNNING
            ( VOTER,yb-2.local:9100,FOLLOWER VOTER,yb-1.local:9100,LEADER VOTER,yb-3.local:9100,FOLLOWER )
Tablet:   ysql.yugabyte.ysql_bench_history.1f01c2e8a9ba467b8495b304649bcbde state: RUNNING
            ( VOTER,yb-2.local:9100,LEADER VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,FOLLOWER )
Tablet:   ysql.yugabyte.ysql_bench_history.fd9094233dc04e9fa17084b99c42fea6 state: RUNNING
            ( VOTER,yb-2.local:9100,FOLLOWER VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,LEADER )
Object:   ysql.yugabyte.ysql_bench_tellers, state: RUNNING, id: 000033e800003000800000000000413e
Tablet:   ysql.yugabyte.ysql_bench_tellers.918cba44a4d34b699aab6a53eb2399bf state: RUNNING
            ( VOTER,yb-2.local:9100,LEADER VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,FOLLOWER )
Tablet:   ysql.yugabyte.ysql_bench_tellers.a0a6a3f68cfd4ce697f9c412b74cf84d state: RUNNING
            ( VOTER,yb-2.local:9100,FOLLOWER VOTER,yb-1.local:9100,LEADER VOTER,yb-3.local:9100,FOLLOWER )
Tablet:   ysql.yugabyte.ysql_bench_tellers.d2b6e484972c4443868e1887d05bc7a4 state: RUNNING
            ( VOTER,yb-2.local:9100,FOLLOWER VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,LEADER )
Object:   ysql.yugabyte.ysql_bench_accounts, state: RUNNING, id: 000033e8000030008000000000004143
Tablet:   ysql.yugabyte.ysql_bench_accounts.43e33bb5a7a34a4c8b631d08f4544165 state: RUNNING
            ( VOTER,yb-2.local:9100,LEADER VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,FOLLOWER )
Tablet:   ysql.yugabyte.ysql_bench_accounts.634d9612c86e4a98a9ffdba70a76227f state: RUNNING
            ( VOTER,yb-2.local:9100,FOLLOWER VOTER,yb-1.local:9100,LEADER VOTER,yb-3.local:9100,FOLLOWER )
Tablet:   ysql.yugabyte.ysql_bench_accounts.da848f4a61ea43c7a7d903b1c28b6942 state: RUNNING
            ( VOTER,yb-2.local:9100,FOLLOWER VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,LEADER )
Object:   ysql.yugabyte.ysql_bench_branches, state: RUNNING, id: 000033e8000030008000000000004148
Tablet:   ysql.yugabyte.ysql_bench_branches.b243250ea9f145ccbb68119be37f540d state: RUNNING
            ( VOTER,yb-2.local:9100,LEADER VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,FOLLOWER )
Tablet:   ysql.yugabyte.ysql_bench_branches.b948c3f199954959b295c78d6f3f99c7 state: RUNNING
            ( VOTER,yb-2.local:9100,FOLLOWER VOTER,yb-1.local:9100,LEADER VOTER,yb-3.local:9100,FOLLOWER )
Tablet:   ysql.yugabyte.ysql_bench_branches.d456575fb4a04b9ea9e438b93129aa2f state: RUNNING
            ( VOTER,yb-2.local:9100,FOLLOWER VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,LEADER )
Object:   ysql.testdb.testtable, state: RUNNING, id: 00004154000030008000000000004155
Tablet:   ysql.testdb.testtable.5350a928953c4eb1aaa9eb0581a3112b state: RUNNING
            ( VOTER,yb-2.local:9100,LEADER VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,FOLLOWER )
Object:   ysql.testdb.testindex, state: RUNNING, id: 0000415400003000800000000000415a
Tablet:   ysql.testdb.testindex.16c89cf34d054f0fb9116534d366ec33 state: RUNNING
            ( VOTER,yb-2.local:9100,FOLLOWER VOTER,yb-1.local:9100,FOLLOWER VOTER,yb-3.local:9100,LEADER )
```
Using the `/dump-entities` endpoint it's not possible to make a distinction between the object types of table, index or materialized view.  

- For every object, a full name is shown in the form of `[database type].[database/keyspace].[object name]`, the state and the id of the object.
- An object contains one or more tablets. 
- For every tablet: a full name is shown in the form of `[database type].[database/keyspace].[object name].[tablet id]`. 
- A tablet has no name, only an id.
- For every tablet there is also the replica information in between brackets. For every replica, the type, RPC hostname and port and follower or leader designation.
