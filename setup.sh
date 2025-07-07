#!/bin/bash
set -e  # Exit on error

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# Install NumPy 1.x first to ensure compatibility
pip install "numpy<2.0"

# Install Python package
pip install -e .

# Download model
python download_wan2.1.py

# Download ReCamMaster checkpoint
mkdir -p models/ReCamMaster/checkpoints
wget -O models/ReCamMaster/checkpoints/step20000.ckpt "https://huggingface.co/KwaiVGI/ReCamMaster-Wan2.1/resolve/main/step20000.ckpt"
