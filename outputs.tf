output "glue_role_arn" {
  value = module.iam.glue_role_arn
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
