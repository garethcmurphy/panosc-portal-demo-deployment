PaNOSC  Portal Demo Deployment
=============================

This project is a kubernetes deployment demo version of the PaNOSC Portal. 

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

## Status

31/01/2019 :

This project will deploy the panosc  Cloud Provider Kubernetes  microservice  and a PostgreSQL database with the example data for the demo. 

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
