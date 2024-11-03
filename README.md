## terraform-aws-ecr
**Terraform configs to create a ECR on AWS, docker build remote git locally and push the image to ECR**

#### Setup AWS profile+region for Terraform, ECR, and `docker [provider] login`
```
export AWS_ACCESS_KEY_ID="AK................................KMZ" && \
   export AWS_SECRET_ACCESS_KEY="K7J..............................................Tnfj"
```
#### Apply the Terraform configs for ECR
`terraform apply`
#### Get AWS ECR repo url from Terraform output
`terraform output --raw ecr_repo_url`

The configs do the following via `provider "docker" { ... }`
1. uses `github.com/mrprmode/mountains` as the `remote_context`
2. Builds a docker image, tags `${ecr_repo_url}:latest`, and keeps a copy locally, ie. `docker image ls`
3. And, pushes the above image to the private ECR created

#### Edit `terraform.tfvars`: if using a different AWS region "and" your git repo to build "your" docker image
```
# aws_region = "us-west-2"
git_repo   = "https://github.com/mrprmode/mountains.git"
```
or `terraform apply -var aws_region="some-region" -var git_repo="some_repo"`

#### Apply the Terraform configs
`terraform apply`
