echo "running command aws ecs update-service --region ${TF_VAR_region} --cluster `terraform output cluster_name` --service `terraform output service_name` --desired-count 1 --health-check-grace-period-seconds 30"

aws ecs update-service --region ${TF_VAR_region} --cluster `terraform output cluster_name` --service `terraform output service_name` --desired-count 1 --health-check-grace-period-seconds 30
