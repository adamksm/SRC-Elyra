#!/bin/bash

sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub

sudo sh -c 'echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list'

sudo apt-get update

sudo apt-get install -y cuda

echo 'export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}' | sudo tee -a /etc/profile.d/cuda.sh
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' | sudo tee -a /etc/profile.d/cuda.sh
source /etc/profile.d/cuda.sh

CUDNN_TAR_FILE=$(ls cudnn-*-linux-x64-v*.tgz)
tar -xzvf $CUDNN_TAR_FILE
sudo cp cuda/include/cudnn*.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda/lib64/libcudnn*

sudo apt-get install -y python3-pip
sudo pip3 install --upgrade pip
sudo pip3 install numpy scipy pandas scikit-learn matplotlib seaborn jupyterlab

sudo pip3 install tensorflow

sudo pip3 install torch torchvision torchaudio

nvidia-smi
nvcc --version
python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
python3 -c "import torch; print(torch.cuda.is_available())"

echo "Installation complete. Please reboot your system to apply all changes."
