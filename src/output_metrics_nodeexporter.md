# Node-exporter statistics

In the output of ad-hoc or snapshot-diff mode, if node-exporter is installed on the YugabyteDB cluster, the last group of statistics that are shown are the node-exporter statistics. The captured statistics are essentially a statistic name and a statistic value. The values to be displayed are ordered by hostname, metric_type and metric_name.

This is how node-exporter statistics output looks like:
```
192.168.66.80:9300   counter  node_context_switches_total                                                        872.000000             inf /s
192.168.66.80:9300   counter  node_cpu_seconds_total_idle                                                          0.750000             inf /s
192.168.66.80:9300   counter  node_cpu_seconds_total_irq                                                           0.010000             inf /s
192.168.66.80:9300   counter  node_cpu_seconds_total_softirq                                                       0.010000             inf /s
192.168.66.80:9300   counter  node_cpu_seconds_total_system                                                        0.010000             inf /s
192.168.66.80:9300   counter  node_cpu_seconds_total_user                                                          0.020000             inf /s
```
- The first column contains the ip address or hostname a colon and the port number.
- The second column contains the type. Possible values are counter and gauge (recomputed by `yb_stats`).
- The third column contains the name of the statistic.
- The fifth column contains the value, which for a counter (default shown value) is the difference of the statistic is the difference of the value of the END snapshot value minus the BEGIN snapshot value.
- The sixth column contains the value (see fifth column calculation) per second in the snapshot. 

If the `--gauges` enable switch is used, gauge type values are shown alongside counter values. This is what this looks like:
```
192.168.66.80:9300   gauge    node_arp_entries_eth0                                                                2.000000              +0
192.168.66.80:9300   gauge    node_arp_entries_eth1                                                                3.000000              +0
192.168.66.80:9300   gauge    node_boot_time_seconds                                                      1666174770.000000              +0
192.168.66.80:9300   counter  node_context_switches_total                                                        994.000000         994.000 /s
192.168.66.80:9300   gauge    node_cooling_device_max_state_1_intel_powerclamp                                    50.000000              +0
192.168.66.80:9300   counter  node_cpu_seconds_total_idle                                                          0.940000           0.940 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_irq                                                           0.010000           0.010 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_softirq                                                       0.010000           0.010 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_system                                                        0.010000           0.010 /s
192.168.66.80:9300   counter  node_cpu_seconds_total_user                                                          0.020000           0.020 /s
```
The columns do not change. The change specific to gauge values, and with which gauge values can be recognised, is that sixth column now shows a value prefixed by '+' or '-' and the value in the sixth column is not followed by '/s'.

The value in the fourth column shows the END snapshot value, and the value in the sixth column shows the difference between the END and the BEGIN snapshot value.
