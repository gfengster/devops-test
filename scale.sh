#! /bin/bash
num=$1

tmpconfig="nginx.tmp"

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
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
