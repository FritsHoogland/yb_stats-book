# yb_stats --snapshot --extra-data switch

When the `--extra-data` switch is added to the `--snapshot` switch, then `yb_stats` will get detailed data for each "user table" (actual table or materialized view), "index table" (index) and "system table" (PostgreSQL catalog table), as well as for every tablet.

This requires more work to be done by `yb_stats`, which is why this is separate switch. It will request more data from all masters and tablet servers based on the number of tables and the number of tablets.
