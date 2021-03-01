Install kvm, minikube and kubectl.

1. Build image<br>
   `docker build -t gfengster/devopstestweb:latest .`

2. Set up a minikube<br>
   `minikube start --driver=kvm --extra-config=apiserver.service-node-port-range=80-30000`

3. Create a deployment<br>
   `kubectl apply -f deployment.yml`

4. Build load balancer and expose service<br>
   `kubectl apply -f service.yml`

5. Find out load balancer ip<br>
   `minikube ip`<br>
  
6. Access http url<br>
    Get ip from step5<br>
   `curl {ip}`<br>
   For example<br>
   `curl 192.168.39.4`
   