#!/bin/bash

#environment:ubuntu 20.04 LTS

#安装依赖
mkdir baseline
cd baseline

sudo apt-get install gcc
sudo apt-get install cmake
sudo apt install build-essential sed cmake libjpeg-dev libeigen3-dev

#安装git
sudo apt install git
git clone https://github.com/threaTrace-detector/threaTrace.git

#安装python3.6
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.6 python3.6-dev
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
sudo apt-get install python3.6-distutils
sudo apt install python3-pip
sudo ln -s /usr/bin/python3 /usr/local/bin/python

#安装包
pip3 install pandas numpy 
pip3 install typing_extensions
pip3 install psutil
pip3 install torch==1.7.1+cpu torchvision==0.8.2+cpu torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html
pip3 install torch-scatter==2.0.7 -f https://pytorch-geometric.com/whl/torch-1.7.1+cpu.html
pip3 install torch-sparse==0.6.9 -f https://pytorch-geometric.com/whl/torch-1.7.1+cpu.html
pip3 install torch-cluster==1.5.9 -f https://pytorch-geometric.com/whl/torch-1.7.1+cpu.html
pip3 install torch-spline-conv==1.2.1 -f https://pytorch-geometric.com/whl/torch-1.7.1+cpu.html
pip3 install torch_geometric==1.4.3

#
wget -P ./threaTrace/graphchi-cpp-master/graph_data/streamspot/ https://github.com/sbustreamspot/sbustreamspot-data/blob/master/all.tar.gz
cd ./threaTrace/scripts/
python parse_streamspot.py
python train_streamspot.py
python evaluate_streamspot.py
python test_streamspot.py

