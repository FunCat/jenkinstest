#!/bin/bash
export AWS_PROFILE=default
# aws-adfs login --profile eis-deliverydevqa --adfs-host fsx.ebsco.com
# awsr s3 ls --profile eis-deliverydevqa
timestamp=`date +%s`
# Builld the ami in devqa for testing
packer build -on-error=ask \
-var vpc_id=vpc-3697974e \
-var subnet_id=subnet-fad0b7d5 \
-var timestamp=$timestamp \
-var app_name=Testinstance \
Packerfile
