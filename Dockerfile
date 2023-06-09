FROM jenkins/jenkins

USER root
# Install ansible

RUN sed -i 's/http:\/\/deb.debian.org\/debian\//http:\/\/mirrors.aliyun.com\/debian\//g' /etc/apt/sources.list && \
    sed -i 's/http:\/\/security.debian.org\/debian-security\//http:\/\/mirrors.aliyun.com\/debian-security\//g' /etc/apt/sources.list && \
    apt-get update

RUN apt-get update
RUN apt-get update && \
    apt-get install -y python3-pip && \
    pip3 install ansible
RUN apt-get update

# Install Docker

RUN apt-get update && \
apt-get -y install apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common && \
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable" && \
apt-get update && \
apt-get -y install docker-ce

# COmpose

RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker jenkins

USER jenkins
