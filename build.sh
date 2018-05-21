#!/bin/bash

if [ ! -d ./instantclient_12_2 ];
  then unzip instantclient_12_2.zip;
fi;
docker build -t node-oracle:$1 -t node-oracle:latest -f ./dockerfile .;