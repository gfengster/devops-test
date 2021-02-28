I run following commands on Ubuntu 20.04.2. docker and docker-compose are installed.

In the cluster, nginx is a gateway with load balance. The method is  Round Robin. The backend is two web servers. Http URL to access the service is **http://172.20.0.118**.

**Run CI/CD pipeline**

1.  Submit code change
    The repository is github (https://github.com/gfengster/devops-test). The main branch is default. After submited change to gihub. Auto-build will be triggered.
2.  Auto CI. 
    Check the CI in https://github.com/gfengster/devops-test/actions.
3.  Auto CD.
    If the build and test successfully, webserver and gateway images will be deployed to docker hub.
    Web server: https://hub.docker.com/repository/docker/gfengster/devops-test_web<br>
    Gateway: https://hub.docker.com/repository/docker/gfengster/devops-test_gateway

**Run cluster in local machine**

1. Build and start cluster

   `$  docker-compose up --build`

2. Test web server

   Run `curl 172.20.0.118` twice in a terminal. The results should come back difference.

   For example:

   First run:

   `curl 172.20.0.118`<br>
   `Hi there! I'm being served from e5376038dcc1` 

   Second run:

   `curl 172.20.0.118`<br>
   `Hi there! I'm being served from a39662dd7f59`

   If run again, the return should be the same as the first run.

   




