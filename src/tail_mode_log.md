# tail-log
Print new log entries from a live cluster, in the same way that `tail -f` works on a file.

- `--tail-log`: print log information from a live cluster.

Additional switches:
- `--hostname-match`: filter by hostname or port regular expression.
- `--log-severity` filters log lines by the letter that indicates the severity. Default: WEF, optional: I.  
- `--stat-name-match`: filters log lines by the sourcefile name and line number (such as "log.cc:1516") or message fields via a regular expression.
 
Explanation of the severity letters (increasing in severity):  
- I: Informal
- W: Warning
- E: Error
- F: Fatal

The `--tail-log` option prints the log lines based on the timestamp found in the log line.
The log lines are taken from the different servers, and ordered on time, which is the local timestamp, so you have to be aware of clock skew.
The timestamps in the logs are UTC time, so timezone settings should not require recalculation of the timestamp.

Example:
```
% yb_stats --tail-log --log-severity IWEF --hostname-match 9000 --stat-name-match '(leader_election|Granting vote|Granting yes vote)'
192.168.66.80:9000   2022-12-19 14:37:16.188669 +01:00 I leader_election.cc:216 T 411a6843451a4e87aeca805085a228ba P 3152ba00f652431baeeafa1b36336093 [CANDIDATE]: Term 1 pre-election: Requesting vote from peer 64dc6522080c433c9cbd2c83efccb025
192.168.66.80:9000   2022-12-19 14:37:16.188694 +01:00 I leader_election.cc:216 T 411a6843451a4e87aeca805085a228ba P 3152ba00f652431baeeafa1b36336093 [CANDIDATE]: Term 1 pre-election: Requesting vote from peer 9e982449051e43f3902a4fb24d639b84
192.168.66.82:9000   2022-12-19 14:37:16.188913 +01:00 I raft_consensus.cc:2375 T 411a6843451a4e87aeca805085a228ba P 64dc6522080c433c9cbd2c83efccb025 [term 0 FOLLOWER]: Pre-election. Granting vote for candidate 3152ba00f652431baeeafa1b36336093 in term 1
192.168.66.81:9000   2022-12-19 14:37:16.191915 +01:00 I raft_consensus.cc:2375 T 411a6843451a4e87aeca805085a228ba P 9e982449051e43f3902a4fb24d639b84 [term 0 FOLLOWER]: Pre-election. Granting vote for candidate 3152ba00f652431baeeafa1b36336093 in term 1
192.168.66.80:9000   2022-12-19 14:37:16.192420 +01:00 I leader_election.cc:367 T 411a6843451a4e87aeca805085a228ba P 3152ba00f652431baeeafa1b36336093 [CANDIDATE]: Term 1 pre-election: Vote granted by peer 64dc6522080c433c9cbd2c83efccb025
192.168.66.80:9000   2022-12-19 14:37:16.192452 +01:00 I leader_election.cc:242 T 411a6843451a4e87aeca805085a228ba P 3152ba00f652431baeeafa1b36336093 [CANDIDATE]: Term 1 pre-election: Election decided. Result: candidate won.
192.168.66.80:9000   2022-12-19 14:37:16.202473 +01:00 I leader_election.cc:216 T 411a6843451a4e87aeca805085a228ba P 3152ba00f652431baeeafa1b36336093 [CANDIDATE]: Term 1 election: Requesting vote from peer 64dc6522080c433c9cbd2c83efccb025
192.168.66.80:9000   2022-12-19 14:37:16.202504 +01:00 I leader_election.cc:216 T 411a6843451a4e87aeca805085a228ba P 3152ba00f652431baeeafa1b36336093 [CANDIDATE]: Term 1 election: Requesting vote from peer 9e982449051e43f3902a4fb24d639b84
192.168.66.82:9000   2022-12-19 14:37:16.210361 +01:00 I raft_consensus.cc:3022 T 411a6843451a4e87aeca805085a228ba P 64dc6522080c433c9cbd2c83efccb025 [term 1 FOLLOWER]:  Leader election vote request: Granting yes vote for candidate 3152ba00f652431baeeafa1b36336093 in term 1.
192.168.66.80:9000   2022-12-19 14:37:16.211731 +01:00 I leader_election.cc:367 T 411a6843451a4e87aeca805085a228ba P 3152ba00f652431baeeafa1b36336093 [CANDIDATE]: Term 1 election: Vote granted by peer 9e982449051e43f3902a4fb24d639b84
192.168.66.80:9000   2022-12-19 14:37:16.211760 +01:00 I leader_election.cc:242 T 411a6843451a4e87aeca805085a228ba P 3152ba00f652431baeeafa1b36336093 [CANDIDATE]: Term 1 election: Election decided. Result: candidate won.
192.168.66.81:9000   2022-12-19 14:37:16.211910 +01:00 I raft_consensus.cc:3022 T 411a6843451a4e87aeca805085a228ba P 9e982449051e43f3902a4fb24d639b84 [term 1 FOLLOWER]:  Leader election vote request: Granting yes vote for candidate 3152ba00f652431baeeafa1b36336093 in term 1.
```
The `--tail-log` command has the additional switches `--log-severity` set to include 'I' severity loglines, 
has `--hostname-match` set to '9000' in order to only allow tablet server loglines, 
and has `--stat-name-match` in order to allow only the regex '(leader_election|Granting vote|Granting yes vote)' 
for sourcefile name and number and message.

Press interrupt (ctrl-c) to terminate tailing the logs.