#!/bin/bash
set -e
SERVICE_REPO_DIR=git_repos

# Build panosc-portal-postgres
docker build -t panosc-portal-postgres panosc-portal-postgres/docker-image

# Create and clean git repos dir
mkdir -p $SERVICE_REPO_DIR
rm -rf $SERVICE_REPO_DIR/*
rm -rf $SERVICE_REPO_DIR/.* ||:

# Create panosc-portal and panosc namespace
kubectl create namespace panosc-portal ||:
kubectl create namespace panosc ||:


# Deploy panosc-portal-postgres
kubectl apply -f panosc-portal-postgres/panosc-portal-postgres-configmap.yaml
kubectl apply -f panosc-portal-postgres/panosc-portal-postgres-deployment.yaml
kubectl apply -f panosc-portal-postgres/panosc-portal-postgres-service.yaml

# Clone and build docker image of cloud-provider-kubernetes
git clone https://github.com/panosc-portal/cloud-provider-kubernetes.git $SERVICE_REPO_DIR/cloud-provider-kubernetes
docker build -t cloud-provider-kubernetes $SERVICE_REPO_DIR/cloud-provider-kubernetes

# Deploy cloud-provider-kubernetes
kubectl apply -f cloud-provider-kubernetes/cloud-provider-kubernetes-serviceaccount.yaml
kubectl apply -f cloud-provider-kubernetes/cloud-provider-kubernetes-role.yaml
kubectl apply -f cloud-provider-kubernetes/cloud-provider-kubernetes-rolebinding.yaml
kubectl apply -f cloud-provider-kubernetes/cloud-provider-kubernetes-configmap.yaml
kubectl apply -f cloud-provider-kubernetes/cloud-provider-kubernetes-deployment.yaml
kubectl apply -f cloud-provider-kubernetes/cloud-provider-kubernetes-service.yaml

# Remove git repos dir
rm -rf $SERVICE_REPO_DIR
