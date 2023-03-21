#!/bin/bash

# Computing Layer

# Create ELB
sh automation/create/ec2-elb.sh
# Create the cluster
sh automation/create/ecs-cluster.sh
# Create the tasks
sh automation/create/ecs-tasks.sh
# Create ECS services
sh automation/create/ecs-services.sh
# Update the hosted zone records to route traffic to the load balancer
sh automation/update/route53-hosted-zone-records.sh
