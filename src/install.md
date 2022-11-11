# Install

## Mac OSX via [homebrew](https://brew.sh)

Add the yb_stats "brew tap" (which is a github repository):
```shell
brew tap fritshoogland-yugabyte/yb_stats
```
Install yb_stats:
```shell
brew install yb_stats
```
yb_stats is available in /usr/local/bin, which should normally be in $PATH.

### Uninstall yb_stasts via homebrew
Remove yb_stats:
```shell
brew uninstall yb_stats
```
Remove the yb_stats "brew tap":
```shell
brew untap fritshoogland-yugabyte/yb_stats
```

## RPM based distributions

Install the provided yb_stats RPM via yum:

EL7:
```shell
sudo yum install https://github.com/fritshoogland-yugabyte/yb_stats/releases/download/v0.8.7/yb_stats-0.8.7-1.el7.x86_64.rpm
```

EL8:
```shell
sudo yum install https://github.com/fritshoogland-yugabyte/yb_stats/releases/download/v0.8.7/yb_stats-0.8.7-1.el8.x86_64.rpm
```

After yum install, yb_stats is available in /usr/local/bin, which should normally be in $PATH.

These are current latest versions. Look [yb_stats github repository releases page](https://github.com/fritshoogland-yugabyte/yb_stats/releases) for newer versions.

## Mac OSX compile from source

Install Rust via rustup:
```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.sh | sh
```

Clone the yb_stats repository:
```shell
git clone https://github.com/fritshoogland-yugabyte/yb_stats.git
```

Build yb_stats:
```shell
cd yb_stats
cargo build --release
```
yb_stats is in ./target/release/ directory.

## Linux compile from source

Install dependencies via yum:
```shell
sudo yum install -y git openssl-devel gcc
```
Install Rust via rustup:
```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.sh | sh
```

Clone the yb_stats repository:
```shell
git clone https://github.com/fritshoogland-yugabyte/yb_stats.git
```

Build yb_stats:
```shell
cd yb_stats
cargo build --release
```
yb_stats is in ./target/release/ directory.
