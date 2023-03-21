#!/bin/bash

# IAM Layer

# Set up admin user
echo "## 1.1 Starts"
echo "- setting up the $AWS_ADMIN_PROFILE AWS Profile for AWS CLI."
aws configure --profile $AWS_ADMIN_PROFILE
echo "## 1.1 Done"
# Set up IAM for a deployment user
echo "## 1.2 Starts"
sh automation/create/iam.sh
echo "- Create the programatic access for the $AWS_DEPLOY_PROFILE profile"
echo "## 1.2 Done"
# Set up deployment user
echo "- setting up the $AWS_DEPLOY_PROFILE AWS Profile for AWS CLI."
aws configure --profile $AWS_DEPLOY_PROFILE