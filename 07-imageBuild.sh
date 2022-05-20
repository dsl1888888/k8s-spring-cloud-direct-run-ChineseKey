#echo "删除旧的"
#docker rmi -f `docker images -a | grep ruoyi-app-api-zidian`
#docker rmi -f `docker images -a | grep ruoyi-admin`
##删除所有无用的镜像
#docker images | grep '<none>' | awk '{print $3}' | xargs docker rmi -f







#!/bin/bash
#打包docker镜像 (如果你的镜像仓库中心不是这个,需要修改)
echo "打包docker镜像"


########################
cd /opt/k8s-spring-cloud-direct-run-ChineseKey/docker-k8s-ruoyi-admin/
rm -rf *.jar 

cp /opt/tempjar/ruoyi-admin.jar .

docker build -f Dockerfile -t codingsoldier/ruoyi-admin:latest .
docker tag  codingsoldier/ruoyi-admin:latest localhost:32000/codingsoldier/ruoyi-admin:latest
docker push localhost:32000/codingsoldier/ruoyi-admin:latest


########################


echo "打包docker镜像"
########################
cd /opt/k8s-spring-cloud-direct-run-ChineseKey/docker-k8s-ruoyi-app-api-zidian/
rm -rf *.jar
cp /opt/tempjar/ruoyi-app-api-zidian.jar .
docker build -f Dockerfile -t codingsoldier/ruoyi-app-api-zidian:latest .
docker tag  codingsoldier/ruoyi-app-api-zidian:latest localhost:32000/codingsoldier/ruoyi-app-api-zidian:latest
docker push localhost:32000/codingsoldier/ruoyi-app-api-zidian:latest

