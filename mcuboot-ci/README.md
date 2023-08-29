# MCUboot CI container

[Act](https://github.com/nektos/act) is a program that attempts to recreate
github workflows using docker containers.  One of the difficulties with this, is
that the VM that github provides is quite large. Although the Act project has a
large container with nearly everything, it is also over 60Gb.  Instead, they
also provide smaller containers, with a more minimal approach.

This container builds off of the minimal containers, and adds the packages that
are necessary to run [MCUboot](https://github.com/mcu-tools/mcuboot)'s CI.

To use this, you should set up `act` as per it's directions.  To use this
alternate container, add a line such as this to `~/.actrc`

```
-P ubuntu-latest=davidb/mcuboot-ci:latest
```

I then use the following script to run one of the workflows.  `job` is set to
the desired workflow (not all have been made to work yet with act).

```bash
#! /bin/bash

job=espressif.yaml
job=mynewt.yaml
job=sim.yaml

act --rm \
    -W .github/workflows/$job \
    --pull=false \
    |& tee act.log
```
