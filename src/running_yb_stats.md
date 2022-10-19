# Running yb_stats

Once `yb_stats` is installed, it can be used to obtain data, and to investigate snapshots.

If `yb_stats` is run for obtaining data, which means running in ad-hoc mode or snapshot mode, it must be able to access the YugabyteDB cluster nodes, and be allowed to access the different ports. 

If `yb_stats` is run for looking at snapshots, there is no need to access the cluster ip addresses or ports, it will use the snapshot CSV data only.
