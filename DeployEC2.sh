#!/bin/bash

# Export the AWS profile so you can use it in this shell
export AWS_PROFILE=dev

# Prompt the user for input
echo -e "Welcome.  Type \"p\" to deploy the production environment, or type \"d\" to deploy the development environment. \nEnter your choice: "

# Read the user's input into a variable
read user_input

# Test the input string using an if statement
if [[ "$user_input" == "p" ]]; then
  echo "You opted to deploy the production environment." 
  sudo terraform init
  sudo terraform apply -var-file=prod.tfvars -auto-approve > terraform_output.txt
  echo -e "\nThe production EC2 instance has been deployed."
elif [[ "$user_input" == "d" ]]; then
  echo "You opted to deploy the development environment."
  sudo terraform init
  sudo terraform apply -var-file=dev.tfvars -auto-approve > terraform_output.txt
  echo -e "\nThe development EC2 instance has been deployed."
else
  echo "You entered a invalid option."
fi

echo -e "\nIf you would like to delete the EC2 instance at this time, type \"y\": "

# Read the user's input into a variable
read user_response

# Test the input string using an if statement
if [[ "$user_response" == "y" ]]; then
  echo -e "Termination of the EC2 instance is beginning.\n"
  if [[ "$user_input" == "p" ]]; then
    sudo  terraform destroy -auto-approve -var-file=prod.tfvars >> terraform_output.txt
  elif [[ "$user_input" == "d" ]]; then
    sudo terraform destroy -auto-approve -var-file=dev.tfvars >> terraform_output.txt
  fi
  echo "The EC2 instance has been terminated. Thank you."
else
  echo -e  "You've opted to keep your EC2 instance up and running.\n Thank you."
fi
