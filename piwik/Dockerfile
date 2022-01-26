FROM alpine as build

ARG PIWIK_VERSION=2.13.1
ENV PIWIK_URL=http://builds.piwik.org/piwik-${PIWIK_VERSION}.zip
ENV PIWIK_HOME="/opt/piwik"

ADD ${PIWIK_URL} /tmp/piwik.zip
COPY patches/piwik-$PIWIK_VERSION.patch /tmp/piwik.patch

RUN mkdir -p ${PIWIK_HOME}  && \
    apk add patch && \
    # piwik has a piwik folder inside its zip oO
    unzip /tmp/piwik.zip -d /opt && \
    patch -d ${PIWIK_HOME} -p1 -i /tmp/piwik.patch

FROM alpine
COPY --from=build ${PIWIK_HOME} ${PIWIK_HOME}
