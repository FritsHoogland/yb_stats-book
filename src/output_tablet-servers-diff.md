# tablet-servers-diff

Whenever `yb_stats` is used in ad-hoc diff mode or in snapshot-diff mode, it will read the tablet server metadata from the master leader during the begin and the end snapshot.

In this way, any changes to the tablet servers, such as a reboot/restart or a role change can be seen.

Example of a tablet server having been restarted:
```
  0 2023-03-18 14:13:01.407795 +01:00
  1 2023-03-18 14:13:53.959694 +01:00
  2 2023-03-18 14:14:05.162338 +01:00
  3 2023-03-19 14:20:50.977417 +01:00
  4 2023-03-19 14:21:14.418544 +01:00
  5 2023-03-19 14:24:17.733927 +01:00
  6 2023-03-19 15:52:10.007082 +01:00
  7 2023-03-19 15:52:45.711866 +01:00
Enter begin snapshot: 5
Enter end snapshot: 7
= Tserver:  yb-1.local:9000, status: ALIVE, uptime: 819->40
```
Here the tablet server named yb-1.local:9000 did show a change of it's uptime from 819 to 40 seconds, which indicates a restart.
The next thing to look for from here might be `--entity-diff`, because this can cause replicas to change RAFT role.


Please mind that if no changed happened between the begin and end snapshot, no output will be shown.
