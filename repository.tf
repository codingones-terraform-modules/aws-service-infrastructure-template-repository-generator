module "repository" {
  source = "github.com/codingones-terraform-modules/github-repository"

  github_organization                  = "codingones-github-templates"
  github_repository                    = var.github_repository
  github_repository_topics             = ["terraform", "github", "aws"]
  github_repository_description        = "This is a github template repository for an aws service infrastructure"
  allow_force_pushes_to_default_branch = var.allow_force_pushes_to_default_branch

  providers = {
    github = github
  }
}

