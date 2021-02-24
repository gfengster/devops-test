FROM alpine

RUN apk add npm

COPY ./src/*js /devops-test/
COPY ./src/package.json  /devops-test/

CMD cd /devops-test && npm start
