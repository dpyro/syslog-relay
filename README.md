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
* __stdout__/__stderr__ echoing relayed messages

## Examples

### Log file input, UDP output

```sh
docker run -v source:/logs dpyro/syslog-relay @nowhere
```

Where source is a folder or a volume containing top-level log files.

### UDP input, UDP output to a specified port

```sh
docker run -p 514:514/udp dpyro/syslog-relay @nowhere:8675
```

### TCP input, TCP output

```sh
docker run -p 514:514/tcp dpyro/syslog-relay @@nowhere
```

Note the two `@@`.

### TCP input, Telegraf syslog output

```sh
docker run -p 514:514/tcp dpyro/rsyslog-relay '@@(o)nowhere:6514;RSYSLOG_SyslogProtocol23Format'
```