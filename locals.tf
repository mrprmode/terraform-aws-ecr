locals {
  region   = var.aws_region
  name     = "${var.local_name.name}-${var.local_name.env}"
  git_repo = var.git_repo

  tags = {
    Terraform = "true",
    Name      = var.local_name.name,
    Env       = var.local_name.env
  }
}
