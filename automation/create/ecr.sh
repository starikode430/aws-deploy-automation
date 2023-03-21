#!/bin/bash


# Declare all the variables to be used in the stack
export CURRENT_STACK_NAME=ecr
export CREATE_STACK_COMPLETED="Stack ${CURRENT_STACK_NAME} Creation Completed"
export STACK_CREATION_IN_PROGRESS="Stack ${CURRENT_STACK_NAME} Creation in progress"

# Create the CICD stack
aws cloudformation create-stack \
    --stack-name $CURRENT_STACK_NAME \
    --template-body file://templates/ecr/ecr.yml \
    --profile $AWS_DEPLOY_PROFILE

echo $STACK_CREATION_IN_PROGRESS
aws cloudformation wait stack-create-complete \
    --stack-name $CURRENT_STACK_NAME \
    --profile $AWS_DEPLOY_PROFILE
echo $CREATE_STACK_COMPLETED