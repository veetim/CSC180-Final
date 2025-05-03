#!/bin/bash

docker stop spotfire_vulnerable
docker rm spotfire_vulnerable
docker rmi spotfire_vulnerable

docker build --build-arg VERSION=14.4.2 -t spotfire_patched .
docker run -d --name spotfire_patched -p 8080:8080 spotfire_patched
