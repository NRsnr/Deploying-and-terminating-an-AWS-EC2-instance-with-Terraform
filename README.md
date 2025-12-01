# Deploying-and-terminating-an-AWS-EC2-instance-with-Terraform
This repository contains files that I used to deploy (and terminate) an EC2 instance on AWS via Terraform.  The execution of this code was achieved through a bash script, which I've also included in this repository.

Description of files:
main.tf - This file contains the resource and provider information associated with the EC2 creation.  Credentials come from an AWS profile with appropriate permissions.  
variables.tf - This file contains the definitions of the variables needed for the EC2 instance.  All the variables are strings.
prod.tfvars - This file contains the variable values for an EC2 instance that can be created in the us-east-1 region.
dev.tfvars - This file contains the variable values for an EC2 instance that can be created in the us-west-1 region.
DeployEC2.sh - This is a simple bash script that calls terraform init, terraform apply, and terraform destroy. 
