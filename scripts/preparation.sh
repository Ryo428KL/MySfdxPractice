#!/bin/bash
ORG_NAME=$1

echo "Start org create and push local resources. Org name is $ORG_NAME"

sfdx force:org:create -s -f config/project-scratch-def.json -a $ORG_NAME

sfdx force:source:push -u $ORG_NAME

sfdx force:apex:execute -f scripts/apex/setupPermissionSet.apex -u $ORG_NAME

sfdx force:apex:execute -f scripts/apex/setupData.apex -u $ORG_NAME
