Cloud Provider Kubernetes  
=========================  
  
## Description  
The Cloud Provider Kubernetes is a micreservice that allows to create instances on a kubernetes service.  
  
For this demo, this microservice can be used to create a Remote Desktop instance (using a [xrdp Ubuntu docker image](https://hub.docker.com/r/danielguerra/ubuntu-xrdp-base)) or a Jupyter Notebook instance (using a basic [Jupiter Notebook docker image](https://hub.docker.com/r/jupyter/base-notebook)).  
  
Note: for the Remote Desktop instance, the Ubuntu default user and password are both ubuntu  
  
To use this service, you can clone the project  [PaNOSC Cloud Provider CLI Client](https://github.com/panosc-portal/cloud-provider-client-cli).  
## Create an instance   
### Add an instance to the cloud-provider:  
  
After you have installed the CLI, move to it's directory and run the next command to add an instance.  
```  
./bin/run instance:add -u http://<CloudProviderIP>:32300  
```  
You will then be able to choose the image you want for your instance and then the flavour that you want (i.e CPU and RAM)<br/>  
  
Then, enter a name for you new instance. For the rest of the questions, you can put the default values.  

### List all the created instances:  
  
Next you can follow the status of your instance by running the next command:  
```  
./bin/run instance:list -u http://<kubernetesClusterAddress>:32300  
```  
Here you will also be able to see the hostname for your instance (witch should be the hostname of you kubernetes master node)   
and the protocol used on that instance with the exposed port number.  
  
  
## Access to resources  
All the object related to the created instances can be find in kubernetes under the namespace panosc-kubernetes-instances.  
  
<br/>  
The database is also accessible with the following information:  
  
```  
host: <PanoscPostgresIP> port: 32301  
username: cloud-provider-kubernetes password: panosc  
databaseName: cloud-provider-kubernetes schema: cloud-provider-kubernetes  
```