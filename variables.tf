variable "service" {
  description = "The service name in the Project-Service-Layer architecture"
  nullable    = false
  default     = false
}
#
variable "github_organization" {
  description = "The github organization name"
  nullable    = false
  default     = false
}

variable "github_repository" {
  description = "The repository which host the code within the organization"
  nullable    = false
  default     = false
}

variable "commit_author" {
  description = "The commit author name for generated files"
  nullable    = false
  default     = "github-actions[bot]"
}

variable "commit_email" {
  description = "The commit author email for generated files"
  nullable    = false
  default     = "github-actions[bot]@users.noreply.github.com"
}

variable "files" {
  type = map(object({
    path               = string
    url_of_template    = string
    template_variables = map(string)
  }))
  nullable = false
}