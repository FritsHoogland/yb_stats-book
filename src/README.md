# README

Welcome to the `yb_stats` book.

This is documentation of the [yb_stats project](https://github.com/fritshoogland-yugabyte/yb_stats.git). 

`yb_stats` is a CLI tool to extract all facts from a [YugabyteDB](https://github.com/yugabyte/yugabyte-db.git) cluster, and store these in CSV files to persist the facts, and make them easy to transport.

The way `yb_stats` works is that it tries to obtain information from the http endpoints using the least amount of dependencies, which means using only the `yb_stats` tool and the http endpoints.

The tools provides 5 general ways of usage:
- Adhoc mode: extract and store performance metrics into memory, then wait for enter to allow the actions to be investigated be performed, and extract and store the performance metrics into memory again, and show the differences.
- Snapshot mode: extract and store all figures to CSV files, and display the snapshot number.
- Snapshot-diff mode: extract the performance metrics from CSV files from snapshots of two different snapshots, and show the differences. This performs the same output as ad-hoc mode, but the metrics taken from snapshots instead of ad-hoc.
- Print mode: use the print functions for other data than performance metrics to be displayed that are stored in a snapshot, such as version, gflags, etc. 
- Raw mode: you can always look into the stored CSV files yourself. However, for two sources of data, there is no function in yb_stats to publish the results: http endpoint `/pprof/growth` output, and `/memz` output.
