#!/bin/bash

# Storage layer

# Declare all the variables to be used in the stack
# Create the ECR 
sh automation/create/ecr.sh
# Create the RDS
sh automation/create/rds.sh
# Create any S3 buckets required
sh automation/create/s3.sh

