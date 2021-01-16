#!/bin/bash
user=$1
repo=$2
dockerhub_user=$3
dockerhub_repo=$4

if [ -z $3 ]
then
    dockerhub_user=$user
fi

if [ -z $4 ]
then
    dockerhub_repo=$repo
fi

git clone https://github.com/$user/$repo
cd $repo/

docker build -t $dockerhub_repo .

docker image tag $repo $dockerhub_user/$dockerhub_repo

echo "Docker Hub login: please enter password for $dockerhub_user:"
docker login --username $dockerhub_user

docker image push $dockerhub_user/$dockerhub_repo