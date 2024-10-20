#!/bin/bash

. ./scripts/sam-alias.sh

# When the environment is the first argument,
# it loads variables from the TOML settings

if [ "$1" == "prod" ]; then
    CONFIG_ENV="prod"
else
    CONFIG_ENV="default"
fi

echo "$CONFIG_ENV Deployment has been started"

# AWS SAM deploy command is not working On Windows by cp949 encoding
# error although target file is encoded with utf-8
# But with guided, it can be resolved strangely
sam deploy --guided \
    --config-file samconfig.toml \
    --config-env $CONFIG_ENV \
    --force-upload
