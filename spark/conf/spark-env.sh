#!/bin/sh
SPARK_TMP_DIR=/tmp
export SPARK_DAEMON_MEMORY=8000m
export SPARK_DRIVER_MEMORY=6000m
export SPARK_EXECUTOR_MEMORY=3000m
export SPARK_WORKER_DIRS=$SPARK_TMP_DIR
export SPARK_DIRS=$SPARK_TMP_DIR
export SPARK_WORKER_DIR=$SPARK_TMP_DIR
export SPARK_DAEMON_JAVA_OPTS="-Djava.io.tmpdir=$SPARK_TMP_DIR -Duser.timezone=UTC"
export SPARK_EXECUTOR_JAVA_OPTS="-Djava.io.tmpdir=$SPARK_TMP_DIR -Duser.timezone=UTC"
export SPARK_SUBMIT_OPTS="-Djava.io.tmpdir=$SPARK_TMP_DIR -Duser.timezone=UTC"
export PYSPARK_DRIVER_PYTHON_OPTS="-Djava.io.tmpdir=$SPARK_TMP_DIR -Duser.timezone=UTC"
export SPARK_LOCAL_DIRS=$SPARK_TMP_DIR
export SPARK_DIST_CLASSPATH=$(/opt/hadoop/bin/hadoop classpath)
export TZ=UTC
