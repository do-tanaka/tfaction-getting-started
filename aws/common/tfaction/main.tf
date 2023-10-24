module "aws" {
  source      = "github.com/suzuki-shunsuke/terraform-aws-tfaction?ref=v0.1.4"
  name        = "tanaka-github"
  main_branch = "main"
  repo        = var.repo_name


  s3_bucket_tfmigrate_history_name   = var.s3_tfaction_bucket_name
  s3_bucket_terraform_plan_file_name = var.s3_tfaction_bucket_name
  s3_bucket_terraform_state_name     = var.s3_tfaction_bucket_name
}
