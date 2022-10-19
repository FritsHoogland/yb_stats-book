# print-version

The `--print-version` switch takes a single argument, which is a snapshot number.

Additional switches: none.

Example:
```shell
yb_stats --print-version 2
hostname_port        version_number  build_nr   build_type build_timestamp          git_hash
192.168.66.82:9000   2.15.2.1        1          RELEASE    10 Oct 2022 19:29:09 UTC 1a6daeb8d9f0eee9a43f529049ef50f4c760adc7
192.168.66.82:7000   2.15.2.1        1          RELEASE    10 Oct 2022 19:29:09 UTC 1a6daeb8d9f0eee9a43f529049ef50f4c760adc7
192.168.66.81:9000   2.15.2.1        1          RELEASE    10 Oct 2022 19:29:09 UTC 1a6daeb8d9f0eee9a43f529049ef50f4c760adc7
192.168.66.81:7000   2.15.2.1        1          RELEASE    10 Oct 2022 19:29:09 UTC 1a6daeb8d9f0eee9a43f529049ef50f4c760adc7
192.168.66.80:9000   2.15.2.1        1          RELEASE    10 Oct 2022 19:29:09 UTC 1a6daeb8d9f0eee9a43f529049ef50f4c760adc7
192.168.66.80:7000   2.15.2.1        1          RELEASE    10 Oct 2022 19:29:09 UTC 1a6daeb8d9f0eee9a43f529049ef50f4c760adc7
```
