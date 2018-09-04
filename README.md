Readme
======

[![Build Status](https://travis-ci.org/dpyro/syslog-relay.svg?branch=master)](https://travis-ci.org/dpyro/syslog-relay)

Inputs
------

* 514 (UDP)
* 514 (TCP)
* 6514 (RELP)

You must set `$RELAY_TARGET` to relay to a custom endpoint. The default is `tcp://localhost:514`.

Outputs
-------

* `$RELAY_TARGET` syslog string
* `stdout`/`stderr` echoing relayed messages