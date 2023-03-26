#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /root/prod /tmp/.auth prod-user@192.168.33.102:/tmp/.auth
scp -i /root/prod ./jenkins/deploy/publish prod-user@192.168.33.102:/tmp/publish
ssh -i /root/prod prod-user@192.168.33.102 "/tmp/publish"
