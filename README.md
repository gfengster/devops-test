Install kvm, minikube and kubectl.

1. Build image<br>
   `docker build -t gfengster/devopstestweb:latest .`

2. Set up a minikube<br>
   `minikube start --driver=kvm`

3. Create a deployment<br>
   `kubectl apply -f deployment.yml`<br>
   or<br>
   `kubectl create deployment web-server --image=gfengster/devopstestweb:latest`<br>
   Set number of instances to 2.<br>
   `kubectl scale -n default deployment web-server --replicas=2`

4. Build load balancer and expose service<br>
   `kubectl apply -f service.yml`<br>
   or<br>
   `kubectl expose deployment web-server --type=LoadBalancer --port=80 --target-port=3000`

5. Find out the url<br>
   `minikube service web-server`<br>
   will show the http url for the service.
   