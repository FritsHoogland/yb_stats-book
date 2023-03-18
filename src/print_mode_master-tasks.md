# print-master-tasks
Print the current master tasks, last 20 user-initiated tasks and last 100 tasks started in the last 300 seconds from the master leader.

- `--print-master-tasks <snapshot number>`: print the master tasks from a stored snapshot.
- `--print-master-tasks`: print the master tasks from a live cluster.

Example:
```
➜ yb_stats --print-master-tasks
task done Truncate Tablet kComplete 3.75 min ago 473 ms Truncate Tablet RPC for tablet 0x000056279f4eeb00 -> 56263119ab85438481a3b5865dfc5787 (table t [id=000033e8000030008000000000004000]) (t [id=000033e8000030008000000000004000])
task done Truncate Tablet kComplete 3.75 min ago 575 ms Truncate Tablet RPC for tablet 0x000056279f4ee840 -> 4abf56bde0e843cfa9de8f48ca0e6a71 (table t [id=000033e8000030008000000000004000]) (t [id=000033e8000030008000000000004000])
task done Truncate Tablet kComplete 3.75 min ago 1.39 s Truncate Tablet RPC for tablet 0x000056279f4ee580 -> acc6cf799c22457fb722ba9a361c54b9 (table t [id=000033e8000030008000000000004000]) (t [id=000033e8000030008000000000004000])
```
The output shows the following fields:
- task category (task done)
- task name (Truncate Tablet)
- task state (kComplete)
- start time (2.75 min ago)
- duration (N ms)
- description (Truncate Tablet RPC for ...)

This is using the `/tasks` URL, which is present on each master server.