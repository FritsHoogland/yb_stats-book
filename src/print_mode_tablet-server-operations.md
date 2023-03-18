# print-tablet-server-operations
Print the current tablet server operations from each tablet server in a live cluster or from a snapshot.

- `--print-tablet-server-operations <snapshot number>`: print the tablet server operations from a stored snapshot.
- `--print-tablet-server-operations`: print the tablet server operations from a live cluster.

Example:
```
➜ yb_stats --print-tablet-server-operations
192.168.66.82:9000   acc6cf799c22457fb722ba9a361c54b9 term: 1 index: 34 WRITE_OP   53479 us.  R-P { type: kWrite consensus_round: 0x0000561862d89700 -> id { term: 1 index: 34
192.168.66.81:9000   acc6cf799c22457fb722ba9a361c54b9 term: 1 index: 35 WRITE_OP   40356 us.  R-P { type: kWrite consensus_round: 0x00005628f5fc9b00 -> id { term: 1 index: 35
192.168.66.80:9000   56263119ab85438481a3b5865dfc5787 term: 1 index: 34 WRITE_OP   18758 us.  R-P { type: kWrite consensus_round: 0x00005605e07ed000 -> id { term: 1 index: 34
192.168.66.80:9000   acc6cf799c22457fb722ba9a361c54b9 term: 1 index: 34 WRITE_OP   149000 us. R-P { type: kWrite consensus_round: 0x00005605e57224c0 -> id { term: 1 index: 34
192.168.66.80:9000   999219c1c7ce4b03bb41b568719f7c26 term: 1 index: 11 UPDATE_TRANSACTION_OP 11560 us.  R-P { type: kUpdateTransaction consensus_round: 0x00005605e1b093c0 -> id { term:
```
The output shows the following fields:
- endpoint (hostname/ip address and port number)
- tablet id
- operation id (term: N, index: N)
- transaction type (WRITE_OP, UPDATE_TRANSACTION_OP)
- total time in flight (N us.)
- description (R-P { type: ...)

This is using the `/operations` URL, which is present on each tablet server.