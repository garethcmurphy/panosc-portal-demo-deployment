PaNOSC Portal Demo Deployment
=============================

This is a demo version of the PaNOSC Portal.

The goal of this project is to provide an easy way of deploying and testing the PaNOSC Portal. This version has a minimum of prerequisites and comes with a database of 
example values to allow users to test without having to define the different objects needed for the portal (example: Images, Flavours ... ).
The whole architecture of the portal is documented at the following address: https://confluence.panosc.eu/display/wp4/Common+Portal+Initial+Design.

## Requirements :
- A kubernetes cluster with Helm 3 (see https://helm.sh/docs/intro/install/)
- A private Docker registry with no authentication (see https://docs.docker.com/registry/deploying/)


## Installation
To deploy the portal, you need to clone this project to your kubernetes cluster and connect to a user that is a member of the docker group.<br/>
Afterward, move to the directory and execute the script deploy.sh followed by the address of your private repository:
```
./deploy.sh  <YourPrivateRepoAddress>
```
This script will push the microservices docker images to your private docker registry and then deploy them on the kubernetes cluster with helm.
You can then find the kubernetes services and pods in the namespace panosc-portal.

## Uninstall  
```
helm uninstall panosc-portal-demo
```

## Documentation

### Cloud Provider Kubernetes

For this demo, this microservice can be used to create a Remote Desktop instance (using a [xrdp Ubuntu docker image](https://hub.docker.com/r/danielguerra/ubuntu-xrdp-base)) or a Jupyter Notebook instance (using a basic [Jupiter Notebook docker image](https://hub.docker.com/r/jupyter/base-notebook)).


Note: for the Remote Desktop instance, the Ubuntu default user and password are both ubuntu

To use the microservice, you can use the [PaNOSC Cloud Provider CLI Client](https://github.com/panosc-portal/cloud-provider-client-cli) by specifying the ip address of your kubernetes cluster and the cloud-provider-kubernetes service external port (port 32300).
<br/>Example:

Add an instance to the cloud-provider:
```
./bin/run instance:add -u http://<kubernetesClusterAddress>:32300
```

List all the created instances:
```
./bin/run instance:list -u http://<kubernetesClusterAddress>:32300
```
Note: if your are using docker-desktop, use the localhost address instead of the given address

All the object related to the created instances can be find in kubernetes under the namespace panosc-kubernetes-instances.

<br/>
The database is also accessible with the following information:

```
host: panosc-portal-postgres  
port: 32301
username: cloud-provider-kubernetes  
password: panosc
databaseName: cloud-provider-kubernetes  
schema: cloud-provider-kubernetes
```


## Status

The deployment of the portal will be continually updated when new microservices are added. The current status is shown below.

04/02/2019 :

This project will deploy the  [Cloud Provider Kubernetes](https://github.com/panosc-portal/cloud-provider-kubernetes) microservice and a PostgreSQL database with the example data. 

