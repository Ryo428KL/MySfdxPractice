#!/bin/bash
DEV_HUB=$1
ORG_NAME=$2

echo "Start org create and push local resources. Org name is $ORG_NAME"

sf org create scratch -f config/project-scratch-def.json -v $DEV_HUB -a $ORG_NAME --set-default

sf project deploy start -o $ORG_NAME

sf apex run -f scripts/apex/setupPermissionSet.apex -o $ORG_NAME

sf apex run -f scripts/apex/setupData.apex -o $ORG_NAME
