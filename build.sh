#!/bin/bash
set -e

SERVICE_REPO_DIR=git_repos
DOCKER_REGISTRY_HOST=panosc-docker.ill.fr


# Build panosc-portal-postgres
docker build -t panosc-portal-postgres panosc-portal-postgres-image

# push panosc-portal-postgres to docker registry
docker tag panosc-portal-postgres $DOCKER_REGISTRY_HOST/panosc-portal/postgres
docker push $DOCKER_REGISTRY_HOST/panosc-portal/postgres


# Create and clean git repos dir
mkdir -p $SERVICE_REPO_DIR
rm -rf "${$SERVICE_REPO_DIR:?}/"*
rm -rf $SERVICE_REPO_DIR/.* ||:


git clone https://github.com/panosc-portal/cloud-provider-kubernetes.git $SERVICE_REPO_DIR/cloud-provider-kubernetes

# build docker image of cloud-provider-kubernetes
docker build -t cloud-provider-kubernetes $SERVICE_REPO_DIR/cloud-provider-kubernetes

# push cloud-provider-kubernetes to docker registry
docker tag cloud-provider-kubernetes $DOCKER_REGISTRY_HOST/panosc-portal/cloud-provider-kubernetes
docker push $DOCKER_REGISTRY_HOST/panosc-portal/cloud-provider-kubernetes


## Remove git repos dir
rm -rf $SERVICE_REPO_DIR

helm install panosc-portal-demo ./panosc-portal-demo
