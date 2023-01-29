# Upgrade

## Warning
Be aware that when upgrading from a version before 0.9 that the snapshot format has changed.
- Before `yb_stats` version 0.9, the snapshot data is stored as CSV.
- Starting from `yb_stats` version 0.9, the snapshot data is stored as JSON.

## Mac OSX via [homebrew](https://brew.sh)

This will upgrade the current installed version to the latest available tap version.
```shell
brew upgrade yb_stats
```

## RPM based distributions

EL7:
```shell
sudo yum upgrade https://github.com/fritshoogland-yugabyte/yb_stats/releases/download/v0.8.8/yb_stats-0.8.8-1.el7.x86_64.rpm
```

EL8:
```shell
sudo yum upgrade https://github.com/fritshoogland-yugabyte/yb_stats/releases/download/v0.8.8/yb_stats-0.8.8-1.el8.x86_64.rpm
```

These are the current latest versions. Look at [yb_stats github repository releases page](https://github.com/fritshoogland-yugabyte/yb_stats/releases) for current versions.