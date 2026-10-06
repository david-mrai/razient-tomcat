# syntax=docker/dockerfile:1.7
#
# Razient on Tomcat 11 / Java 25. Build from this directory, passing the Razient WAR's directory:
#
#   docker build --build-context razient=../razient-java/Razient/target -t razient-tomcat .

ARG TOMCAT_IMAGE=tomcat:11.0-jdk25-temurin

FROM ${TOMCAT_IMAGE} AS drivers
# MySQL Connector/J (shared by Razient and the report apps), checked against its published hash.
ADD --chmod=644 --checksum=sha256:69084713593a4aa8d07c383619b9639276f08bccf8faf1c562178147d389b1e1 \
    https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/26.7.0/mysql-connector-j-26.7.0.jar \
    /build/mysql-connector-j.jar
# The report apps load the driver as org.gjt.mm.mysql.Driver (pre-2003 class name).
COPY docker/gjt-driver-alias /build/src
RUN javac --release 25 -cp /build/mysql-connector-j.jar -d /build/classes \
        /build/src/org/gjt/mm/mysql/Driver.java \
    && jar --create --file /build/gjt-driver-alias.jar -C /build/classes .

FROM ${TOMCAT_IMAGE}
# OS security updates; binutils is only needed to build JDK images, not to run Tomcat.
RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y purge --auto-remove binutils \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf webapps webapps.dist \
    && mkdir webapps \
    && groupadd --system --gid 10001 tomcat \
    && useradd --system --uid 10001 --gid tomcat --home-dir "$CATALINA_HOME" --shell /usr/sbin/nologin tomcat

COPY --from=drivers --chmod=644 /build/mysql-connector-j.jar /build/gjt-driver-alias.jar lib/
COPY conf/ conf/
COPY --chown=tomcat:tomcat webapps-javaee/ webapps-javaee/
COPY --from=razient --chown=tomcat:tomcat Razient.war webapps/
COPY --chmod=755 docker-entrypoint.sh /usr/local/bin/

RUN mkdir -p /data \
    && mkdir -p conf/Catalina \
    && chown -R tomcat:tomcat webapps logs temp work conf/Catalina /data

ENV RAZIENT_DATA_DIR=/data
VOLUME /data
USER tomcat
EXPOSE 8080
ENTRYPOINT ["docker-entrypoint.sh"]
