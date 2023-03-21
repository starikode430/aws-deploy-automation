#!/bin/bash

# Declare all the variables to be used in the stack
export CURRENT_STACK_NAME=elb
export UPDATE_STACK_COMPLETED="Stack ${CURRENT_STACK_NAME} UPDATE Completed"
export STACK_UPDATE_IN_PROGRESS="Stack ${CURRENT_STACK_NAME} UPDATE in progress"

aws cloudformation update-stack \
    --stack-name $CURRENT_STACK_NAME \
    --template-body file://templates/ec2/elb.yml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters \
        ParameterKey=ProjectName,ParameterValue=$PROJECT_NAME \
    --profile $AWS_DEPLOY_PROFILE

echo $STACK_UPDATE_IN_PROGRESS
aws cloudformation wait stack-update-complete \
    --stack-name $CURRENT_STACK_NAME \
    --profile $AWS_DEPLOY_PROFILE
echo $UPDATE_STACK_COMPLETED
