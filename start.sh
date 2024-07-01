#!/bin/bash

dockerd &

# Wait for Docker to start
while ! docker info > /dev/null 2>&1; do
  sleep 1
done

## Start Minikube
#minikube start --driver=none
#
## Wait for Minikube to be ready
#until minikube status | grep -q "host: Running"; do
#  echo "Waiting for Minikube to be ready..."
#  sleep 5
#done



# Build and deploy your application
#eval $(minikube docker-env)
#docker build -t user-service:latest /app
#kubectl apply -f /app/k8s/service.yaml
#kubectl apply -f /app/k8s/deployment.yaml
#kubectl apply -f /app/k8s/ingress.yaml

# Keep the container running
#/sbin/init