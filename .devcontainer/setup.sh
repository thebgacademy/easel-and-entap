#!/usr/bin/env bash
set -e

# Verify Nextflow
nextflow -version

# Wait for Docker to become available
until docker info >/dev/null 2>&1; do
  echo "Waiting for Docker..."
done

# Pull EnTAP Docker image
echo "Pulling plantgenomics/entap:latest..."
docker pull plantgenomics/entap:latest

# Clone the workshop repository if it isn't already present
echo "Getting data..."
if [ ! -d /workspaces/bgaworkshop-2024 ]; then
  git clone https://github.com/cynthiawebster/bgaworkshop-2024.git \
    /workspaces/bgaworkshop-2024
fi

echo "Workshop environment setup complete."
