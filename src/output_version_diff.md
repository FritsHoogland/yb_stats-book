# version diff

Whenever `yb_stats` is used in ad-hoc diff mode or in snapshot-diff mode, it will read the version using the `/api/v1/version` endpoint.
This is executed for both the masters and the tablet servers.
This is done during the begin and end snapshots.

Example of changed versions on all servers between and begin and end snapshot:
```
* ip-172-158-59-19:7000 Versions: 2.17.1.0 184->201 RELEASE 09 Nov 2022 22:48:49 UTC->14 Nov 2022 13:07:31 UTC 971d32f9bf50d11c067bda4b5498d27611583c2c->d9d98761806ef4f37f501e2eb40bb7dcd981bb65
* ip-172-158-59-19:9000 Versions: 2.17.1.0 184->201 RELEASE 09 Nov 2022 22:48:49 UTC->14 Nov 2022 13:07:31 UTC 971d32f9bf50d11c067bda4b5498d27611583c2c->d9d98761806ef4f37f501e2eb40bb7dcd981bb65
```
This shows that on the servers `ip-172-158-59-19:7000` and `ip-172-158-59-19:9000` there have been version changes.

- The version stayed the same.
- The build number changed from `184` to `201`.
- The build date changed from `09 Nov 2022 22:48:49 UTC` to `14 Nov 2022 13:07:31 UTC`.
- The build git hash changed from `971d32f9bf50d11c067bda4b5498d27611583c2c` to `d9d98761806ef4f37f501e2eb40bb7dcd981bb65`.