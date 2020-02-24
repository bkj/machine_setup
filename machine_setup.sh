#!/bin/bash

# machine_setup.sh

# --
# yum install

yum -y update
yum group install -y "Development Tools" 
yum install -y wget
yum install -y git 
yum install -y which
yum install -y gcc gcc-c++ libgcc libstdc++-devel
yum install -y bzip2
yum install -y make
yum install -y cmake
yum install -y pigz
yum install -y screen
yum install -y openssl
yum install -y tree
yum install -y vim-common vim-enhanced vim-minimal
yum install -y nano

yum install -y epel-release
yum install -y p7zip
yum install -y pbzip2

yum remove docker docker-client docker-client-latest docker-common docker-latest \
    docker-latest-logrotate docker-logrotate docker-engine
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io

# --
# other command line tools

# parallel
wget https://ftp.gnu.org/gnu/parallel/parallel-latest.tar.bz2
tar -xjvf parallel-latest.tar.bz2
rm -f parallel-latest.tar.bz2
mv parallel-* parallel
cd parallel
./configure
make
make install
cd ..

# rsub
wget -O /usr/local/bin/rsub https://raw.github.com/aurora/rmate/master/rmate
chmod +x /usr/local/bin/rsub

# jq
wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -O /usr/local/bin/jq
chmod +x /usr/local/bin/jq

# --
# python

# install anaconda
wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
bash Anaconda3-2019.10-Linux-x86_64.sh -b -p ~/anaconda
rm -f Anaconda3-2019.10-Linux-x86_64.sh
echo 'export PATH="/root/anaconda/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
conda update -y conda
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/root/anaconda/lib/"

# should be installed by w/ default anaconda installation
conda install -y pandas
conda install -y numpy
conda install -y tqdm
conda install -y matplotlib
conda install -y seaborn
conda install -y scipy
conda install -y scikit-learn
conda install -y scikit-image
conda install -y pillow
conda install -y networkx
conda install -y joblib
conda install -y numba
conda install -y h5py
conda install -y cython
conda install -y flask
conda install -y beautifulsoup4

# need to be installed
conda install -y -c pytorch faiss-cpu
conda install -y bcolz
conda install -y ujson
pip install lapjv
pip install graspy
pip install sklearn-pandas
pip install fastdtw
pip install git+https://github.com/bkj/rsub
pip install transformers
pip install termcolor


# --
# GPU packages

# !! Can't document exactly how to install these, because versions depend on specific GPU versions

# 0) CUDA drivers, cudnn, nvidia-smi, nvcc, ...
# 1) most recent pytorch version + dependencies
#    - something like `conda install pytorch torchvision cudatoolkit=10.1 -c pytorch`
# 2) most recent tensorflow version + dependencies
# 3) most recent `faiss-gpu` version
#    - something like `conda install -c pytorch faiss-gpu`
# 4) NVIDIA APEX (from https://github.com/NVIDIA/apex)

# --
# Java

# !! Only need this for Task 1 scenarios, which we don't anticipate receiving at this time

# --
# FICO XPress

# !! Only need this for Task 1 scenarios, which we don't anticipate receiving at this time

# --
# Intel specific software

# !! Unknown to me at this time
