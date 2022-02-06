# tfaction-getting-started

Getting Started with tfaction.

In this getting started, you create a repository from the template repository and
set up tfaction and manage GitHub Issue Label with Terraform.

You would know how to set up tfaction and how tfaction works.

## Steps

Set up.

1. [Create a repository from this template repository](https://github.com/suzuki-shunsuke/tfaction-getting-started/generate)
1. Create required resources with Terraform
1. Create Personal Access Token
1. Fix the template

Let's tfaction.

1. Scaffold a working directory
1. Create a pull request

## Create required resources with Terraform

Create the following resources.

* IAM OpenID Connect provider
* S3 Buckets
* IAM Roles

```console
$ cd aws/github-terraform-ci
$ vi main.tf # Change local values
$ terraform init
$ terraform plan
$ terraform apply
```

After this getting started, clean up resources.

```console
$ terraform destroy
```

## Create Personal Access Token

We recommend using GitHub App instead of Personal Access Token, but in this getting started let's use a personal access token.
Create a Personal Access Token and set it as GitHub Actions Secret.

https://github.com/settings/tokens/new

Secret Name: `GH_PERSONAL_ACCESS_TOKEN`

https://docs.github.com/en/actions/security-guides/encrypted-secrets

Required permission: https://suzuki-shunsuke.github.io/tfaction/docs/config/github-token

## Fix the template and tfaction-root.yaml

```console
$ vi tfaction-root.yaml
$ vi templates/github/main.tf
$ git add tfaction-root.yaml templates/github
$ git checkout -b update-template
$ git commit -m "update template"
$ git push origin update-template
$ gh pr create -t "update template" -b "update template"
```

Please merge the pull request.

## Scaffold a working directory

Please run GitHub Actions Workflow `scaffold-working-directory`.

```console
$ gh workflow run scaffold-working-directory.yaml -f target=github/foo
```

Then a pull request would be created.
Please merge the pull request.

## Create a pull request

The working directory `github/foo` was created.
Let's add an issue request label with Terraform.

```console
$ git fetch origin main
$ git checkout -b add-issue-label origin/main
$ vi github/foo/label.tf
```

label.tf

```tf
resource "github_issue_label" "bar" {
  repository  = "tfaction-getting-started" # CHANGE
  name        = "bar"
  color       = "FF0000"
  description = "bar"
}
```

```console
$ git add github/foo/label.tf
$ git commit -m "add an issue label"
$ git push origin add-issue-label
$ gh pr create -t "add an issue label" -b "add an issue label"
```

Please confirm the result of `terraform plan` and merge the pull request.
Then `terraform apply` would be run in the main branch.

## LICENSE

[MIT](LICENSE)
