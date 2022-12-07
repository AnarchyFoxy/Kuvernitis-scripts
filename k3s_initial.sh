#!/usr/bin/env bash

#installing k3d
brew install k3d

#creating single node cluster
k3d cluster create

#getting cluster info
kubectl cluster-info

#deleting cluster
k3d cluster delete

#creating multiserver cluster with full nodes
k3d cluster create multiserver --servers 3

#removing nodes
k3d node delete --all

#creating multinode cluster - one master
k3d cluster create three-node-cluster --agents 3

#getting nodes info
kubectl get nodes

#creating deployment with google echo server
kubectl create deployment echo --image=gcr.io/google_containers/echoserver-arm:1.8

#exposing deployment on port 8080
kubectl expose deployment echo --type=NodePort --port=8080

#getting deployment info
kubectl get svc echo

#preparing kubectl proxy for exposed deployment
kubectl proxy &

#removing all nodes
k3d node delete --all