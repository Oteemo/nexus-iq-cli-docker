FROM openjdk:8-slim

LABEL maintainer=sbrown@oteemo.com

ENV cliVersion 1.63.0-01

RUN apt update && \
    apt install -y curl && \
    cd /tmp && \
    curl -LO https://download.sonatype.com/clm/scanner/nexus-iq-cli-$cliVersion.jar && \
    mkdir -p /opt/nexus && \
    mv *.jar /opt/nexus/nexus-iq-cli.jar && \
    rm -rf /var/lib/apt/lists/*
