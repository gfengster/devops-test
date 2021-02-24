FROM alpine

RUN apk add npm

COPY ./*js /devops-test/
COPY ./package.json  /devops-test/

CMD cd /devops-test && npm start
