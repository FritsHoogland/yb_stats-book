# README

Welcome to the `yb_stats` book.

This is documentation of the [yb_stats project](https://github.com/fritshoogland-yugabyte/yb_stats.git). 

`yb_stats` is a CLI tool to query, investigate and extract all facts from a [YugabyteDB](https://github.com/yugabyte/yugabyte-db.git) cluster, and store these in CSV files to persist the facts, and make them easy to transport.

The way `yb_stats` works is that it tries to obtain information from the YugabyteDB and node-exporter http endpoints using the least amount of dependencies, which means using only the `yb_stats` tool and the http endpoints.

The tools provides 5 general ways of usage:
- Ad-hoc mode: request and store performance metrics and status data into memory, wait for enter to allow the actions to be investigated to be performed. Pressing enter will request and store the performance metrics and status data into memory again, for which the differences will be shown.
- Snapshot mode: request and store all performance metrics and status data to CSV files and display the snapshot number.
- Snapshot-diff mode: request the performance metrics and status data from the CSV files from snapshots of two different snapshots, and show the differences. This performs the same output as ad-hoc mode, but the metrics taken from snapshots instead of ad-hoc.
- Print snapshot mode: use the print functions with a snapshot number for data to be displayed that is stored in a snapshot, such as version, vars, etc. 
- Print adhoc mode: use the print functions without a snapshot number for data to be displayed that is stored in a snapshot, such as version, vars, etc. 
- Raw mode: you can always look into the stored CSV files yourself. However, for two sources of data, there is no function in yb_stats to publish the results: http endpoint `/pprof/growth` output, and `/memz` output.
