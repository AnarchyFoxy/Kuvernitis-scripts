#!/usr/bin/env bash

minikube start

#minikube ssh

#getting cluster info
kubectl cluster-info

#getting nodes info
kubectl get nodes

#getting advanced node info & wait 10s
kubectl describe node minikube & sleep 10s

#creating deployment with google echoserver for arm
kubectl create deployment echo --image=gcr.io/google_containers/echoserver-arm:1.8

#exposing deployment on port 8080
kubectl expose deployment echo --type=NodePort --port=8080

#getting minikube ip
minikube ip & sleep 30s

#getting kube service port
kubectl get service echo --output="jsonpath='{.spec.ports[0].nodePort}'"

echo "Now everything is working" &sleep 300s

#deleting deployment after 5 minutes
kubectl delete -n default deployment echo