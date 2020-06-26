#!/bin/sh
echo "Populating DynamoDB with seed data"

# AWS DynamoDB requires configuration even on local environments
aws configure set aws_access_key_id dynamodb-local-access-key-id
aws configure set aws_secret_access_key dynamodb-local-secret-access-key
aws configure set default.region us-east-1

# Use JSON to populate database
aws dynamodb create-table --endpoint-url http://localhost:8000 --cli-input-json file://sample-data/CreateMusicTable.json
aws dynamodb batch-write-item --endpoint-url http://localhost:8000 --request-items file://sample-data/Music.json
