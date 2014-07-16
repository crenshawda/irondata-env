#!/bin/bash

cd _provision/modules/
chmod +x *

./base.sh
./oracle-jdk.sh
./liquibase.sh
./gvm.sh
./ggts.sh
./mysql.sh
./bpmdb-schema.sh
./icmbd-schema.sh
./desktop-env.sh
