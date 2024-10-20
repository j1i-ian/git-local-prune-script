#!/bin/bash

. ./scripts/sam-alias.sh

rm -rf .aws-sam

sam build --use-container
