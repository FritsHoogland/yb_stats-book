# Specifying ports

When `yb_stats` is used to run in ad-hoc mode, ad-hoc print mode or in snapshot mode, the YugabyteDB cluster nodes must be reachable, and `yb_stats` must be configured to understand the list of nodes. However, it must also connect to the correct port numbers.

In most cases, the port numbers are kept default. When the port numbers are kept default, there is no need to specify ports, and the default list will be okay. This means that unless one or more default ports have been changed, there is no need to specify ports.

Another reason to specify ports is when for example node-exporter is not installed: specifying the list excluding the node-exporter port YugabyteDB uses (9300) should be done in such a case, although not required.

Please mind the default node-exporter port number is 9000, but that port is taken by the tablet server http endpoint, which is why YugabyteDB uses a different port number for node-exporter.

Example:
```shell
yb_stats --ports 7000,9000,12000,13000
```
As an example, this list excludes the 9300 port for node-exporter.

The set ports (as well as hosts and parallellism) is stored in the file `.env` in the current working directory. This means that if you have different YugabyteDB clusters you want to use, you either:
- Need to speicify the ports every usage, which will still create a `.env` file, but is not used because of the specification.
- use a different directory for each cluster.
 
Using a different directory is highly recommended, especially because then the snapshots will be about the cluster specified only too.