#FROM ubuntu:latest
#LABEL authors="bbdnet3305"
#ENV DEBIAN_FRONTEND=noninteractive
#
#RUN apt-get update && \
#    apt-get install -y \
#    bash \
#    curl \
#    sudo \
#    vim \
#    less && \
#    apt-get clean
#RUN curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
#RUN dpkg -i minikube_latest_amd64.deb
#RUN sudo apt-get update -y
#RUN sudo apt-get install docker.io -y
#WORKDIR /app
#COPY services.user /app
#ENTRYPOINT ["top", "-b"]
#FROM ubuntu:latest
#LABEL authors="bbdnet3305"
#ENV DEBIAN_FRONTEND=noninteractive
#
#RUN apt-get update && \
#    apt-get install -y \
#    bash \
#    curl \
#    sudo \
#    vim \
#    less \
#    docker.io \
#    conntrack \
#    && apt-get clean
#
#RUN curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb \
#    && dpkg -i minikube_latest_amd64.deb \
#    && rm minikube_latest_amd64.deb
#
#RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
#    && chmod +x kubectl \
#    && mv kubectl /usr/local/bin/
#
#WORKDIR /app
#COPY services.user /app
#
## Script to start Docker, Minikube, and your application
#COPY start.sh /start.sh
#RUN chmod +x /start.sh
#
#ENTRYPOINT ["/start.sh"]

# Use an official Ubuntu base image





#FROM ubuntu:latest
#RUN apt-get update && apt-get install -y \
#    apt-transport-https \
#    ca-certificates \
#    bash \
#    sudo \
#    vim \
#    curl \
#    gnupg \
#    lsb-release \
#    fuse-overlayfs
#RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
#RUN echo \
#  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
#  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
#RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io
#CMD mkdir app
#COPY services.user /app
#RUN curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb \
#    && dpkg -i minikube_latest_amd64.deb \
#    && rm minikube_latest_amd64.deb
#
#RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
#    && chmod +x kubectl \
#    && mv kubectl /usr/local/bin/
#
#
#COPY start.sh /start.sh
#RUN chmod +x /start.sh
#ENV container docker
#STOPSIGNAL SIGRTMIN+3
#
## Set the entrypoint to systemd
#ENTRYPOINT ["/sbin/init"]

FROM docker:dind

RUN apk add bash
# If the docker-group is created, /var/run/docker.sock will be in that group....
RUN addgroup docker

RUN wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
RUN install minikube-linux-amd64 /usr/local/bin/minikube
RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.12.0/bin/linux/amd64/kubectl -O kubectl
RUN chmod +x /kubectl
RUN mv kubectl /usr/local/bin

ENTRYPOINT ["/sbin/init"]