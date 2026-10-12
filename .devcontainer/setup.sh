
cat <<'EOF' >> /home/vscode/.bashrc

# BGA Workshop setup functions

bga_get_data() {
    local repo="/workspaces/bgaworkshop-2024"

    echo ""
    echo "================================================"
    echo "          Downloading Workshop Data"
    echo "================================================"

    if [ -d "$repo/.git" ]; then
        echo "Workshop repository already exists."
    else
        echo "Cloning workshop repository..."
        if ! git clone --progress \
            https://github.com/cynthiawebster/bgaworkshop-2024.git \
            "$repo"; then
            echo "ERROR: Failed to download workshop repository."
            return 1
        fi
        echo "Workshop repository downloaded successfully!"
    fi

    echo "Repository location: $repo"
}

bga_welcome() {
    echo ""
    echo "================================================"
    echo "          Welcome to the BGA Workshop!"
    echo "================================================"
    echo "  Workshop: EASEL & EnTAP"
    echo "  Nextflow: $(nextflow -version 2>&1 | grep "version")"
    echo ""
    bga_get_data
    echo ""
    echo "Setup check complete. Happy analysing!"
    echo ""
}

EOF

# Display workshop welcome and data setup on interactive terminals
cat << 'EOF' >> /home/vscode/.bashrc
if [[ $- == *i* ]]; then
    bga_welcome
fi

EOF

source /home/vscode/.bashrc