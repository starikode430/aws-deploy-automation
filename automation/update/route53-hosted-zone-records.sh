#!/bin/bash

# Create the AWS stack for the RDS
export CURRENT_STACK_NAME=hosted-zone-records
export UPDATE_STACK_COMPLETED="Stack ${CURRENT_STACK_NAME} UPDATE Completed"
export STACK_UPDATE_IN_PROGRESS="Stack ${CURRENT_STACK_NAME} UPDATE in progress"

aws cloudformation update-stack \
    --stack-name $CURRENT_STACK_NAME \
    --template-body file://templates/route53/records/update-hosted-zone-records.yml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters \
        ParameterKey=ServerDomainName,ParameterValue=$SERVER_SUBDOMAIN_NAME.$DOMAIN_NAME \
        ParameterKey=ClientDomainName,ParameterValue=$CLIENT_SUBDOMAIN_NAME.$DOMAIN_NAME \
        ParameterKey=ProjectName,ParameterValue=$PROJECT_NAME \
    --profile $AWS_DEPLOY_PROFILE

# Create Output for Stack UPDATE in progress
echo $STACK_UPDATE_IN_PROGRESS
# Wait for the stack UPDATE to be complete 
aws cloudformation wait stack-update-complete \
--stack-name $CURRENT_STACK_NAME \
--profile $AWS_DEPLOY_PROFILE
echo $UPDATE_STACK_COMPLETED