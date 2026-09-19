#!/bin/bash

set -e

STACK_NAME="aws-static-portfolio"

echo "Getting S3 bucket name..."

BUCKET_NAME=$(aws cloudformation describe-stacks \
  --stack-name "$STACK_NAME" \
  --query "Stacks[0].Outputs[?OutputKey=='WebsiteBucketName'].OutputValue" \
  --output text)

echo "Deploying website to: $BUCKET_NAME"

aws s3 sync ./website "s3://$BUCKET_NAME"

echo "Website deployment completed successfully."
