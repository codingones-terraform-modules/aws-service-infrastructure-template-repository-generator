resource "github_repository_file" "main" {
  repository          = module.repository.repository_name
  branch              = module.repository.default_branch_name
  file                = "main.tf"
  content             = module.main_template.rendered
  commit_message      = "feat: adding terraform aws main file"
  commit_author       = var.commit_author
  commit_email        = var.commit_email
  overwrite_on_create = true
}

resource "github_repository_file" "variables" {
  repository          = module.repository.repository_name
  branch              = module.repository.default_branch_name
  file                = "variables.tf"
  content             = data.http.variables_template.response_body
  commit_message      = "feat: adding terraform aws variables file"
  commit_author       = var.commit_author
  commit_email        = var.commit_email
  overwrite_on_create = true
}

resource "github_repository_file" "tags" {
  repository          = module.repository.repository_name
  branch              = module.repository.default_branch_name
  file                = "tags.tf"
  content             = data.http.tags_template.response_body
  commit_message      = "feat: adding terraform aws tags file"
  commit_author       = var.commit_author
  commit_email        = var.commit_email
  overwrite_on_create = true

  lifecycle {
    ignore_changes = all
  }
}

resource "github_repository_file" "terraformignore" {
  repository          = module.repository.repository_name
  branch              = module.repository.default_branch_name
  file                = ".terraformignore"
  content             = data.http.terraformignore_template.response_body
  commit_message      = "feat: adding terraformignore"
  commit_author       = var.commit_author
  commit_email        = var.commit_email
  overwrite_on_create = true

  lifecycle {
    ignore_changes = all
  }
}

data "http" "terraformignore_template" {
  url = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraformignore/.terraformignore"
}

module "main_template" {
  source       = "github.com/codingones-terraform-modules/terraform-remote-template-renderer"
  template_url = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/main.tf"
  template_variables = {
    __TERRAFORM_WORKSPACE = var.service
    __AWS_PROVIDER_REGION = "us-east-1"
  }
}

data "http" "variables_template" {
  url = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/${var.service}/variables.tf"
}

data "http" "tags_template" {
  url = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/tags.tf"
}

