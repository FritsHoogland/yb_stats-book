# Node-exporter statistics

In the output of ad-hoc or snapshot-diff mode, if node-exporter is installed on the YugabyteDB cluster, the last group of statistics that are shown are the node-exporter statistics. 
The captured statistics are essentially a statistic name and a statistic value. 
The values to be displayed are ordered by hostname, metric_type and metric_name.

By default, `counter` values are shown, for which the value is the difference between the end and begin values.
- If a counter is zero during both the begin and end snapshot, the statistic is skipped.
- If a counter is non-zero and existing in the end snapshot, and the statistic is not existing in the begin snapshot, the end snapshot value is taken as value.
- If a counter is non-zero and existing in the begin snapshot, and not existing in the end snapshot, the value is skipped.
- If a counter is non-zero in the begin and end snapshots, but subtracting leads to zero, then the statistic is not printed. Supposedly nothing happened, but previously something happened.
- If a counter is non-zero in the begin and end snapshots, but the end value is lower than the begin value: this is a suspicious situation. Currently the resulting negative value is shown.

This is how node-exporter statistics output looks like:
```
192.168.66.80:9300   counter  node_context_switches_total                                                       7759.000000         862.111 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_idle                                                          8.150000           0.906 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_irq                                                           0.310000           0.034 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_softirq                                                       0.120000           0.013 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_system                                                        0.170000           0.019 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_user                                                          0.010000           0.001 /s
```
Explanation:

| hostname:port       | metric_type | statistic_name                  | value        | value / snapshot time (s) |
|---------------------|-------------|---------------------------------|--------------|---------------------------|
| 192.168.66.80:9300  | counter     | node_context_switches_total     | 7759.000000  | 862.111 /s                |
| 192.168.66.80:9300  | counter     | node_cpu_seconds_total_idle     | 8.150000     | 0.906 /s                  |
| 192.168.66.80:9300  | counter     | node_cpu_seconds_total_irq      | 0.310000     | 0.034 /s                  |
| 192.168.66.80:9300  | counter     | node_cpu_seconds_total_softirq  | 0.120000     | 0.013 /s                  |
| 192.168.66.80:9300  | counter     | node_cpu_seconds_total_system   | 0.170000     | 0.019 /s                  |
| 192.168.66.80:9300  | counter     | node_cpu_seconds_total_user     | 0.010000     | 0.001 /s                  |

# gauges
If the `--gauges` enable switch is used, gauge type values are shown alongside counter values. 

- If a gauge is zero during both the begin and end snapshot, the statistic is skipped.
- If a gauge is non-zero and existing in the end snapshot, and the statistic is not existing in the begin snapshot, the end snapshot value is taken as value.
- If a gauge is non-zero and existing in the begin snapshot, and not existing in the end snapshot, the value is skipped.
- if a gauge is non-zero in the begin and end snapshots, and subtracting leads to zero, the value is printed(!).
 
This is what this looks like:
```
192.168.66.80:9300   gauge    node_arp_entries_eth0                                                                2.000000              +0
192.168.66.80:9300   gauge    node_arp_entries_eth1                                                                3.000000              +0
192.168.66.80:9300   gauge    node_boot_time_seconds                                                      1666174770.000000              +0
192.168.66.80:9300   counter  node_context_switches_total                                                        994.000000         994.000 /s
192.168.66.80:9300   gauge    node_cooling_device_max_state_1_intel_powerclamp                                    50.000000              +0
```
Explanation:

| hostname:port      | metric_type | statistic name          | end value         | end value - begin value |
|--------------------|-------------|-------------------------|-------------------|-------------------------|
| 192.168.66.80:9300 | gauge       | node_arp_entries_eth0   | 2.000000          | +0                      |
| 192.168.66.80:9300 | gauge       | node_arp_entries_eth1   | 3.000000          | +0                      |
| 192.168.66.80:9300 | gauge       | node_boot_time_seconds  | 1666174770.000000 | +0                      |
