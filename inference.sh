#!/bin/bash
set -e  # Exit on error

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# Install Python package
pip install -e .

# Download model
python download_wan2.1.py

# Run inference
python inference_recammaster.py --cam_type 1
