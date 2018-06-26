#!/bin/bash
cd `dirname $0`


###### const definition
img_mvn="maven:3.3.3-jdk-8"                 # docker image of maven
m2_cache=~/.m2                              # the local maven cache dir
proj_home=$PWD                              # the project root dir
img_output="deep/${artifactId}"         # output image tag


###### step1
git pull  # should use git clone https://name:pwd@xxx.git


###### step2 build project
if which mvn ; then
    echo "use local maven"
    mvn clean package
else
    echo "use docker maven"
    docker run --rm \
        -v $m2_cache:/root/.m2 \
        -v $proj_home:/usr/src/mymaven \
        -w /usr/src/mymaven $img_mvn mvn clean package
fi


###### step3 build image
sudo mv $proj_home/target/${artifactId}-*-SNAPSHOT.jar $proj_home/target/${artifactId}.jar # 兼容所有sh脚本
docker build -t $img_output .

###### step4 run containers
./startup-image.sh
