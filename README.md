PaNOSC Portal Demo Deployment
=============================

This is a demo version of the PaNOSC Portal.

The goal of this project is to provide an easy way of deploying and testing the PaNOSC Portal. This version has a minimum of prerequisites and comes with a database of 
example values to allow users to test without having to define the different objects needed for the portal (example: Images, Flavours ... ).
The whole architecture of the portal is documented at the following address: https://confluence.panosc.eu/display/wp4/Common+Portal+Initial+Design.

## Requirements :
- A kubernetes cluster with Helm 3 (see https://helm.sh/docs/intro/install/)
- A private Docker registry with no authentication (see https://docs.docker.com/registry/deploying/)

Note: Instead of deploying a kubernetes cluster, you can use docker desktop on Mac or Windows. 
In that case, you have to use your localhost IP address for all connection to a container
instead of the displayed IP

## Installation
To deploy the portal, you need to clone this project to your kubernetes cluster and connect to a user that is a member of the docker group.<br/>
Afterward, move to the directory and execute the script deploy.sh followed by the address of your private repository:
```
./deploy.sh  <YourPrivateRepoAddress>
```
This script will push the microservices docker images to your private docker registry and then deploy them on the kubernetes cluster with helm.
You can then find the kubernetes services and pods in the namespace panosc-portal.

## Uninstall  
To uninstall all the kubernetes 
```
helm uninstall panosc-portal-demo
```
Note: If you want to reinstall it afterwards, you will have to wait a couple of minutes for all the kubernetes namespaces to be deleted
## Documentation

#### [Cloud Provider Kubernetes](docs/CloudProviderKubernetes.md)



## Status

The deployment of the portal will be continually updated when new microservices are added. The current status is shown below.

04/02/2019 :

This project will deploy the  [Cloud Provider Kubernetes](https://github.com/panosc-portal/cloud-provider-kubernetes) microservice and a PostgreSQL database with the example data. 

