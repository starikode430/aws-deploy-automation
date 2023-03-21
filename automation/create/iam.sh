#!/bin/bash

export CURRENT_STACK_NAME=iam
aws cloudformation update-stack --stack-name $CURRENT_STACK_NAME \
    --template-body file://templates/iam/iam.yml \
    --parameters \
        ParameterKey=DeploymentName,ParameterValue=$AWS_DEPLOY_PROFILE \
        ParameterKey=ECRName,ParameterValue=$AWS_ECR_PROFILE \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile $AWS_ADMIN_PROFILE
echo "STACK_CREATION_IN_PROGRESS"

# Wait for the stack creation to be complete 
aws cloudformation wait stack-create-complete \
    --stack-name $CURRENT_STACK_NAME \
    --profile $AWS_ADMIN_PROFILE
echo "CREATE_STACK_COMPLETED"