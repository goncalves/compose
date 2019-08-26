#!/bin/sh
sudo apt-get remove docker.io docker-engine

sudo apt-get remove --auto-remove docker
sudo apt-get purge docker-ce
sudo rm -rf /var/lib/docker 

sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/debian/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo apt-get update

sudo apt-get install docker-ce

systemctl start docker

sudo usermod -aG docker $USER

sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://jxus37ad.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
