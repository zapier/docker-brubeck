FROM ubuntu:14.04

RUN apt-get update && apt-get -y install build-essential libjansson-dev libssl-dev libmicrohttpd-dev git jq

RUN git clone https://github.com/github/brubeck.git

RUN cd brubeck && ./script/bootstrap

ADD config.template.json /config.template.json

ADD generate_config.sh /generate_config.sh

CMD /generate_config.sh && ./brubeck/brubeck --config=config.json
