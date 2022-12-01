# tablet servers diff

Whenever `yb_stats` is used in ad-hoc diff mode or in snapshot-diff mode, it will read the tablet servers metadata from the master leader during the begin and the end snapshot.

In this way, a restart of a tablet server can be detected.

Example of a tablet server restart:
```
* Tserver: yb-1.local:9000, status: ALIVE, uptime: 1108->0 (reboot)
```

Or when a tablet server is found dead:
```
* Tserver: yb-1.local:9000, status: ALIVE->DEAD, uptime: 286->0 (reboot)
```