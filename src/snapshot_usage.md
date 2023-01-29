# Snapshot usage

The locally stored snapshots must be available in the following way:
- The directory `yb_stats.snapshots` must be present and executable in the current working directory.
- The directory `yb_stats.snapshots` must contain a file called `snapshot.index`.
- The `snapshot.index` file must list all the available snapshots.
- The snapshots listed in `snapshot.index` must be available as directory with the snapshot number as directory name inside the `yb_stats.snapshots` directory.
- Inside the snapshot directory, the files containing the JSON data that make the snapshot must be present.

All the files in all the snapshots are UTF8 JSON files, and therefore can be easily transported. 
This means you don't have to use the same computer to view the snapshot output: if the `yb_stats.snapshot` directory and its contents are zipped, they can be copied and shared.
This means you can unzip a snapshots file, and investigate it on your own computer, without the need for access to the cluster where the snapshots came from.

## Security restrictions
Because the snapshots are UTF8 JSON files, the files can be inspected by security officers to inspect existence of security issues or secret data.

`yb_stats` does only store cluster metadata, no actual data. `yb_stats` does store (part of) the logfiles, so these potentially can report actual data.