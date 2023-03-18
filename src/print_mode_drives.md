# print-drives
Print the drives usage information from the masters and tablet servers from a live cluster or from a snapshot.

- `--print-drives <snapshot number>`: print the drives usage information from a stored snapshot.
- `--print-drives`: print the drives usage information from a live cluster.

Example:
```
➜ yb_stats --print-drives
192.168.66.80:7000   /mnt/d0                                  9.99G                149.83M
192.168.66.80:9000   /mnt/d0                                  9.99G                149.83M
192.168.66.80:12000  /mnt/d0                                  9.99G                149.83M
192.168.66.82:12000  /mnt/d0                                  9.99G                146.08M
192.168.66.82:9000   /mnt/d0                                  9.99G                146.08M
192.168.66.81:9000   /mnt/d0                                  9.99G                145.90M
192.168.66.81:7000   /mnt/d0                                  9.99G                145.90M
192.168.66.82:7000   /mnt/d0                                  9.99G                146.08M
192.168.66.81:12000  /mnt/d0                                  9.99G                145.90M
```
The output shows the following fields:
- endpoint (hostname/ip address and port number)
- path
- total space
- used space 

This is using the `/drives` URL, which is present on each master and tablet server.