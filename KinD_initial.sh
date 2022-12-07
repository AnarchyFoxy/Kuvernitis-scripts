#!/usr/bin/env bash

#Installing KinD if GoLang available in version 1.17 or higher and installing kind for cli
go install sigs.k8s.io/kind@v0.17.0
brew install kind

#creating single node cluster
kind create cluster

#getting cluster info
kubectl cluster-info --context kind-kind

#getting nodes info
kubectl get nodes & sleep 60s

#deleting kind cluster
kind delete cluster

#creating multi node cluster
kind create cluster --config kind-multi-node-config.yaml

#getting nodes info
kubectl get nodes & sleep 60s

#deleting kind cluster
kind delete cluster

#creating high available multi node cluster
kind create cluster --config kind-high-availability-multi-node-config.yaml

#getting nodes info
kubectl get nodes & sleep 60s

#getting nodes info by kind
kind get nodes

#creating deployment with google echo server
kubectl create deployment echo --image=gcr.io/google_containers/echoserver-arm:1.8

#exposing deployment on port 8080
kubectl expose deployment echo --type=NodePort --port=8080

#getting deployment info
kubectl get svc echo

#preparing kubectl proxy for exposed deployment
kubectl proxy &