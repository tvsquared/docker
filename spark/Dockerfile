FROM alpine as build

ARG SPARK_VERSION=3.2.0
ENV SPARK_URL=https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-${SPARK_VERSION}-bin-without-hadoop.tgz
ENV SPARK_HOME="/opt/spark"

ADD ${SPARK_URL} /tmp/spark.tar.gz
RUN mkdir -p ${SPARK_HOME}  && \
    tar xfz /tmp/spark.tar.gz --strip-components=1 -C ${SPARK_HOME} && \
    rm -rf /tmp/spark.tar.gz \
        ${SPARK_HOME}/examples \
        ${SPARK_HOME}/yarn \
        ${SPARK_HOME}/data \
        ${SPARK_HOME}/R

COPY conf/* $SPARK_HOME/conf/
COPY jars/* $SPARK_HOME/jars/

FROM alpine
COPY --from=build $SPARK_HOME $SPARK_HOME

