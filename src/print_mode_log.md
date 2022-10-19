# print-log

The `--print-log` switch takes a single argument, which is a snapshot number.

Additional switches:
- `--hostname-match` to filter one or more hosts
- `--log-severity` filters log lines by the letter that indicates the severity. Default: WEF, optional: I.  
  Explanation of the severity letters:  
    - W: Warning
    - E: Error
    - F: Fatal
    - I: Informal

Example:
```shell
yb_stats --print-log 2 --log-severity E
--------------------------------------------------------------------------------------------------------------------------------------
Host: 192.168.66.82:12000, Snapshot number: 2, Snapshot time: 2022-10-18 12:33:16.008276 +02:00
--------------------------------------------------------------------------------------------------------------------------------------
192.168.66.82:12000  2022-10-18 12:33:16.008276 +02:00 E hybrid_clock.cc:181  Too big clock skew is detected: 1.944s, while max allowed is: 0.500s; clock_skew_force_crash_bound_usec=60000000
192.168.66.82:12000  2022-10-18 12:33:17.051438 +02:00 E hybrid_clock.cc:181  Too big clock skew is detected: 1.857s, while max allowed is: 0.500s; clock_skew_force_crash_bound_usec=60000000
192.168.66.82:12000  2022-10-18 12:33:18.058483 +02:00 E hybrid_clock.cc:181  Too big clock skew is detected: 1.843s, while max allowed is: 0.500s; clock_skew_force_crash_bound_usec=60000000
192.168.66.82:12000  2022-10-18 12:33:19.062459 +02:00 E hybrid_clock.cc:181  Too big clock skew is detected: 1.823s, while max allowed is: 0.500s; clock_skew_force_crash_bound_usec=60000000
--------------------------------------------------------------------------------------------------------------------------------------
Host: 192.168.66.82:9000, Snapshot number: 2, Snapshot time: 2022-10-18 12:33:16.008276 +02:00
--------------------------------------------------------------------------------------------------------------------------------------
192.168.66.82:9000   2022-10-18 12:33:16.008276 +02:00 E hybrid_clock.cc:181  Too big clock skew is detected: 1.944s, while max allowed is: 0.500s; clock_skew_force_crash_bound_usec=60000000
192.168.66.82:9000   2022-10-18 12:33:17.051438 +02:00 E hybrid_clock.cc:181  Too big clock skew is detected: 1.857s, while max allowed is: 0.500s; clock_skew_force_crash_bound_usec=60000000
192.168.66.82:9000   2022-10-18 12:33:18.058483 +02:00 E hybrid_clock.cc:181  Too big clock skew is detected: 1.843s, while max allowed is: 0.500s; clock_skew_force_crash_bound_usec=60000000
192.168.66.82:9000   2022-10-18 12:33:19.062459 +02:00 E hybrid_clock.cc:181  Too big clock skew is detected: 1.823s, while max allowed is: 0.500s; clock_skew_force_crash_bound_usec=60000000
--------------------------------------------------------------------------------------------------------------------------------------
Host: 192.168.66.82:7000, Snapshot number: 2, Snapshot time: 2022-10-18 12:33:17.309089 +02:00
--------------------------------------------------------------------------------------------------------------------------------------
192.168.66.82:7000   2022-10-18 12:33:17.309089 +02:00 E hybrid_clock.cc:181  Too big clock skew is detected: 1.942s, while max allowed is: 0.500s; clock_skew_force_crash_bound_usec=60000000
192.168.66.82:7000   2022-10-18 12:33:18.324860 +02:00 E hybrid_clock.cc:181  Too big clock skew is detected: 1.947s, while max allowed is: 0.500s; clock_skew_force_crash_bound_usec=60000000
192.168.66.82:7000   2022-10-18 12:33:19.459784 +02:00 E hybrid_clock.cc:181  Too big clock skew is detected: 1.947s, while max allowed is: 0.500s; clock_skew_force_crash_bound_usec=60000000
--------------------------------------------------------------------------------------------------------------------------------------
Host: 192.168.66.80:12000, Snapshot number: 2, Snapshot time: 2022-10-18 12:32:44.527326 +02:00
--------------------------------------------------------------------------------------------------------------------------------------
192.168.66.80:12000  2022-10-18 12:32:44.527326 +02:00 E async_initializer.cc:95 Failed to initialize client: Timed out (yb/rpc/outbound_call.cc:484): Could not locate the leader master: GetMasterRegistration RPC (request call id 132) to 192.168.66.82:7100 timed out after 0.280sI1018 12:32:45.527978  7488 client-internal.cc:2297] Reinitialize master addresses from file: /opt/yugabyte/conf/tserver.conf
I1018 12:32:45.528049  7488 client-internal.cc:2326] New master addresses: [yb-1.local:7100,yb-2.local:7100,yb-3.local:7100]

--------------------------------------------------------------------------------------------------------------------------------------
Host: 192.168.66.80:9000, Snapshot number: 2, Snapshot time: 2022-10-18 12:32:44.527326 +02:00
--------------------------------------------------------------------------------------------------------------------------------------
192.168.66.80:9000   2022-10-18 12:32:44.527326 +02:00 E async_initializer.cc:95 Failed to initialize client: Timed out (yb/rpc/outbound_call.cc:484): Could not locate the leader master: GetMasterRegistration RPC (request call id 132) to 192.168.66.82:7100 timed out after 0.280sI1018 12:32:45.527978  7488 client-internal.cc:2297] Reinitialize master addresses from file: /opt/yugabyte/conf/tserver.conf
I1018 12:32:45.528049  7488 client-internal.cc:2326] New master addresses: [yb-1.local:7100,yb-2.local:7100,yb-3.local:7100]
```
