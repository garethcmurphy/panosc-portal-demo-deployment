Cloud Provider Kubernetes
=========================

For this demo, this microservice can be used to create a Remote Desktop instance (using a [xrdp Ubuntu docker image](https://hub.docker.com/r/danielguerra/ubuntu-xrdp-base)) or a Jupyter Notebook instance (using a basic [Jupiter Notebook docker image](https://hub.docker.com/r/jupyter/base-notebook)).


Note: for the Remote Desktop instance, the Ubuntu default user and password are both ubuntu

To use the microservice, it is recomanded to use the  [PaNOSC Cloud Provider CLI Client](https://github.com/panosc-portal/cloud-provider-client-cli) by specifying the ip address of your kubernetes cluster and the cloud-provider-kubernetes service external port (port 32300).
<br/>
## Create a Remote Desktop or Jupyter Notebook  


Step 1 - Add an instance to the cloud-provider:

Once the CLI is installed, move to the project directory and run the next command to add an instance.
```
./bin/run instance:add -u http://<kubernetesClusterAddress>:32300
```

![][cloud-provider-cli-image-select.png]

You will then be able to choose the image you want for your instance and then the flavour that you want (i.e CPU and RAM)<br/>

Then, enter a name for you new instance. For the rest of the questions, you can put the default values.

<br/>
Step 2 - List all the created instances:

Next you can follow the status of your instance by running the next command:
```
./bin/run instance:list -u http://<kubernetesClusterAddress>:32300
```
Here you will see 

Note: if your are using docker-desktop, use the localhost address instead of the given address


## Access to resources
All the object related to the created instances can be found in kubernetes under the namespace panosc-kubernetes-instances.

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
