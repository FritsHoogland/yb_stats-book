# --print-tablet-detail

The `--print-tablet-detail` switch takes no argument in order to lookup the tablet-detail from a live cluster, 
or a snapshot number to lookup the tablet-detail from a snapshot.

Because the tablet detail information is fetched separately for each individual tablet, it is NOT fetched by default. 
To let `yb_stats` fetch the additional data for `--print-tablet-detail`, you must add the `--extra-data` switch!

The `--print-tablet-detail` switch also requires the extra `--uuid` switch to set the UUID for the tablet to print the details.
In order to obtain the UUID to use for this switch, use the `--print-entities` option to obtain a list of tablets with their UUIDs.

Get a list of entities to obtain tablet UUID:
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
For the table ysql.yugabyte.t, there are 3 tablets. Let's pick 4abf56bde0e843cfa9de8f48ca0e6a71.

```
yb_stats --print-tablet-detail --extra-data --uuid 4abf56bde0e843cfa9de8f48ca0e6a71

192.168.66.80:9000
 General info:
  Keyspace:       yugabyte
  Object name:    t
  On disk sizes:  Total: 21.87M Consensus Metadata: 1.5K WAL Files: 2.00M SST Files: 19.87M SST Files Uncompressed: 189.64M
  State:          RUNNING
 Consensus:
  State:          Consensus queue metrics:Only Majority Done Ops: 0, In Progress Ops: 0, Cache: LogCacheStats(num_ops=0, bytes=0, disk_reads=0)
  Queue overview: Consensus queue metrics:Only Majority Done Ops: 0, In Progress Ops: 0, Cache: LogCacheStats(num_ops=0, bytes=0, disk_reads=0)
  Watermark:
  - { peer: 370474e547cc422ab838282184367b9b is_new: 0 last_received: 4.659 next_index: 660 last_known_committed_idx: 659 is_last_exchange_successful: 1 needs_remote_bootstrap: 0 member_type: VOTER num_sst_files: 4 last_applied: 4.659 }
  - { peer: 3fc85b37b3fd4332bc7ed0bcf128b5de is_new: 0 last_received: 4.659 next_index: 660 last_known_committed_idx: 659 is_last_exchange_successful: 1 needs_remote_bootstrap: 0 member_type: VOTER num_sst_files: 2 last_applied: 4.659 }
  - { peer: 35db27f008cb4a3ba7c7c5b224bacb7a is_new: 0 last_received: 4.659 next_index: 660 last_known_committed_idx: 659 is_last_exchange_successful: 1 needs_remote_bootstrap: 0 member_type: VOTER num_sst_files: 4 last_applied: 4.659 }
  Messages:
  - Entry: 0, Opid: 0.0, mesg. type: REPLICATE UNKNOWN_OP, size: 6, status: term: 0 index: 0
 LogAnchor:
  Latest log entry op id: 4.659
  Min retryable request op id: 9223372036854775807.9223372036854775807
  Last committed op id: 4.659
  Earliest needed log index: 659
 Transactions:
  - { safe_time_for_participant: { physical: 1679241188204604 logical: 1 } remove_queue_size: 0 }
 Rocksdb:
  IntentDB:
  RegularDB:
   total_size: 2051458, uncompressed_size: 19655884, name_id: 14, /mnt/d0/yb-data/tserver/data/rocksdb/table-000033e8000030008000000000004000/tablet-4abf56bde0e843cfa9de8f48ca0e6a71
   total_size: 6273456, uncompressed_size: 59741998, name_id: 13, /mnt/d0/yb-data/tserver/data/rocksdb/table-000033e8000030008000000000004000/tablet-4abf56bde0e843cfa9de8f48ca0e6a71
   total_size: 6220244, uncompressed_size: 59741913, name_id: 12, /mnt/d0/yb-data/tserver/data/rocksdb/table-000033e8000030008000000000004000/tablet-4abf56bde0e843cfa9de8f48ca0e6a71
   total_size: 6291230, uncompressed_size: 59709058, name_id: 11, /mnt/d0/yb-data/tserver/data/rocksdb/table-000033e8000030008000000000004000/tablet-4abf56bde0e843cfa9de8f48ca0e6a71
192.168.66.82:9000
 General info:
  Keyspace:       yugabyte
  Object name:    t
  On disk sizes:  Total: 84.87M Consensus Metadata: 1.5K WAL Files: 65.00M SST Files: 19.87M SST Files Uncompressed: 189.64M
  State:          RUNNING
 Consensus:
  State:          Consensus queue metrics:Only Majority Done Ops: 0, In Progress Ops: 1, Cache: LogCacheStats(num_ops=0, bytes=0, disk_reads=0)
  Queue overview:
  Watermark:
  Messages:
 LogAnchor:
  Latest log entry op id: 4.659
  Min retryable request op id: 9223372036854775807.9223372036854775807
  Last committed op id: 4.659
  Earliest needed log index: 659
 Transactions:
  - { safe_time_for_participant: { physical: 1679241188201243 } remove_queue_size: 0 }
 Rocksdb:
  IntentDB:
  RegularDB:
   total_size: 2051458, uncompressed_size: 19655884, name_id: 14, /mnt/d0/yb-data/tserver/data/rocksdb/table-000033e8000030008000000000004000/tablet-4abf56bde0e843cfa9de8f48ca0e6a71
   total_size: 6273456, uncompressed_size: 59741998, name_id: 13, /mnt/d0/yb-data/tserver/data/rocksdb/table-000033e8000030008000000000004000/tablet-4abf56bde0e843cfa9de8f48ca0e6a71
   total_size: 6220244, uncompressed_size: 59741913, name_id: 12, /mnt/d0/yb-data/tserver/data/rocksdb/table-000033e8000030008000000000004000/tablet-4abf56bde0e843cfa9de8f48ca0e6a71
   total_size: 6291230, uncompressed_size: 59709058, name_id: 11, /mnt/d0/yb-data/tserver/data/rocksdb/table-000033e8000030008000000000004000/tablet-4abf56bde0e843cfa9de8f48ca0e6a71
192.168.66.81:9000
 General info:
  Keyspace:       yugabyte
  Object name:    t
  On disk sizes:  Total: 84.87M Consensus Metadata: 1.5K WAL Files: 65.00M SST Files: 19.87M SST Files Uncompressed: 189.63M
  State:          RUNNING
 Consensus:
  State:          Consensus queue metrics:Only Majority Done Ops: 0, In Progress Ops: 2, Cache: LogCacheStats(num_ops=0, bytes=0, disk_reads=1)
  Queue overview:
  Watermark:
  Messages:
 LogAnchor:
  Latest log entry op id: 4.659
  Min retryable request op id: 9223372036854775807.9223372036854775807
  Last committed op id: 4.659
  Earliest needed log index: 659
 Transactions:
  - { safe_time_for_participant: { physical: 1679241187538899 } remove_queue_size: 0 }
 Rocksdb:
  IntentDB:
  RegularDB:
   total_size: 5205489, uncompressed_size: 49526687, name_id: 12, /mnt/d0/yb-data/tserver/data/rocksdb/table-000033e8000030008000000000004000/tablet-4abf56bde0e843cfa9de8f48ca0e6a71
   total_size: 15627161, uncompressed_size: 149320345, name_id: 11, /mnt/d0/yb-data/tserver/data/rocksdb/table-000033e8000030008000000000004000/tablet-4abf56bde0e843cfa9de8f48ca0e6a71
```
This shows that a single tablet in the case of replication factor 3 is stored at multiple tablet servers.
Therefore the first thing to show for a tablet (replica) is the hostname/ip address of the tablet server.
- General info:
  - Keyspace: The YCQL keyspace or YSQL database name.
  - Object name: the table or index name.
  - On disk sizes: the sizes (with YugabyteDB accuracy) of this single tablet.
  - State.
- Consensus:
  - The state.
  - Queue overview: this field only contains data if the replica is leader.
  - Watermark: this will list the peers (including the local replica) for the tablet on the leader.
  - Messages: this shows entries on the leader.
- Log Anchor:
  - The log anchor data is internal logging state administration.
- Transactions:
  - The transactions show HLC safe time, and might list other transactions on the leader when these are happening.
- Rocksdb:
  -  IntentDB: the file status of the SST files for the IntentDB.
  -  RegularDB: the file status of the SST files for the RegularDB. This is the actual data storage.

This is low level detail for troubleshooting. 