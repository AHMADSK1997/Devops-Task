# Kaltura Devops home assignment
<img src="https://www.kaltura.org/images/logo.png">

## Befor Start
* Install the nginx ingress-controller in your cluster, follow instructions in this link: https://kubernetes.github.io/ingress-nginx/deploy/#docker-desktop
* Install minikube following the instructions in this link: https://minikube.sigs.k8s.io/docs/start/

## The Task
Build and deliver a simple nginx stack based on k8s

### Phase 1
* We craete dockerfile that consist of nginx
* The nginx need to publish your name and DOB as plain text
* We create a script to build and push the dockerfile in to Dockerhub

### Phase 2
* We add add [deployment](https://kubernetes.io/docs/tasks/run-application/run-stateless-application-deployment/) based on k8s yaml.
* The k8s deployment needs to utilize the nginx image built on the first phase.
* We should reach the nginx from our computer browser using port 80.

## Solution steps
1. Create html file `index.html` that display my name and my DOB as plain text 
2. Dockerfile:
```
FROM nginx:latest
# Copy html file from the current dir to the nginx image
COPY ./index.html /usr/share/nginx/html/index.html
```
3. Creat [Dockerhub repository](https://docs.docker.com/docker-hub/) named `ahmadsk/webserver`

4. Create Jenkinsfile that incalude script to build and push the dockerfile in to Dockerhub, we run it in the jenkins
<img width="700" alt="screenshot" src="https://imgur.com/gsDMeLg.jpg">

5. Create a deployment yml named `deployment yml` with service:
    * image from dockerhub that created in the previous phase: https://hub.docker.com/repository/docker/ahmadsk/webserver
    * Expose the deploy using type = ClusterIP
    * port 80

6. Create Ingress yml neamed `Ingress.yml` that manages external access to the services in a cluster.
    * Path `/` 
    * Port 80 

## Run using Ingress
```
    $ git clone https://github.com/AHMADSK1997/Kubernetes-Ingress.git
    $ cd Kubernetes-Ingress
    $ kubectl apply -f deployment.yml
    $ kubectl apply -f Ingress.yml
```
You can access the application here: http://localhost/

<img width="700" alt="screenshot" src="https://imgur.com/AhxV60J.jpg">

