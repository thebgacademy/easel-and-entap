#!/usr/bin/env bash
set -e

# Verify Nextflow
nextflow -version

# Wait for Docker to become available
# Just to make sure the daemon has started
until docker info >/dev/null 2>&1; do
  echo "Waiting for Docker..."
done

# Clone the workshop repository if it isn't already present
echo "Getting data..."
if [ ! -d /workspaces/bgaworkshop-2024 ]; then
  git clone https://github.com/cynthiawebster/bgaworkshop-2024.git \
    /workspaces/bgaworkshop-2024
fi

cat <<'EOF' >> /etc/bash.bashrc

# BGA Workshop welcome message
if [ -n "$PS1" ]; then
    echo ""
    echo "================================================"
    echo "          Welcome to the BGA Workshop!"
    echo "================================================"
    echo "  Nextflow v24.05 and Docker are ready to use."
    echo "  Workshop: EASEL & EnTap"
    echo ""
fi
EOF
