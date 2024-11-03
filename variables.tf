variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = ""
}

variable "local_name" {
  description = "Infra stack/cluster name and Environent for resources local name"
  type        = map(string)
  default = {
    name = "",
    env  = ""
  }

  # Load balancer names must be no more than 32 characters long, and can only contain a limited set of characters.
  validation {
    condition     = length(var.local_name["name"]) <= 16 && length(regexall("[^a-zA-Z0-9-]", var.local_name["name"])) == 0
    error_message = "The project tag must be no more than 16 characters, and only contain letters, numbers, and hyphens."
  }

  validation {
    condition     = length(var.local_name["env"]) <= 8 && length(regexall("[^a-zA-Z0-9-]", var.local_name["env"])) == 0
    error_message = "The environment tag must be no more than 8 characters, and only contain letters, numbers, and hyphens."
  }
}

variable "git_repo" {
  description = "Git repo to build Docker image from"
  type        = string
  default     = ""
}
