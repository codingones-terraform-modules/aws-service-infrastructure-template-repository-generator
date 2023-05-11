module "files_templates" {
  for_each = var.files

  source             = "github.com/codingones-terraform-modules/terraform-remote-template-renderer"
  template_url       = each.value.url_of_template
  template_variables = each.value.template_variables
}

locals {
  contentMap = { for k, v in module.files_templates : var.files[k].path => v.rendered }
}

resource "github_repository_file" "files" {
  for_each = local.contentMap

  repository          = github_repository.repository.name
  branch              = github_branch_default.main.branch
  file                = each.key
  content             = each.value
  commit_message      = "feat: adding service template file"
  commit_author       = var.commit_author
  commit_email        = var.commit_email
  overwrite_on_create = true
}