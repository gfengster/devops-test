Install minicube docker

docker build -t gfengster/devopstestweb:latest .


minikube start --driver=docker

minikube start --driver=docker --cpus=4 --memory=8g

minikube config set driver docker


Create a deployment

kubectl create deployment web-server --image=gfengster/devopstestweb:latest

kubectl create deployment web-server --image=docker.io/gfengster/devopstestweb:latest

kubectl expose deployment web-server --type=LoadBalancer --port=3000 --target-port=30300


kubectl scale -n default deployment web-server --replicas=2
