# .env

Whenever the `yb_stats` executable is run with `--hosts`, `--ports` or `--parallel` specified, it will use the value of the flag(s) set, but it will also write the specification of hosts, ports or parallellism into a file called `.env`.

When `yb_stats` is executed with a `.env` file in the current working directory, it will set the environment variables listed in that file. If any of:
- YBSTATS_HOSTS
- YBSTATS_PORTS
- YBSTATS_PARALLEL   
 
Are set in the `.env` file, it will use the set value. This way, specifying either or all of the hosts list, ports list or parallellism only need to be done once, and will be set automatically for every next invocation executed from the same directory.

If a flag is specified with `yb_stats` that is also set in `.env`, the flag specified with `yb_stats` will be given preference, and the entry in `.env` will be overwritten with this new value.

# WARNING
Please mind that if something outside of `yb_stats` is using `.env` for its own purposes and sets its own values in the file, 
running `yb_stats` with the current working directory holding a `.env` file used by a third party, will __overwrite__ the file and only set the `yb_stats` values, removing any settings not used with `yb_stats`.

