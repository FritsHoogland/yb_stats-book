# yb_stats snapshot results

If `yb_stats` is run with the `--snapshot` mode switch, it will try to find a directory in the current working directory by the name of `yb_stats.snaphots`. If it can't find the directory, it will try to create it, and if it fails it will stop.

Inside the `yb_stats.snapshots` directory the first snapshot will create a CSV file called `snapshot.index`. This file lists the snapshots taken, comma separated with the following fields:
- snapshot number
- snapshot timestamp
- snapshot comments

Using this file, `yb_stats` can understand the snapshot numbers, and add one to the highest number for a new snapshot. 

Another use of this file is to obtain the first snapshot timestamp for use with snapshot diffs: if a second snapshot inserts a metric that is not present in the first snapshot, it can safely assume the first snapshot value of that metric to be 0. However, it must make a guess about the approximate first snapshot time; which is where the timestamp is used.

A last use of this file is when `yb_stats` is run with the `--snapshot-list` switch: `yb_stats` will list this information, and quit.
