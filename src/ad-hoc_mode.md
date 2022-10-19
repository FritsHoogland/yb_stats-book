# ad-hoc mode

Ad-hoc mode means fetching the performance metrics and storing these in memory, wait for enter, and after enter is pressed, perform fetching the performance metrics and storing these in memory again, and then subtract the second memory snapshot metrics with the first memory snapshot metrics and show the difference.

This is useful for performing investigations, where this testing does not require to store the data for wider review. Think about cases where repetitive testing of something is performed, which would otherwise result high number of snapshots that will never be used again.

The way to invoke ad-hoc mode is not to specify any option when running `yb_stats`.
`yb_stats` will fetch the data, and indicate the metrics snapshot has been performed, and requires pressing the enter key for getting a second/end snapshot for difference calculation:
```shell
yb_stats
Begin metrics snapshot created, press enter to create end snapshot for difference calculation.
```

Once the first (memory) snapshot is taken, the action that needs investigating can be performed. If that is done, press enter to perform another (memory) snapshot, after which `yb_stats` will show the differences of the metrics, and the difference divided by the number of seconds between the first and second memory snapshot to get the number per second.
