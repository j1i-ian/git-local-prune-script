#!/bin/bash

# In general, this script is used to deploy
# to the development server.
# It uses a Node.js app as an example,
# so please modify it accordingly

PEM_PATH=./app.pem
BUILD_DIRECTORY=dist
APP_PATH=/home/ubuntu/dev-app

# clean build
ssh -o StrictHostKeyChecking=no -i $PEM_PATH ubuntu@$1 "cd dev-app && rm -rf $BUILD_DIRECTORY"

scp -o StrictHostKeyChecking=no -i $PEM_PATH package.json package-lock.json .env.dev ecosystem.dev.json ubuntu@$1:$APP_PATH

# $BUILD_DIRECTORY is a the build directory that has the result of the source building
scp -o StrictHostKeyChecking=no -ri $PEM_PATH $(pwd)/$BUILD_DIRECTORY ubuntu@$1:$APP_PATH/$BUILD_DIRECTORY

ssh -o StrictHostKeyChecking=no -i $PEM_PATH ubuntu@$1 "cd dev-app && pm2 restart ecosystem.dev.json --env dev"
