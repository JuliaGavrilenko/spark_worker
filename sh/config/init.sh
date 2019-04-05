#!/bin/bash

. "/etc/simple_grid/config/spark-config.sh"
. "/etc/simple_grid/config/spark_env.sh"


cat /etc/simple_grid/config/spark_env.sh >> ~/.bashrc

source ~/.bashrc
mkdir -p $SPARK_WORKER_LOG
#ln -sf /dev/stdout $SPARK_WORKER_LOG/spark-worker.out
echo "Starting spark worker"
trap '' HUP
/spark/bin/spark-class org.apache.spark.deploy.worker.Worker \
    --webui-port $SPARK_WORKER_WEBUI_PORT $SPARK_WORKER >> $SPARK_WORKER_LOG/spark-worker.out 2>&1 </dev/null &