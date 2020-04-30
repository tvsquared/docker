###########################################################
FROM openjdk:8-jdk-slim as spark

ARG SPARK=2.4.5
ARG HADOOP=2.7

ENV SPARK_HOME /opt/spark
ENV PYTHONPATH ${SPARK_HOME}/python/lib/pyspark.zip:${SPARK_HOME}/python/lib/py4j-*.zip
ENV DLDIR /tmp/spark-${SPARK}-bin-hadoop${HADOOP}/

WORKDIR /opt/spark/work-dir

ADD https://mirror.dkd.de/apache/spark/spark-${SPARK}/spark-${SPARK}-bin-hadoop${HADOOP}.tgz /tmp/spark.tgz

RUN tar xfz /tmp/spark.tgz -C /tmp && \
    mkdir -p ${SPARK_HOME}/python && \
    mv ${DLDIR}/jars ${DLDIR}/bin ${DLDIR}sbin ${SPARK_HOME} && \
    mv ${DLDIR}/python/lib ${SPARK_HOME}/python/lib && \
    mv ${DLDIR}/kubernetes/dockerfiles/spark/entrypoint.sh /opt && \
    apt-get update && \
    ln -s /lib /lib64 && \
    apt install -y bash tini libc6 libpam-modules libnss3 python3 python3-pip && \
    mkdir -p /opt/spark && \
    mkdir -p /opt/spark/work-dir && \
    mkdir -p /opt/spark/python && \
    touch /opt/spark/RELEASE && \
    rm /bin/sh && \
    ln -sv /bin/bash /bin/sh && \
    echo "auth required pam_wheel.so use_uid" >> /etc/pam.d/su && \
    chgrp root /etc/passwd && chmod ug+rw /etc/passwd && \
    # symlink python and pip to version3
    update-alternatives --install /usr/bin/python python /usr/bin/python3 1 && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1 && \
    pip install --upgrade pip setuptools && \
    rm -r /root/.cache && rm -rf /var/cache/apt/* /tmp/spark*

ENTRYPOINT [ "/opt/entrypoint.sh" ]