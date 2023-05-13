resource "github_repository_file" "readme" {
  repository          = module.repository.repository_name
  branch              = module.repository.default_branch_name
  file                = "README.md"
  content             = module.readme_template.rendered
  commit_message      = "feat: adding readme"
  commit_author       = var.commit_author
  commit_email        = var.commit_email
  overwrite_on_create = true
}

resource "github_repository_file" "license" {
  repository          = module.repository.repository_name
  branch              = module.repository.default_branch_name
  file                = "LICENSE.md"
  content             = module.license_template.rendered
  commit_message      = "feat: adding license"
  commit_author       = var.commit_author
  commit_email        = var.commit_email
  overwrite_on_create = true
}

resource "github_repository_file" "gitignore" {
  repository          = module.repository.repository_name
  branch              = module.repository.default_branch_name
  file                = ".gitignore"
  content             = data.http.gitignore_template.response_body
  commit_message      = "feat: adding gitignore"
  commit_author       = var.commit_author
  commit_email        = var.commit_email
  overwrite_on_create = true
}

data "http" "gitignore_template" {
  url = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/gitignore/.gitignore_terraform"
}



module "license_template" {
  source       = "github.com/codingones-terraform-modules/terraform-remote-template-renderer"
  template_url = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/license/LICENSE_MIT.md"
  template_variables = {
    OWNER = "CodingOnes"
  }
}

module "readme_template" {
  source       = "github.com/codingones-terraform-modules/terraform-remote-template-renderer"
  template_url = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/readme/README_SERVICE_INFRASTRUCTURE_REPOSITORY.md"
  template_variables = {
    SERVICE      = var.service
    REPOSITORY   = var.github_repository
    ORGANIZATION = var.github_organization
  }
}