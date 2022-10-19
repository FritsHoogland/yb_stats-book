# Crontab

In lots of cases it might be really convenient to have historical snapshots, so you can "look back in time". This can be done by scheduling running `yb_stats` via the crontab.

1. Install yb_stats using the RPM.
See [install](./install.md)

2. Create a directory on a filesystem with enough diskspace
```
mkdir /home/yugabyte/yb_stats-history
```
In this example a directory in the home directory of the yugabyte user is used.
It is hard to specify 'enough' for the above statement of 'with enough diskspace'. It depends on the size of the cluster.
In general it's best to run `yb_stats` in a separate directory, so that it can use it's own `.env` file.

3. Setup run configuration with `.env`
```
cd /home/yugabyte/yb_stats-history
yb_stats --hosts 10.1.2.0,10.1.2.1,10.1.2.3 --parallel 3
```
This will trigger ad-hoc mode, press enter and validate if it fetched the correct hosts and endpoints.
Be conservative with parallellism. See [parallel](./specifying_parallel.md)

4. Schedule `yb_stats` in crontab
```
crontab -e
5 */1 * * * yb_stats_path="/home/yugabyte/yb_stats-history" && (date && cd $yb_stats_path && /usr/local/bin/yb_stats --snapshot) >> $yb_stats_path/yb_stats_run.out 2>&1
```



-----experimental  

5. Let logrotate cleanup old yb-stats snapshots:
```shell
vi /etc/logrotate.d/yb_stats
```
File contents:
```
/home/yugabyte/yb_stats-history/yb_stats.snapshots {
	daily
	rotate 7
	missingok
}
```
Mind the place from where logrotate scans the files (`/home/yugabyte/yb_stats-history/yb_stats.snapshots`), and the cleaning schedule: `daily` logrotate will allow files that are not touched for 7 times: so files are kept for a week.

This currently will leave the removed snapshots in the snapshot.index file.
