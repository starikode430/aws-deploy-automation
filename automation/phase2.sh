#!/bin/bash

# Network Layer

# Set up VPC
sh automation/create/vpc.sh
# Set up hosted zones
sh automation/create/route53-hosted-zone.sh
# Create the hosted zone records
sh automation/create/route53-hosted-zone-records.sh
# Set up ssl certificates for domain names
sh automation/create/acm-ssl.sh
