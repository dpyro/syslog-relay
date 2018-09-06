# Readme

[![Build Status](https://travis-ci.org/dpyro/syslog-relay.svg?branch=master)](https://travis-ci.org/dpyro/syslog-relay)

Relay to a syslog endpoint using rsyslog.

## Inputs

### Filesystem

Bind a log output to `/logs`. For example,

```sh
docker run -v /my/log/ouput.log:/logs dpyro/syslog-relay
```

```sh
docker run -v log_volume:/logs dpyro/syslog-relay
```

Note that a `_work` directory will be created in the volume by rsyslog  to keep track of log position.

### Network

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