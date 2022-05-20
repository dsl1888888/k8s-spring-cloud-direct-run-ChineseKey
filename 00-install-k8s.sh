#!/bin/bash
#一键安装MicroK8S ubuntu
echo "一键安装MicroK8S ubuntu"

echo "安装docker........................................"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt update && apt install docker-ce  -y
sudo usermod -aG docker ${USER}
systemctl enable docker
systemctl start docker
docker ps
apt install docker.io unzip lrzsz unzip git vim htop  snapd -y
apt install docker.io -y
docker ps
sudo systemctl enable docker
sudo systemctl start docker


echo "安装docker-compose........................................"

curl -L https://github.com/docker/compose/releases/download/1.25.0-rc4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version



echo "安装microk8s........................................"



sudo snap install microk8s --classic
sudo ufw allow in on cni0 && sudo ufw allow out on cni0
sudo ufw default allow routed


microk8s status --wait-ready
echo "启用 dashboard dns registry istio ingress"
microk8s enable dashboard dns registry istio ingress


echo "查看当前所有服务"
microk8s kubectl get all --all-namespaces

token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
microk8s kubectl -n kube-system describe secret $token


#暴露外网访问
echo "暴露外网访问"
microk8s dashboard-proxy &


#访问地址  https://你的ip:10443           +          token


