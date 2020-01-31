#!/bin/bash
set -e
type bash

SERVICE_REPO_DIR=git_repos

read -p "What is the address for your registry? " -r DOCKER_REGISTRY_HOST

# Create and clean git repos dir
mkdir -p $SERVICE_REPO_DIR
rm -rf  "${SERVICE_REPO_DIR:?}/"*
rm -rf "${SERVICE_REPO_DIR:?}/".* ||:


git clone https://github.com/panosc-portal/cloud-provider-kubernetes.git $SERVICE_REPO_DIR/cloud-provider-kubernetes

# build docker image of cloud-provider-kubernetes
docker build -t cloud-provider-kubernetes $SERVICE_REPO_DIR/cloud-provider-kubernetes

# push cloud-provider-kubernetes to docker registry
docker tag cloud-provider-kubernetes $DOCKER_REGISTRY_HOST/panosc-portal/cloud-provider-kubernetes
docker push $DOCKER_REGISTRY_HOST/panosc-portal/cloud-provider-kubernetes


## Remove git repos dir
rm -rf $SERVICE_REPO_DIR

helm install panosc-portal-demo  --set dockerRegistry.host="${DOCKER_REGISTRY_HOST}"   ./panosc-portal-demo
