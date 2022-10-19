# snapshot mode

Snapshot mode means fetching all metadata, and store these into CSV files. Snapshot mode does not provide any cluster details, only the number of the new snapshot:
```shell
yb_stats --snapshot
snapshot number 2
```

Performing a snapshot requires `yb_stats` to write in the current working directory. 

The first step of performing a snapshot is validating if the directory `yb_stats.snapshots` exists. If it doesn't exist, it will be created. If that fails, which can happen if the directory is not writable for example, then `yb_stats` stops execution and returns 1 indicating error.

The second step of performing a snapshot is trying to open the file `yb_stats.snapshots/snapshot.index`. If that file doesn't exist, which is the case if it's the first snapshot, it will return snapshot number 0, the first snapshot. If that file exists, it reads the CSV contents, takes the snapshot numbers, find the max snapshot value and adds 1 to it for the current snapshot number and returns that number. The number then is used to insert the snapshot number, timestamp and comments into the `yb_stats.snapshots/snapshot.index` file, which is created if it doesn't exist. If anything fails during this step, `yb_stats` is terminated and returns 1 indicating error.

The third step of performing a snapshot is that a threadpool is build with `--parallel` threads, which is used to perform the snapshots to CSV for the different datasources.
