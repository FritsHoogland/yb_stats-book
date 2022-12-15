# versions-diff mode

The purpose of versions-diff mode is to read two snapshots which must be locally stored, and show a difference report.

Additional switches:
- `--hostname-match`: filter by hostname or port regular expression.
- `-b`/`--begin`: set the begin snapshot number.
- `-e`/`--end`: set the end snapshot number.

versions-diff mode means using already stored snapshots, which can be from a cluster that currently is unavailable or even deleted, because the versions-diff mode only uses the information that is stored in the locally available snapshot (CSV) data.
This gives a lot of options for investigation that otherwise would be hard or painful, and allows to investigate airgapped clusters (clusters that are not connected to the internet). 

The way to invoke versions-diff mode is to use the `--versions-diff` switch. 

If `--versions-diff` is used without `-b`/`--begin` <snapshot number> and `-e`/`--end` <snapshot number> options, it will present the available snapshot numbers with their timestamp and comments and ask for the option that is not specified. Otherwise the versions-diff is directly created and shown.

versions-diff without begin/end specification:
```shell
yb_stats --versions-diff
  0 2022-12-08 16:42:01.226043 +01:00
  1 2022-12-09 16:34:08.057222 +01:00
  2 2022-12-10 16:07:57.948800 +01:00
  3 2022-12-10 21:39:04.439287 +01:00
  4 2022-12-10 21:39:33.664075 +01:00
  5 2022-12-10 21:42:56.852644 +01:00
  6 2022-12-10 21:43:00.348445 +01:00
Enter begin snapshot: 5
Enter end snapshot: 6

```
No output means there is no version difference between the two snapshots.

versions-diff with begin/end specification:
```shell
yb_stats --snapshot-diff -b 0 -e 1
* 192.168.66.80:7000   Versions: 2.15.3.2->2.17.0.0 b1->b24 RELEASE 04 Nov 2022 16:53:01 UTC->16 Nov 2022 00:21:52 UTC 5ef608b43a994ab03a12ed3359258ec156d04a14->d4f01a5e26b168585e59f9c1a95766ffdd9655b1
* 192.168.66.80:9000   Versions: 2.15.3.2->2.17.0.0 b1->b24 RELEASE 04 Nov 2022 16:53:01 UTC->16 Nov 2022 00:21:52 UTC 5ef608b43a994ab03a12ed3359258ec156d04a14->d4f01a5e26b168585e59f9c1a95766ffdd9655b1
* 192.168.66.81:7000   Versions: 2.15.3.2->2.17.0.0 b1->b24 RELEASE 04 Nov 2022 16:53:01 UTC->16 Nov 2022 00:21:52 UTC 5ef608b43a994ab03a12ed3359258ec156d04a14->d4f01a5e26b168585e59f9c1a95766ffdd9655b1
* 192.168.66.81:9000   Versions: 2.15.3.2->2.17.0.0 b1->b24 RELEASE 04 Nov 2022 16:53:01 UTC->16 Nov 2022 00:21:52 UTC 5ef608b43a994ab03a12ed3359258ec156d04a14->d4f01a5e26b168585e59f9c1a95766ffdd9655b1
* 192.168.66.82:7000   Versions: 2.15.3.2->2.17.0.0 b1->b24 RELEASE 04 Nov 2022 16:53:01 UTC->16 Nov 2022 00:21:52 UTC 5ef608b43a994ab03a12ed3359258ec156d04a14->d4f01a5e26b168585e59f9c1a95766ffdd9655b1
* 192.168.66.82:9000   Versions: 2.15.3.2->2.17.0.0 b1->b24 RELEASE 04 Nov 2022 16:53:01 UTC->16 Nov 2022 00:21:52 UTC 5ef608b43a994ab03a12ed3359258ec156d04a14->d4f01a5e26b168585e59f9c1a95766ffdd9655b1
```
