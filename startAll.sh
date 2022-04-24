#!/bin/sh


# stopping and deleting all containers:
docker container stop dramvisualizer
docker container rm dramvisualizer



# removing all images:
docker image rm jannes/to_dramvisualizer




# going to each subfolder and building + running every service in docker


cd ..
cd DreamVisualizer/dreamvisualizer ||return
docker build . -t jannes/to_dreamvisualizer
docker run --rm -d  -p 8080:80/tcp --name dreamvisualizer jannes/dreamvisualizer:latest

