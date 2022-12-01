# Specifying parallel

The amount of parallelism can be set using the `--parallel` switch. By default, `yb_stats` uses a single thread for performing the work it is doing. For the work done in the code for each different type of datasource and for fetching data from the hosts fetching a specific type of data, it can perform work in parallel.

There is no parallelism for reading the data from the snapshots and presenting it.

Please mind the above description of the way parallelism works in yb_stats means that parallelism is performed at two different points. 
This means that specifying parallelism should be done with great care not to make the parallelism too high.

This is how that works; threads are used for:

1. Snapshot.
   When a snapshot is created, each different [datasource](./data_sources.md) is executed by a thread.
 
2. Requesting a hostname:port combination in a datasource thread.
   The thread for each datasource will scan each hostnamer:port combination using a thread. 

This means that setting parallelism to will start 3 threads for 3 different datasources, and perform requesting data for 3 hostname:port combinations in each of the threads. Making the total number of threads in use 9.
The reason for this combination is that most of the time in requesting data is spent idle waiting for response.
