#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"
pwd

if [ ! -e oracle-xe-11.2.0-1.0.x86_64.rpm.zip ]; then
  echo "First download oracle-xe-11.2.0-1.0.x86_64.rpm.zip"
  echo "http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html"
  exit 1
fi

IMAGE=1000kit/oraclexe

echo "build oracle database with console "
docker build --rm --force-rm -t ${IMAGE} .

docker tag ${IMAGE}:latest  ${IMAGE}:11.2.0-1.0


#end
