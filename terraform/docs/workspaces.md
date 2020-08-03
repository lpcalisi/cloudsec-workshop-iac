# Workspaces

Terraform Workspaces allow us to create different environments from the same configuration files, creating a different state for each one.

  Some use cases could be:

  * Multiple deploy environments such as Production, Staging, etc
  * Many instances for the same configuration in many differents entities. ie: many AWS Accounts or many regions in the same account


#### How could we manage workspaces?

When you run `terraform init`, by default it creates a workspace named `default`

  *Create new workspace*
  ```console
  foo@bar:~$ terraform workspace new prod
  Created and switched to workspace "prod"!

  You're now on a new, empty workspace. Workspaces isolate their state,
  so if you run "terraform plan" Terraform will not see any existing state
  for this configuration.
  ```

  *List workspaces*
  ````console
  foo@bar:~$ terraform workspace list
  default
  prod
  ````

  *Select workspace*
  ````console
  foo@bar:~$ terraform workspace select prod
  Switched to workspace "prod".
  ````

#### How does terraform manage states with workspaces?
When you create new workspace and make a deploy on it, by default terraform reorganizes the states in a new path named `terraform.tfstate.d/{workspace}/terraform.tfstate`. This approuch is for local states.

For remote states, not all backends types support multiple workspaces. To view all the supported backends &rarr; <a href="https://www.terraform.io/docs/state/workspaces.html"> Terraform Workspace </a>
