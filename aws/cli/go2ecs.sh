#!/bin/bash

CLUSTER=${1:-app-cluster}
CONTAINER_NAME=${2:-app-name}

TASK_ID=$(aws ecs list-tasks --cluster $CLUSTER --desired-status 'RUNNING' --output text | awk -F "/" '{ print $3 }')

aws ecs execute-command --cluster $CLUSTER \
    --task $TASK_ID \
    --container $CONTAINER_NAME  \
    --interactive \
    --command "/bin/sh"
