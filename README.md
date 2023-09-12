# Custom AMI Build using HashiCorp Packer
This repo serves as a skeleton example for deploying a custom AMI from an AWS CodeBuild Project using HashiCorp Packer (https://developer.hashicorp.com/packer)

Prerequisites
-  Ensure that AWS environment can run codebuild successfully  
      - I needed to created a new vpc with private & public subnets see - https://docs.aws.amazon.com/codebuild/latest/userguide/vpc-support.html#enabling-vpc-access-in-projects
- Insert Variables that match your environment


How does this work?
- CodeBuild is ran from the file in the root directory named "buildspec.yaml"
- In that file I do two things
      1. Make scripts executables
      2. Run scripts 

Bash Scripts are built in sections to be be filled in 
- Utilize install-dependencies 
- Utilize install-software to install any applications
- Utilize validate-ami to ensure ami has been created 