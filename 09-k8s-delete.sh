#!/bin/bash
#删除服务..
echo "删除服务."

microk8s.kubectl delete -f /opt/k8s-spring-cloud-direct-run-ChineseKey/docker-k8s-ruoyi-admin/k8s.yaml
microk8s.kubectl delete -f /opt/k8s-spring-cloud-direct-run-ChineseKey/docker-k8s-ruoyi-app-api-zidian/k8s.yaml
