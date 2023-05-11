# Service Infrastructure template repository

## About

A module that provide a service repository template for infrastructure template repositories

## TOC

- 🪧 [About](#about)
- 🛠️ [Usage](#usage)
- 🤝 [Contribution](#contribution)
- 🏗️ [Built With](#built-with)
- 📝 [License](#license)


## Usage

Example usage.

```terraform
module "aws_service_vpc_template" {
  source = "github.com/codingones-terraform-modules/aws-service-infrastructure-repository-generator"

  service = "vpc"
  github_organization = "codingones-github-templates"
  github_repository = "aws-service-vpc"

  files = {
    workflow_apply = {
      path            = ".github/workflows/apply.terraform.yml"
      url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/apply-terraform-aws-service-infrastructure.yml"
      template_variables = {
        SERVICE = "vpc-infrastructure"
      }
    }
    workflow_sync = {
      path            = "github-actions/sync-with-upstream.yml"
      url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/apply-terraform-aws-service-infrastructure.yml"
      template_variables = {
        UPSTREAM = "codingones-github-templates/aws-service-vpc"
      }
    }
    vpc = {
      path            = "vpc.tf"
      url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/main/terraform/service/vpc/vpc.tf"
    },
    outputs = {
      path            = "outputs.tf"
      url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/vpc/outputs.tf"
    }
  }

  providers = {
    github = github
  }
}
```

## Contribution

This repository is not open to external contribution yet.
I you'd like to please send me an email.

## Built With

### Languages & Frameworks

- [Terraform](https://www.terraform.io/) is an open-source infrastructure-as-code tool that enables provisioning, management, and versioning of cloud, on-premises, and third-party resources using declarative configuration files.

## License

See the [LICENSE.md](./LICENSE.md) of the repository.
