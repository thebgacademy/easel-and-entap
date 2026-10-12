FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    git \
    unzip \
    gzip \
    openjdk-11-jdk \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Nextflow
RUN wget -qO- https://get.nextflow.io | bash \
    && install -m 0755 nextflow /usr/local/bin/nextflow \
    && rm nextflow

# Verify Nextflow installation
RUN nextflow -version
