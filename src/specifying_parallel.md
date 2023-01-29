# Specifying parallel

The amount of parallelism can be set using the `--parallel` switch. By default, `yb_stats` uses a single thread for performing the work it is doing. For the work done in the code for each different type of datasource and for fetching data from the hosts fetching a specific type of data, it can perform work in parallel.

There is no parallelism for reading the data from the snapshots and presenting it.

Please mind the above description of the way parallelism works in yb_stats means that parallelism is performed at two different points. 
This means that specifying parallelism should be done with great care not to make the parallelism too high.

This is how that works; threads are used for:

1. Snapshot.
   When a snapshot is created, each different [datasource](./data_sources.md) is executed by an individual thread in parallel.
 
2. Requesting a hostname:port combination in a datasource thread.
   The thread for each datasource will scan each hostnamer:port combination using a thread. 

Step 1 is always done in parallel, and limited by the number of concurrent active parallel threads the executable allows to create.
This means that setting parallelism to will start 3 threads for each datasource, performing requests to 3 hostname:port combinations in each of the threads. 
The reason for this combination is that most of the time in requesting data is spent idle waiting for response.

On MacOS, setting parallel to a too high number can throw errors 
- Number of files/file descriptors (tcp connect error: Too many open files (os error 24))
- Number of threads (`Err` value: ThreadPoolBuildError)
In both cases this can be solved by lowering the value for parallel.
For the `Too many open files` error, another solution can be to increase the OS/user limit for the number of open files.

MacOS: https://gist.github.com/tombigel/d503800a282fcadbee14b537735d202c
