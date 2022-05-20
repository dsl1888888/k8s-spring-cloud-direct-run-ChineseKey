#!/bin/bash

cd /opt/java_houtai/


#编译打包jar
echo "编译打包jar"
mvn clean install -DskipTests=true

