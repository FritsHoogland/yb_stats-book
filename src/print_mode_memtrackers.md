# print-memtrackers

The `--print-memtrackers` switch takes a single argument, which is a snapshot number.

Additional switches:
- `--hostname-match` to filter one or more hosts.
- `--stat-name-match` to filter on the memory names as seen as 'id' in the output.

Example:
```shell
yb_stats --print-memtrackers 2 --hostname-match 82:700 --stat-name-match '(root|TCMalloc|server)'
--------------------------------------------------------------------------------------------------------------------------------------
Host: 192.168.66.82:7000, Snapshot number: 2, Snapshot time: 2022-10-18 15:26:20.125948 +02:00
--------------------------------------------------------------------------------------------------------------------------------------
hostname_port        id                                                  current_consumption     peak_consumption                limit
--------------------------------------------------------------------------------------------------------------------------------------
192.168.66.82:7000   root                                                             26.86M               28.09M              241.44M
192.168.66.82:7000   TCMalloc Central Cache                                           812.7K               961.9K                 none
192.168.66.82:7000   TCMalloc PageHeap Free                                            2.26M                4.73M                 none
192.168.66.82:7000   TCMalloc Thread Cache                                            716.9K                1.97M                 none
192.168.66.82:7000   TCMalloc Transfer Cache                                          985.5K                1.41M                 none
192.168.66.82:7000   server                                                  197.5K (12.62M)               232.1K                 none
```
