#!/bin/bash

echo "Checking application logs..."

grep ERROR ../logs/app.log

echo "Creating Backup..."

cp ../logs/app.log ../logs/app.log.bak

echo "Monitoring Completed"


