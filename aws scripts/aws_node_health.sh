#!/bin/bash
#author: Khushi
#version: 0.0
#description: This script checks the health status of AWS EC2 instances in the configured AWS account and region.
#Usage: ./aws_node_health.sh <region>
#example: ./aws_node_health.sh ap-south-1| tee report.txt  
###############################################

#verify the arguments are passed correctly

if [ $# -ne 1 ]; then
    echo "Please pass the region as an argument"
    exit 1
fi

#verify if aws cli is installed

if ! command -v aws &> /dev/null; then
    echo "aws cli could not be found, please install aws cli"
    exit 1
fi

#verify if aws cli is configured

if [ ! -d ~/.aws ]; then
    echo "aws cli is not configured, please configure aws cli"
    exit 1
fi

aws_region=$1

#list the  cpu usage memory disk usage and uptime of the ec2 instances in the logged in aws cli

top -b -n1 | head -5
echo "-------------------------------------"

free -h
echo "-------------------------------------"

du -h --max-depth=1 /
echo "-------------------------------------"

uptime
echo "-------------------------------------"



