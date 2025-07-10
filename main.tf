provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  azs        = ["ap-south-1a", "ap-south-1b"]
}

module "iam" {
  source = "./modules/iam"
}

module "glue" {
  source             = "./modules/glue"
  glue_database_name = "my_glue_db"
  crawler_name       = "my_crawler"
  job_name           = "my_job"
  glue_role_arn      = module.iam.glue_role_arn
  s3_input_path      = "s3://your-bucket/input/"
  script_path        = "s3://your-bucket/scripts/my_script.py"
  temp_dir           = "s3://your-bucket/temp/"
  table_prefix       = "myprefix_"
}