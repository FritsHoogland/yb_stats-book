# print-version
Print version information from a live cluster or from a snapshot.

- `--print-version <snapshot number>`: print version information from stored snapshot.
- `--print-version`: print version information from a live cluster.
 
Additional switches:
- `--hostname-match`: filter by hostname or port regular expression.

Example:
```
% yb_stats --print-version
hostname_port        version_number  build_nr   build_type build_timestamp          git_hash
192.168.66.82:9000   2.15.3.2        1          RELEASE    04 Nov 2022 16:53:01 UTC 5ef608b43a994ab03a12ed3359258ec156d04a14
192.168.66.82:7000   2.15.3.2        1          RELEASE    04 Nov 2022 16:53:01 UTC 5ef608b43a994ab03a12ed3359258ec156d04a14
192.168.66.81:9000   2.15.3.2        1          RELEASE    04 Nov 2022 16:53:01 UTC 5ef608b43a994ab03a12ed3359258ec156d04a14
192.168.66.81:7000   2.15.3.2        1          RELEASE    04 Nov 2022 16:53:01 UTC 5ef608b43a994ab03a12ed3359258ec156d04a14
192.168.66.80:9000   2.15.3.2        1          RELEASE    04 Nov 2022 16:53:01 UTC 5ef608b43a994ab03a12ed3359258ec156d04a14
192.168.66.80:7000   2.15.3.2        1          RELEASE    04 Nov 2022 16:53:01 UTC 5ef608b43a994ab03a12ed3359258ec156d04a14
```
