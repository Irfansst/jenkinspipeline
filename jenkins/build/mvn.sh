#!/bin/bash

echo "***************************"
echo "** Building jar ***********"
echo "***************************"
docker run  -v /home/vagrant/jenkins_data/pipeline/java-app:/app maven:3-alpine sh

WORKSPACE=/home/vagrant/jenkins_data/jenkins_home/workspace/maven-docker-pipeline
          

docker run --rm  -v  $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"



docker run --rm  -v  $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
