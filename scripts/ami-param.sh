#!/bin/bash -ex

sudo yum install jq -y 

AMI_ID=$(jq -r '.builds[-1].artifact_id' manifest.json | cut -d ":" -f2)
echo $AMI_ID
aws ssm put-parameter \
--name "yourparameter" \
--type "String" \
--value "$AMI_ID" \
--overwrite