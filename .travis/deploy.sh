#!/bin/bash

export REPO=oteemo/nexus-ip-cli-docker
docker build -f Dockerfile -t $REPO:$COMMIT .
docker tag $REPO:$COMMIT $REPO:$VERSION
docker push $REPO