# Readme

[![Build Status](https://travis-ci.org/dpyro/syslog-relay.svg?branch=master)](https://travis-ci.org/dpyro/syslog-relay)

## Inputs

| Port | Name |
|------|------|
| 514  | UDP  |
| 514  | TCP  |
| 6514 | RELP |

Specify the relay endpoint with the first argument. Using `@localhost:514` will probably cause an infinite loop.

## Outputs

* `$RELAY_TARGET` syslog string
* `stdout`/`stderr` echoing relayed messages

## Examples

### UDP input, UDP output

```sh
docker run -p 514:514/udp dpyro/rsyslog-relay @nowhere
```

### TCP input, TCP output

```sh
docker run -p 514:514/tcp dpyro/rsyslog-relay @@nowhere
```

Note the two `@@`.

### TCP input, Telegraf syslog output

```sh
docker run -p 514:514/tcp dpyro/rsyslog-relay '@@(o)nowhere:6514;RSYSLOG_SyslogProtocol23Format'
```