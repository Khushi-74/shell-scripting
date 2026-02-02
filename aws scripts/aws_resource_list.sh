#!/bin/bash

######################################
#version 0.0
#author:Khushi
#description: This script lists various AWS resources in the configured AWS account and region.
#Usage: ./aws_resource_lists.sh <region> <service name>
#example: ./aws_resource_lists.sh us-east-1 ec2
######################################


#check if parametrs are passed correctly in argument

if ["$#" -ne 2];then
    echo "Please pass region and service name as arguments"
    exit 1
fi

aws_region=$1
service_name=$2



#check if aws cli is installed

if ! command -v aws &> /dev/null
then
    echo "aws cli could not be found, please install aws cli"
    exit 1
fi

#check if aws cli is configured

if [ ! -d ~/.aws ];then
    echo "aws cli is not configured, please configure aws cli"
    exit 1
fi


#check which service user want to list the resources for and use switch case to list the resources

case $service_name in
    ec2)
        echo "Listing EC2 instances in region $aws_region"
        aws ec2 describe-instances --region $aws_region --query 'Reservations[*].Instances[*].[InstanceId,InstanceType,State.Name,PublicIpAddress]' --output table
        ;;
    s3)
        echo "Listing S3 buckets"
        aws s3api list-buckets --query 'Buckets[*].[Name,CreationDate]' --output table
        ;;
    rds)
        echo "Listing RDS instances in region $aws_region"
        aws rds describe-db-instances --region $aws_region --query 'DBInstances[*].[DBInstanceIdentifier,DBInstanceClass,Engine,DBInstanceStatus]' --output table
        ;;
    *)
        echo "Service not supported. Please use one of the following services: ec2, s3, rds, lambda"
        exit 1
        ;;
esac

