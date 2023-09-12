#!/bin/bash -ex
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
printf "Installing HashiCorp Packer...\n"
sudo yum -y install packer
sudo rpm -ql packer #Finding where packer is installed#
/usr/bin/packer --help
