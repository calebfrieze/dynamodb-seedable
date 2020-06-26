#!/bin/sh
echo "Populating DynamoDB with seed data"

# AWS DynamoDB requires configuration even on local environments
aws configure set aws_access_key_id dynamodb-local-access-key-id
aws configure set aws_secret_access_key dynamodb-local-secret-access-key
aws configure set default.region us-east-1

# Use JSON to populate database
aws dynamodb batch-write-item --request-items file://ProductCatalog.json
aws dynamodb batch-write-item --request-items file://Forum.json
aws dynamodb batch-write-item --request-items file://Thread.json
aws dynamodb batch-write-item --request-items file://Reply.json
