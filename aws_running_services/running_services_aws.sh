#!/bin/bash
export PATH=$PATH:/usr/local/bin
#############################
#Author: Jagan
#Date: 25-10-2024
#Version: v1
##############################

set -x

aws ec2 describe-instances --region us-east-1 | jq '.Reservations[].Instances[].InstanceId' >> services

aws s3 ls >> services

aws lambda list-functions >> services

aws iam list-users >> services
