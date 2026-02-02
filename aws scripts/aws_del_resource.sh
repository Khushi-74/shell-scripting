#!/bin/bash

###############################################
#this script deletes various AWS resources in the configured AWS account and region.
#Usage: ./aws_del_resource.sh <region> <service name> <resource id/name>
#example: ./aws_del_resource.sh us-east-1 ec2 i-0123456789abcdef0
#version 0.0
#author:Khushi
############################################

#verify the arguments are passed correctly
if [ $# -ne 3 ]; then
    echo "Please pass region, service name, and resource id/name as arguments"
    exit 1
fi

#verify aws installed
if ! command -v aws &> /dev/null; then
    echo "aws cli could not be found, please install aws cli"
    exit 1
fi


#verify aws configured
if [ ! -d ~/.aws ]; then
    echo "aws cli is not configured, please configure aws cli"
    exit 1
fi

aws_region=$1
service_name=$2
resource_id=$3

#check which service user want to delete the resources for and use switch case to delete the resources

case $service_name in
    ec2)
        echo "Deleting EC2 instance $resource_id in region $aws_region"
        aws ec2 terminate-instances --region $aws_region --instance-ids $resource_id
        ;;
    s3)
        echo "Deleting S3 bucket $resource_id"
        aws s3 rb s3://$resource_id --force
        ;;
    rds)
        echo "Deleting RDS instance $resource_id in region $aws_region"
        aws rds delete-db-instance --region $aws_region --db-instance-identifier $resource_id --skip-final-snapshot
        ;;
    *)
        echo "Service not supported. Please use one of the following services: ec2, s3, rds"
        exit 1
        ;;
esac




