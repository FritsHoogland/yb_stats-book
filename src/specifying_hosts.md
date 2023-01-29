# Specifying hosts

When `yb_stats` is used to run in ad-hoc mode, ad-hoc print mode or in snapshot mode, the YugabyteDB cluster nodes must be reachable, and `yb_stats` must be configured to understand the list of nodes. This is done via the switch `--hosts`, and requires a comma separated list of ip addresses or hostnames.

The default hosts for `yb_stats` are 192.168.66.80,192.168.66.81,192.168.66.82. This is unlikely to be the same for your use.

Please mind there should no be spaces between the hostnames or ipaddresses and the comma's.

Example:

```shell
yb_stats --hosts 10.1.0.1,10.1.0.2,10.1.03
```

The set hosts (as well as ports and parallellism) is stored in the file `.env` in the current working directory. 
This means that if you have different YugabyteDB clusters you want to use, you either:
- Need to specify the hosts every usage, which will still create a `.env` file, but is not used because of the specification.
- Use a different directory for each cluster.

Using a different directory is highly recommended, especially because then the snapshots will be about the cluster specified only too.