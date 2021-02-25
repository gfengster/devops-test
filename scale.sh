#! /bin/bash
num=$1

tmpconfig="nginx.tmp"

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    exit 1
fi

if [ "$((num))" -lt 1 ]; then
    echo "The number of web server must be more than 1"
    exit 2
fi

echo set number of webserver to $num

docker-compose scale web=$1

webservers=$(docker ps -q | xargs -n 1 docker inspect --format '{{ .Name }}' | sed 's/\// /' | grep devops-test_web)

for i in $webservers; do  urls=$(echo -e "server ${i}:3000;\n")$urls; done

echo $urls

sed 's/server devops-test_web_1:3000;/'"$urls"'/' ./config/nginx.conf > $tmpconfig

docker cp nginx.tmp gateway:/etc/nginx/nginx.conf

docker exec  gateway /etc/init.d/nginx reload

rm $tmpconfig
