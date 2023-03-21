#!/bin/bash

# Declare all the variables except Confidentials to be used in the stack
# SHOULD BE CHANGED for Deployment [START]
export PROJECT_NAME=belebel-ec
export APP_ENV=development
export DOMAIN_NAME=$APP_ENV.belmate.site
export SERVER_SUBDOMAIN_NAME=api
export CLIENT_SUBDOMAIN_NAME=www
export RedirectedFromDomain=$CLIENT_SUBDOMAIN_NAME.$DOMAIN_NAME
export RedirectToDomain=$DOMAIN_NAME
export BUILDSPEC_FILENAME=buildspec.yml
export SERVER_BUILDSPEC_FILEPATH=build/codebuild/$BUILDSPEC_FILENAME
export CLIENT_BUILDSPEC_FILEPATH=src/build/codebuild/$BUILDSPEC_FILENAME
export SECRET_MANAGER_NAME=$PROJECT_NAME
# SHOULD BE CHANGED for Deployment [END]
export GITHUB_BASE_DIR=https://github.com/viven-inc
export SERVER_REPO_URL=$GITHUB_BASE_DIR/$PROJECT_NAME-server
export CLIENT_REPO_URL=$GITHUB_BASE_DIR/$PROJECT_NAME-client
export AWS_ADMIN_PROFILE=$PROJECT_NAME-$APP_ENV-admin
export AWS_DEPLOY_PROFILE=$PROJECT_NAME-$APP_ENV-deployment
export AWS_ECR_PROFILE=$PROJECT_NAME-$APP_ENV-ecr

if [ $# -eq 0 ]
    then echo "Please choose number of phase from 1 to 5"
elif [ $1 = 1 ]; 
    then 
        echo "Phase 1 starts ..."
        sh ./automation/phase1.sh
elif [ $1 = 2 ]; 
    then 
        echo "Phase 2 starts ..."
        sh ./automation/phase2.sh 
elif [ $1 = 3 ]; 
    then
        echo "Phase 3 starts ..."
        sh ./automation/phase3.sh 
elif [ $1 = 4 ]; 
    then 
        echo "Phase 4 starts ..."
        sh ./automation/phase4.sh 
elif [ $1 = 5 ]; 
    then 
        echo "Phase 5 (CI/CD) starts ..."
        sh ./automation/phase5.sh 
fi