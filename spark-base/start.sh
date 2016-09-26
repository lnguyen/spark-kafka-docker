#!/bin/bash

set -x

if [ "$1" == "master" ]; then
    echo "Starting spark master"
    export SPARK_MASTER_PORT=${SPARK_MASTER_SERVICE_PORT:-7077}
    /spark/sbin/start-master.sh
elif [ "$1" == "slave" ]; then
    echo "Starting spark slave"
    /spark/sbin/start-slave.sh spark://spark-master:7077
fi

tail -F /spark/logs/spark*