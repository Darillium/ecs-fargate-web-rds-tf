# output "repository_url" {
#   value = "${aws_ecr_repository.petclinic_app.repository_url}"
# }

output "cluster_name" {
  value = "${aws_ecs_cluster.cluster.name}"
}

output "service_name" {
  value = "${aws_ecs_service.web.name}"
}

output "alb_dns_name" {
  value = "${aws_alb.alb_petclinic.dns_name}"
}

output "alb_zone_id" {
  value = "${aws_alb.alb_petclinic.zone_id}"
}

output "ecs_security_group_id" {
  value = "${aws_security_group.ecs_service.id}"
}

output "db_init_task_definition_name" {
  value = "${aws_ecs_task_definition.db_init.family}"
}
