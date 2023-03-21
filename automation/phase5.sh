#!/bin/bash

# CICD

# Create the CodeBuild Project
sh automation/create/codebuild.sh
# Create the CodeDeploy Project
sh automation/create/codedeploy.sh
## # Create the pipeline
## sh automation/create/codepipeline.sh