#!/bin/bash
set -e
SERVICE_REPO_DIR=git_repos

# Build panosc-portal-postgres
docker build -t panosc-portal-postgres panosc-portal-postgres

# Create and clean git repos dir
mkdir -p $SERVICE_REPO_DIR
rm -rf $SERVICE_REPO_DIR/*
rm -rf $SERVICE_REPO_DIR/.* ||:

# Clone and build docker image of cloud-provider-kubernetes
git clone https://github.com/panosc-portal/cloud-provider-kubernetes.git $SERVICE_REPO_DIR/cloud-provider-kubernetes
docker build -t cloud-provider-kubernetes $SERVICE_REPO_DIR/cloud-provider-kubernetes

