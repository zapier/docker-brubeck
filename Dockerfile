FROM ubuntu:14.04

RUN apt-get update && apt-get -y install build-essential libjansson-dev libssl-dev libmicrohttpd-dev git wget unzip jq

RUN wget https://github.com/github/brubeck/archive/956375bc21b6604497efa0d69c858cb10be430bd.zip -O brubeck.zip

RUN unzip brubeck.zip && mv brubeck-* brubeck

RUN cd brubeck && ./script/bootstrap

ADD config.template.json /config.template.json

ADD generate_config.sh /generate_config.sh

CMD /generate_config.sh && ./brubeck/brubeck --config=config.json
