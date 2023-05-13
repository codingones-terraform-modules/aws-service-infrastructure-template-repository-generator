module "repository" {
  source = "github.com/codingones-terraform-modules/github-repository"

  github_organization           = "codingones-github-templates"
  github_repository             = var.github_repository
  github_repository_topics      = ["terraform", "github", "aws"]
  allow_push_to_default_branch  = true
  github_repository_description = "This is a github template repository for an aws service infrastructure"

  providers = {
    github = github
  }
}