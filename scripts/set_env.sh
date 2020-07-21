#!/bin/bash
export TF_VAR_region="eu-west-2"

## rds
export TF_VAR_staging_database_name="`pwgen -A0B 15 -1`_staging"
export TF_VAR_staging_database_username="`pwgen -A0B 10 -1`"
export TF_VAR_staging_database_password="`pwgen -cns 40 -1`"
export TF_VAR_staging_app_database_username="`pwgen -A0B 10 -1`"
export TF_VAR_staging_app_database_password="`pwgen -cns 40 -1`"
