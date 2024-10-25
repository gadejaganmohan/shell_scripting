#!/bin/bash
#############################
#Author: Jagan
#Date: 25-10-2024
#Version: v1
##############################

set -x

aws ec2 describe-instances --region us-east-1 | jq '.Reservations[].Instances[].InstanceId' >> result.txt

aws s3 ls >> result.txt

aws lambda list-functions >> result.txt

aws iam list-users >> result.txt
