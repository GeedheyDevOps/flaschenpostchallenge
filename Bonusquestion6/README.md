### Question ####
Draw build & deploy process including CI\CT\CQ\CD for the Backend application
(.Net \ Scala \ Python ) from the developer’s computer till the production release into
Azure Kubernetes Cluster ( AKS )

## Tools been used 
git 
github
jenkins
azure container registry (ACR)
azure kubernetes cluster (AKS)

# Flow Structure
 * git -> github -> jenkins -> ACR -> jenkins -> AKS

* An Existing Kubernertes Cluster in Azure (AKS)
* Set up a Jenkins Instance

# Configurations
- For Jenkins to listen to changes on the repo the github and jenkins needs to have the webhook configured 
This is done from the github section Webhook where the Payload URL for the jenkins host is added e.g `https://myjenkinshost.com:/github-webhook/`,
select the event you need to listen for and add the webhook. If the webhook is correct then jenkins would receive any event on the repository.

- Install Docker runtime on your jenkins instance and configure to have the right permissions and also `kubectl` to be able to run the command to deploy to kubernetes
    Jenkins: Plugins install (docker, dockerpipeline, kubernetes cli)

- Give jenkins access to your ACR and AKS: 
    Create credentials for jenkins to access ACR by getting the username and password from your ACR azure portal for ACR setup in manage jenkins
    Create your kubeconfig creadentials for connecting to your AKS clusters and add it to your jenkins instance as a secret file to allow jenkins run `kubectl` commands on the cluster.

* Setup your Jenkins Pipeline which would contain various steps: (build stage, test stage, deploy stage )

- Ensure that you have your application dockerized and have your dockerfile in your repo
- Ensure your Jenkinsfile containing your steps is in your root dir.
- Create your valid manifest files which would contain all the definitions for deploying your applications to kubernetes. 

- Typical Flow

A developer pushes their code to the repository which jenkins is intergrated to listen for event changes as soon as the code gets to github an event is triggered which kicks off the build process which builds the container image and pushes the images to ACR (which is already configured access from jenkins), a deploy stage is kicked off to deploy to the stage/edge kubernetes cluster (which pulls images from the ACR) and deploy the images to the clusters.

A functional Test is then kicked off to ensure the application is running correctly testing all endpoints depending on the test suites by the QA Engineers when this is passed the QA Engineer approves and merge to master and also the whoever needs to approve and that kicks off the a deploy stage to production cluster.