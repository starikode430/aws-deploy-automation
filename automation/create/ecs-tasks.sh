#!/bin/bash


# Declare all the variables to be used in the stack
export CURRENT_STACK_NAME=ecs-tasks
export CREATE_STACK_COMPLETED="Stack ${CURRENT_STACK_NAME} Creation Completed"
export STACK_CREATION_IN_PROGRESS="Stack ${CURRENT_STACK_NAME} Creation in progress"


# Create the Computing stack
aws cloudformation create-stack \
    --stack-name $CURRENT_STACK_NAME \
    --template-body file://templates/ecs/ecs-tasks.yml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters \
        ParameterKey=ProjectName,ParameterValue=$PROJECT_NAME \
    --profile $AWS_DEPLOY_PROFILE

# Create Output for Stack creation in progress
echo $STACK_CREATION_IN_PROGRESS
# Wait for the stack creation to be complete 
aws cloudformation wait stack-create-complete \
--stack-name $CURRENT_STACK_NAME \
--profile $AWS_DEPLOY_PROFILE
echo $CREATE_STACK_COMPLETED