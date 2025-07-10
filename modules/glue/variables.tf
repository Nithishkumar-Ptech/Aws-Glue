variable "glue_database_name" {
  description = "Name of the Glue Data Catalog database"
  type        = string
}

variable "glue_s3_input_path" {
  description = "S3 input path for the crawler"
  type        = string
}

variable "glue_s3_output_path" {
  description = "S3 output path for temporary Glue job data"
  type        = string
}

variable "job_script_location" {
  description = "S3 location of the Glue job script"
  type        = string
}

variable "crawler_name" {
  description = "Name of the Glue crawler"
  type        = string
}

variable "job_name" {
  description = "Name of the Glue ETL job"
  type        = string
}

variable "trigger_name" {
  description = "Name of the Glue trigger"
  type        = string
}

variable "workflow_name" {
  description = "Name of the Glue workflow"
  type        = string
}

variable "iam_role_arn" {
  description = "IAM role ARN for Glue job and crawler execution"
  type        = string
}

variable "log_group_name" {
  description = "CloudWatch log group name for Glue job logs"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for Glue connection (if needed)"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for Glue job networking"
  type        = list(string)
}