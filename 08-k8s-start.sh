#!/bin/bash
#起跑服务(有顺序的,先中心,再启动其他;你的文件放在哪里,你就指定你的路径).
echo "起跑服务(有顺序的,先中心,再启动其他)."

microk8s.kubectl apply -f /opt/k8s-spring-cloud-direct-run-ChineseKey/docker-k8s-ruoyi-admin/k8s.yaml
microk8s.kubectl apply -f /opt/k8s-spring-cloud-direct-run-ChineseKey/docker-k8s-ruoyi-app-api-zidian/k8s.yaml
