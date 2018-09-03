FROM node:0.10.48

WORKDIR /

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install build-essential curl git nginx python unzip

RUN curl -LO https://github.com/BitzenyCoreDevelopers/bitzeny/releases/download/z2.0.1/bitzeny-2.0.1-x86_64-linux-gnu.tar.gz
RUN tar xvzf bitzeny-2.0.1-x86_64-linux-gnu.tar.gz
RUN cp /bitzeny-2.0.1/bin/bitzenyd /usr/local/bin/

RUN git clone --depth 1 https://github.com/BitzenyCoreDevelopers/insight-ui-bitzeny.git
RUN git clone --depth 1 https://github.com/BitzenyCoreDevelopers/insight-api-bitzeny.git

COPY boot.sh /usr/bin/boot-insight.sh
RUN chmod +x /usr/bin/boot-insight.sh

WORKDIR /insight-api-bitzeny
RUN npm install
WORKDIR /insight-ui-bitzeny

ENV INSIGHT_FORCE_RPC_SYNC=1
ENV INSIGHT_PUBLIC_PATH=public
ENV BITCOIND_USER=user
ENV BITCOIND_PASS=password
ENV INSIGHT_NETWORK=livenet
ENV INSIGHT_PORT=3000

EXPOSE 3000

CMD /usr/bin/boot-insight.sh


