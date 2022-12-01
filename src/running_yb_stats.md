# Running yb_stats

Once `yb_stats` is installed, it can be used to get metadata from a YugabyteDB cluster and to create snapshots.

If `yb_stats` is run for obtaining data, which means running in ad-hoc mode, ad-hoc print mode or snapshot mode, it must be able to access the YugabyteDB cluster nodes, and be allowed to access the different ports. 

If `yb_stats` is run for investigating snapshots using print mode or snapshot-diff mode, there is no need to access the cluster ip addresses or ports, it will use the snapshot CSV data only.
