#!/bin/bash

if [[ $1 != "deploy" && $1 != "preview" && $1 != "delete" ]]; then
    echo "Error: Only 'deploy', 'preview', or 'delete' are allowed."
    exit 1
fi

stack_name=$2
template_file=$3
parameters_overrides=$4
region=$5
capabilities_arg=""

if [ "$1" == "deploy" ] || [ "$1" == "preview" ]; then
    capabilities_arg="--capabilities CAPABILITY_NAMED_IAM"
fi

if [ "$1" == "deploy" ]; then
    aws cloudformation deploy \
        --stack-name "$stack_name" \
        --template-file "$template_file" \
        --parameter-overrides "file://$parameters_overrides" \
        --region "$region" \
        $capabilities_arg
fi

if [ "$1" == "delete" ]; then
    aws cloudformation delete-stack \
        --stack-name "$stack_name" \
        --region "$region"
fi

if [ "$1" == "preview" ]; then
    aws cloudformation deploy 
        --stack-name "$stack_name" \
        --template-file "$template_file" \
        --parameter-overrides "file://$parameters_overrides" \
        --region "$region" \
        --no-execute-changeset \
         $capabilities_arg
fi
