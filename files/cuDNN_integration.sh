#!/bin/bash
# cuDNN Integration Script

set -e

echo "=== Adding NVIDIA CUDA keyring ==="
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb

echo "=== Updating package lists ==="
sudo apt-get update

echo "=== Installing cuDNN and CUDA-specific libraries ==="
sudo apt-get -y install cudnn
sudo apt-get -y install cudnn-cuda-12

echo "=== Verifying cuDNN installation ==="
ls -lh /usr/lib/x86_64-linux-gnu/libcudnn*
