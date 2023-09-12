#!/bin/bash -ex

aws ec2 describe-images \
--region us-east-1   \
--filters "Name=tag:Name,Values=chef_infra_*" \
--output text