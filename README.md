# Readme

[![Build Status](https://travis-ci.org/dpyro/syslog-relay.svg?branch=master)](https://travis-ci.org/dpyro/syslog-relay)

## Inputs

| Port | Name |
|------|------|
| 514  | UDP  |
| 514  | TCP  |
| 6514 | RELP |

You must set `$RELAY_TARGET` to relay to a custom endpoint. The default is `tcp://localhost:514`.

## Outputs

* `$RELAY_TARGET` syslog string
* `stdout`/`stderr` echoing relayed messages

## Examples

### UDP input, UDP output

```sh
docker run -p 514:514/udp -e RELAY_TARGET='@nowhere' dpyro/rsyslog-relay
```

### TCP input, TCP output

```sh
docker run -p 514:514/tcp -e RELAY_TARGET='@@nowhere' dpyro/rsyslog-relay
```

### TCP input, Telegraf syslog output

```sh
docker run -p 514:514/tcp -e RELAY_TARGET='@@(o)nowhere:6514;RSYSLOG_SyslogProtocol23Format' dpyro/rsyslog-relay
```