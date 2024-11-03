output "ecr_repo" {
  value = module.ecr.repository_url
}

output "docker_image" {
  value = docker_image.my-docker-image.image_id
}
