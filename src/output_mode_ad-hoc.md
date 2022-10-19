# ad-hoc mode

The purpose of ad-hoc mode is to perform testing using an available cluster, or to get information from a running cluster, which you don't want to store.

Ad-hoc mode means fetching the performance metrics at runtime, storing these in memory, and then wait for enter. 
This allows the person running `yb_stats` to perform an action against the cluster which will guaranteed be in the metrics.
After the action to be investigated is performed, enter can be pressed, which will make `yb_stats` perform another in memory shapshot, and show the difference.

This is useful for performing investigations, where this testing does not require to store the data for wider review. Think about cases where repetitive testing of something is performed, which would otherwise result high number of snapshots that will never be used again.

The way to invoke ad-hoc mode is not to specify any option when running `yb_stats`.
`yb_stats` will fetch the data, and indicate the begin metrics snapshot has been performed, and requires pressing the enter key for getting a second/end snapshot for difference calculation:
```shell
yb_stats
Begin metrics snapshot created, press enter to create end snapshot for difference calculation.
```
