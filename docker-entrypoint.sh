#!/bin/bash
  
# Bash job control
set -m
  
# Start the dynamodb process and put it in the background
dynamodb-bootstrap.sh &
  
# Run seed script
seed-data.sh
  
# Bring dynamodb process to foreground
fg %1
