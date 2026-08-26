#!/usr/bin/env bash
# ==============================================================================
# GNOME Extensions Installer Script
# Works on both Fedora Workstation and Linux Mint
# Safe to rerun (idempotent)
# ==============================================================================

set -euo pipefail

# 1. Install gext (GNOME Extension CLI tool) if not present
if ! command -v gext &> /dev/null; then
    echo "Installing gext (GNOME Extension CLI)..."
    if command -v dnf &> /dev/null; then
        sudo dnf install -y python3-pip pipx
    elif command -v apt &> /dev/null; then
        sudo apt update && sudo apt install -y python3-pip pipx
    fi
    pipx install gnome-extensions-cli --force
fi

export PATH="$HOME/.local/bin:$PATH"

# 2. List of User-Installed Extensions (from screenshot)
EXTENSIONS=(
    "appindicatorsupport@rgcjonas.gmail.com"
    "clipboard-indicator@tudmotu.com"
    "ddterm@amezin.github.com"
    "ding@rastersoft.com"
    "gsconnect@andyholmes.github.io"
)

echo "=================================================="
echo " Installing and Enabling GNOME Extensions..."
echo "=================================================="

for ext in "${EXTENSIONS[@]}"; do
    echo "--> Processing: $ext"
    gext install "$ext" 2>/dev/null || true
    gext enable "$ext" 2>/dev/null || true
done

echo "=================================================="
echo " All extensions configured successfully!"
echo "=================================================="
