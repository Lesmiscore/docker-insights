#!/bin/bash
rm ~/.insight-bitzeny -rf

boot(){
  sleep 10
  while : ; do
    node /insight-api-bitzeny/insight.js
  done
}

boot &

bitzenyd -daemon -bind=0.0.0.0 -checkblocks=24 -checklevel=0 -dbcache=64 -disablewallet -listen -maxconnections=64 -par=2 -port=9253 -rpcallowip=127.0.0.1 -rpcbind=127.0.0.1 -rpcport=9252 -server -whitelist=127.0.0.1 -rpcpassword=password -rpcuser=user -addnode=121.109.144.238 -addnode=153.215.211.52 -addnode=203.152.216.77
