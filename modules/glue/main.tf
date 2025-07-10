resource "aws_glue_catalog_database" "this" {
  name = var.glue_database_name
}

resource "aws_glue_crawler" "this" {
  name          = var.crawler_name
  role          = var.glue_role_arn
  database_name = aws_glue_catalog_database.this.name
  table_prefix  = var.table_prefix

  s3_target {
    path = var.s3_input_path
  }
}

resource "aws_glue_job" "this" {
  name     = var.job_name
  role_arn = var.glue_role_arn

  command {
    name            = "glueetl"
    script_location = var.script_path
    python_version  = "3"
  }

  default_arguments = {
    "--TempDir"                             = var.temp_dir
    "--job-language"                        = "python"
    "--enable-continuous-cloudwatch-log"    = "true"
    "--enable-metrics"                      = ""
  }

  max_retries        = 1
  glue_version       = "4.0"
  number_of_workers  = 2
  worker_type        = "G.1X"
}

resource "aws_glue_trigger" "trigger" {
  name     = "${var.job_name}-trigger"
  type     = "ON_DEMAND"

  actions {
    job_name = aws_glue_job.this.name
  }
}

resource "aws_glue_workflow" "workflow" {
  name = "${var.job_name}-workflow"
}

resource "aws_glue_trigger" "workflow_trigger" {
  name          = "${var.job_name}-workflow-trigger"
  type          = "ON_DEMAND"
  workflow_name = aws_glue_workflow.workflow.name

  actions {
    job_name = aws_glue_job.this.name
  }
}