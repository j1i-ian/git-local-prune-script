#!/bin/bash

. ./scripts/sam-alias.sh

sam local start-api -t template.yaml --skip-pull-image
