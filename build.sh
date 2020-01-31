#!/bin/bash
set -e

SERVICE_REPO_DIR=git_repos

KUBERTES_NAMESPACES=$(kubectl get ns)

if [[ "$KUBERTES_NAMESPACES" == *"panosc-kubernetes-instances"* ]] && [[ "$KUBERTES_NAMESPACES" == *"panosc-portal"* ]]; then
  echo "The namespaces panosc-portal and panosc-kubernetes-instances should not exist on your cluster."
  echo "Please delete them with the command 'kubectl delete ns panosc-kubernetes-instances panosc-portal' before you restart this script"
  exit
elif [[ "$KUBERTES_NAMESPACES" == *"panosc-portal"* ]]; then
  echo "The namespace panosc-portal should not exist on your cluster"
  echo "Please delete it with the command 'kubectl delete ns panosc-portal' before you restart this script"
  exit
elif [[ "$KUBERTES_NAMESPACES" == *"panosc-kubernetes-instances"* ]]; then
  echo "The namespace panosc-kubernetes-instances should not exist on your cluster"
  echo "Please delete it with the command 'kubectl delete ns panosc-kubernetes-instances' before you restart this script"
  exit
fi

read -p "What is the address for your registry? " -r DOCKER_REGISTRY_HOST

# Create and clean git repos dir
mkdir -p $SERVICE_REPO_DIR
rm -rf "${SERVICE_REPO_DIR:?}/"*
rm -rf "${SERVICE_REPO_DIR:?}/".* || :

git clone https://github.com/panosc-portal/cloud-provider-kubernetes.git $SERVICE_REPO_DIR/cloud-provider-kubernetes

# build docker image of cloud-provider-kubernetes
docker build -t cloud-provider-kubernetes $SERVICE_REPO_DIR/cloud-provider-kubernetes

# push cloud-provider-kubernetes to docker registry
docker tag cloud-provider-kubernetes "$DOCKER_REGISTRY_HOST"/panosc-portal/cloud-provider-kubernetes
docker push "$DOCKER_REGISTRY_HOST"/panosc-portal/cloud-provider-kubernetes

## Remove git repos dir
rm -rf $SERVICE_REPO_DIR

helm install panosc-portal-demo --set dockerRegistry.host="${DOCKER_REGISTRY_HOST}" ./panosc-portal-demo-chart
