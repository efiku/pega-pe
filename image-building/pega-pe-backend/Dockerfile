FROM postgres:14.2

RUN apt update && \
    apt -y --fix-missing --no-install-recommends install \
    git \
    ca-certificates \
    g++ \
    maven \
    postgresql-server-dev-14 \
    libpq-dev \
    libecpg-dev \
    libkrb5-dev \
    openjdk-11-jdk \
    libssl-dev \
    && \
    export PGXS=/usr/lib/postgresql/12/lib/pgxs/src/makefiles/pgxs.mk && \
    git clone https://github.com/tada/pljava.git && \
    cd pljava && \
    mvn clean install && \
    java -jar $(ls /pljava/pljava-packaging/target/pljava-pg14.jar) && \
    cd / && \
    apt -y remove --purge --auto-remove git ca-certificates g++ maven postgresql-server-dev-14 libpq-dev libecpg-dev openjdk-11-jdk libkrb5-dev libssl-dev && \
    apt -y --fix-missing --no-install-recommends install openjdk-11-jdk-headless && \
    apt -y clean autoclean autoremove && \
    rm -rf ~/.m2 /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY initdb.d /docker-entrypoint-initdb.d
COPY dump /tmp/resources/
ENV PEGA_DUMP /tmp/resources/pega.dump