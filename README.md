PaNOSC Portal Demo Deployment
=============================

Demo version of the PaNOSC Portal.

The goal of this project is to provide an easy way of deploying and testing the PaNOSC Portal. This version comes with 
example values to allow users to test without having to define the different objects needed for the portal (example: Images, Flavours ... )
The whole architecture of the portal is documented at the following address: https://confluence.panosc.eu/display/wp4/Common+Portal+Initial+Design.

## Requirements :
- Have a kubernetes cluster with Helm 3 ( see https://helm.sh/docs/intro/install/)
- Have a private registry with no authentication  ( see https://docs.docker.com/registry/deploying/ )


## Installation
To deploy the portal, you need to move this project to your kubernetes cluster and connect to a user that is a member of the docker group.<br/>
Afterward, move to the directory and execute the script deploy.sh followed by the address of your private repository:
```
./deploy.sh  <YourPrivateRepoAdresse>
```

## Uninstall  
```
helm uninstall panosc-portal-demo
```

## Documentation

### Cloud Provider Kubernetes

For this demo, this microservice can be use to create a Desktop instance (using a [xrdp Ubuntu docker image](https://hub.docker.com/r/danielguerra/ubuntu-xrdp-base)) or a Jupyter Notebook instance (using a basic [Jupiter Notebook docker image](https://hub.docker.com/r/jupyter/datascience-notebook)).

Note: The Ubuntu image default user and password is ubuntu

To use the microservice, you can use the [PaNOSC Cloud Provider CLI Client](https://github.com/panosc-portal/cloud-provider-client-cli) by specifying the ip address of your kubernetes cluster and the cloud-provider-kubernetes service external port (port 32300).
<br/>Example:

Add an instance to the cloud-provider 
```
cloud-provider instance:add -u http://<kubernetesClusterAdresse>:32300
```

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

04/02/2019 :

This project will deploy the  [Cloud Provider Kubernetes](https://github.com/panosc-portal/cloud-provider-kubernetes) microservice and a PostgreSQL database with the example data. 

