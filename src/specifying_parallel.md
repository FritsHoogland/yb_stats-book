# Specifying parallel

The amount of parallellism can be set using the `--parallel` switch. By default, `yb_stats` uses a single thread for performing the work it is doing. For the work done in the code for each type of data and for fetching the data from the hosts fetching a specific type of data, it can perform work in parallel.

There is no parallellism for obtain the data from the snapshots and presenting it.

Please mind the above description of the way parallellism works in yb_stats means that parallellism is performed in two steps. This means that specifying parallellism should be done with great care not to make the parallellism too high.

The first step in which parallellism is performed is running the code for the specific type of data:

- tserver, master, YCQL, YSQL metrics,
- YSQL statements,
- node-exporter metrics,  
etc.  
This will run `--parallel` number of threads for each of these types.

And then inside the code for tserver metrics, as well as YSQL statements, as well as node-exporter metrics, if `--parallel` is set to 3, it will loop over the specified nodes and inside that loop over specified ports, which will be done with `--parallel` number of threads again.


