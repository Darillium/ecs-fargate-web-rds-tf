output "alb_dns_name" {
  value = "${module.ecs-fargate.alb_dns_name}"
}

output "service_name" {
    value = "${module.ecs-fargate.service_name}"
}

output "cluster_name" {
  value = "${module.ecs-fargate.cluster_name}"
}

output "security_group_id" {
  value = "${module.ecs-fargate.ecs_security_group_id}"
}

output "db_init_task_definition_name" {
  value = "${module.ecs-fargate.db_init_task_definition_name}"
}

output "public_subnets_id" {
  value = ["${module.networking.public_subnets_id}"]
}

output "private_subnets_id" {
  value = ["${module.networking.private_subnets_id}"]
}

output "default_sg_id" {
  value = "${module.networking.default_sg_id}"
}

output "security_groups_ids" {
  value = ["${module.networking.security_groups_ids}"]
}

output "db_access_sg_id" {
  value = "${module.rds.db_access_sg_id}"
}

output "rds_sg" {
  value = "${module.rds.rds_sg_id}"
}
