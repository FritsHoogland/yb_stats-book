# statements-diff mode

The purpose of statements-diff mode is to read two snapshots which must be locally stored, and show a difference report.

Additional switches:
- `--hostname-match`: filter by hostname or port regular expression.
- `--sql-length`: the maximum length of a SQL statements, for readability. Default: 80.
- `-b`/`--begin`: set the begin snapshot number.
- `-e`/`--end`: set the end snapshot number.

statements-diff mode means using already stored snapshots, which can be from a cluster that currently is unavailable or even deleted, 
because the statements-diff mode only uses the information that is stored in the locally available snapshot (JSON) data.
This gives a lot of options for investigation that otherwise would be hard or painful, and allows to investigate airgapped clusters (clusters that are not connected to the internet). 

The way to invoke versions-diff mode is to use the `--statements-diff` switch. 

If `--statements-diff` is used without `-b`/`--begin` <snapshot number> and `-e`/`--end` <snapshot number> options, 
it will present the available snapshot numbers with their timestamp and comments and ask for the option that is not specified. 
Otherwise the statements-diff is directly created and shown.

versions-diff without begin/end specification:
```shell
yb_stats --statements-diff
  0 2023-03-18 14:13:01.407795 +01:00
  1 2023-03-18 14:13:53.959694 +01:00
  2 2023-03-18 14:14:05.162338 +01:00
  3 2023-03-19 14:20:50.977417 +01:00
  4 2023-03-19 14:21:14.418544 +01:00
  5 2023-03-19 14:24:17.733927 +01:00
Enter begin snapshot: 4
Enter end snapshot: 5
192.168.66.80:13000           1 avg:           0.459 tot:           0.459 ms avg:          1 tot:          1 rows: select now()
```

statements-diff with begin/end specification:
```shell
yb_stats --statements-diff -b 4 -e 5
192.168.66.80:13000           1 avg:           0.459 tot:           0.459 ms avg:          1 tot:          1 rows: select now()
```
