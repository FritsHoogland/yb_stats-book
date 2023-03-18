# entities diff

Whenever `yb_stats` is used in ad-hoc diff mode or in snapshot-diff mode, it will read the entity data from the master leader during the begin and the end snapshot.
Entities are objects known to the master which deal with storing and organising the data for YSQL and YCQL.

The end snapshot will verify if the entities found with the begin snapshot, and show any difference it will find.

By default, it will skip the YugabyteDB default system databases/keyspaces:
- "00000000000000000000000000000001" |   // ycql system
- "00000000000000000000000000000002" |   // ycql system_schema
- "00000000000000000000000000000003" |   // ycql system_auth
- "00000001000030008000000000000000" |   // ysql template1
- "000033e5000030008000000000000000")    // ysql template0

When any of the following objects are added or removed, `yb_stats` will show the change:

Example diff where a YSQL database is created, and a table and an index:
```
+ Database: ysql.testdb, id: 0000414d000030008000000000000000
+ Object:   ysql.testdb.testtable, state: RUNNING, id: 0000414d00003000800000000000414e
+ Object:   ysql.testdb.testindex, state: RUNNING, id: 0000414d000030008000000000004153
+ Tablet:   ysql.testdb.testtable.13887764dbe74dfd8303d5785e5821a8 state: RUNNING, leader: yb-2.local:9100
+ Tablet:   ysql.testdb.testindex.3320638518854a2b8c0c5bed30a9861a state: RUNNING, leader: yb-3.local:9100
+ Replica:  ysql.testdb.testtable.13887764dbe74dfd8303d5785e5821a8 server: yb-2.local:9100, type: VOTER
+ Replica:  ysql.testdb.testtable.13887764dbe74dfd8303d5785e5821a8 server: yb-1.local:9100, type: VOTER
+ Replica:  ysql.testdb.testtable.13887764dbe74dfd8303d5785e5821a8 server: yb-3.local:9100, type: VOTER
+ Replica:  ysql.testdb.testindex.3320638518854a2b8c0c5bed30a9861a server: yb-2.local:9100, type: VOTER
+ Replica:  ysql.testdb.testindex.3320638518854a2b8c0c5bed30a9861a server: yb-1.local:9100, type: VOTER
+ Replica:  ysql.testdb.testindex.3320638518854a2b8c0c5bed30a9861a server: yb-3.local:9100, type: VOTER
```

And an example where the above YSQL database is dropped:
```
- Database: ysql.testdb, id: 0000414d000030008000000000000000
- Object:   ysql.testdb.testtable, state: RUNNING, id: 0000414d00003000800000000000414e
- Object:   ysql.testdb.testindex, state: RUNNING, id: 0000414d000030008000000000004153
- Tablet:   ysql.testdb.testtable.13887764dbe74dfd8303d5785e5821a8 state: RUNNING, leader: yb-2.local:9100
- Tablet:   ysql.testdb.testindex.3320638518854a2b8c0c5bed30a9861a state: RUNNING, leader: yb-3.local:9100
- Replica:  ysql.testdb.testtable.13887764dbe74dfd8303d5785e5821a8 server: yb-2.local:9100, type: VOTER
- Replica:  ysql.testdb.testtable.13887764dbe74dfd8303d5785e5821a8 server: yb-1.local:9100, type: VOTER
- Replica:  ysql.testdb.testtable.13887764dbe74dfd8303d5785e5821a8 server: yb-3.local:9100, type: VOTER
- Replica:  ysql.testdb.testindex.3320638518854a2b8c0c5bed30a9861a server: yb-2.local:9100, type: VOTER
- Replica:  ysql.testdb.testindex.3320638518854a2b8c0c5bed30a9861a server: yb-1.local:9100, type: VOTER
- Replica:  ysql.testdb.testindex.3320638518854a2b8c0c5bed30a9861a server: yb-3.local:9100, type: VOTER
```

Or detect a leader change for a tablet:
```
* Tablet:   ysql.testdb.testtable.5350a928953c4eb1aaa9eb0581a3112b state: RUNNING leader: yb-3.local:9100->yb-1.local:9100
```
