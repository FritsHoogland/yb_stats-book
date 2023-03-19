# --print-table-detail

The `--print-table-detail` switch takes no argument in order to lookup the table-detail from a live cluster, 
or a snapshot number to lookup the table-detail from a snapshot.

Because the table detail information is fetched separately for each individual table, it is NOT fetched by default. 
To let `yb_stats` fetch the additional data for `--print-table-detail`, you must add the `--extra-data` switch!

The `--print-table-detail` switch also requires the extra `--uuid` switch to set the UUID for the table to print the details.
In order to obtain the UUID to use for this switch, use the `--print-entities` option to obtain a list of tables with their UUIDs.
For YSQL tables, the UUID is not really a UUID, but a large hexadecimal number that composited from several components, 
such as the database OID and the table OID.

Get list of entities to obtain table UUID:
```
yb_stats --print-entities

Keyspace:     ysql.postgres id: 000033e6000030008000000000000000
Keyspace:     ysql.yugabyte id: 000033e8000030008000000000000000
Keyspace:     ysql.system_platform id: 000033e9000030008000000000000000
Object:       ysql.yugabyte.t, state: RUNNING, id: 000033e8000030008000000000004000
  Tablet:     ysql.yugabyte.t.4abf56bde0e843cfa9de8f48ca0e6a71 state: RUNNING
    Replicas: (yb-1.local:9100(VOTER:LEADER), yb-3.local:9100(VOTER), yb-2.local:9100(VOTER),)
  Tablet:     ysql.yugabyte.t.56263119ab85438481a3b5865dfc5787 state: RUNNING
    Replicas: (yb-1.local:9100(VOTER), yb-3.local:9100(VOTER), yb-2.local:9100(VOTER:LEADER),)
  Tablet:     ysql.yugabyte.t.acc6cf799c22457fb722ba9a361c54b9 state: RUNNING
    Replicas: (yb-1.local:9100(VOTER), yb-3.local:9100(VOTER:LEADER), yb-2.local:9100(VOTER),)    
```
For the table ysql.yugabyte.t, the UUID is 000033e8000030008000000000004000.

```
yb_stats --print-table-detail --extra-data --uuid 000033e8000030008000000000004000

Table UUID: 000033e8000030008000000000004000, version: 0, type: PGSQL_TABLE_TYPE, state: Running, keyspace: yugabyte, object_type: User tables, name: t
On disk size: Total: 191.69M WAL Files: 132.00M SST Files: 59.69M SST Files Uncompressed: 569.71M
Replication info:
Columns:
0    id                               int32 NOT NULL PARTITION KEY
1    f1                               string NULLABLE NOT A PARTITION KEY
Tablets:
acc6cf799c22457fb722ba9a361c54b9 hash_split: [0x0000, 0x5554], Split depth: 0, State: Running, Hidden: false, Message: Tablet reported with an active leader, Raft: FOLLOWER: yb-1.local LEADER: yb-3.local FOLLOWER: yb-2.local
56263119ab85438481a3b5865dfc5787 hash_split: [0xAAAA, 0xFFFF], Split depth: 0, State: Running, Hidden: false, Message: Tablet reported with an active leader, Raft: FOLLOWER: yb-1.local FOLLOWER: yb-3.local LEADER: yb-2.local
4abf56bde0e843cfa9de8f48ca0e6a71 hash_split: [0x5555, 0xAAA9], Split depth: 0, State: Running, Hidden: false, Message: Tablet reported with an active leader, Raft: LEADER: yb-1.local FOLLOWER: yb-3.local FOLLOWER: yb-2.local
Tasks:
```
This shows:
- The table UUID again.
- The version. A table gets a new version if it's modified.
- The type. This is a PGSQL_TABLE_TYPE, which means it's a postgres (YSQL) type object. Materialized views and indexes are also PGSQL_TABLE_TYPE objects.
- The state.
- The keyspace (database).
- The object_type. This will tell if this object is a table (user tables), index (index tables) or catalog table (system tables). A materialized view is listed as user table.
- The name.
- The on disk size. This is the total size (up to YugabyteDB accuracy) of all tablets.
- Replication info. This will show replication settings as JSON.
- The columns on the DocDB level, along with the DocDB column time, and what columns are part of of the partition key (the primary key).
- The tablets. This not only shows the amount of tablets, but also how they are split. Above shows the (default) hash split.
- Tasks. Tasks that can be happening at the tablet level are for example index backfills.



