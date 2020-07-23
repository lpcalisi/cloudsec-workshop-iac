# Workspaces

Terraform Workspaces allow to create us differents environments from the same configuration files and it creates a state for each one.

  Some use cases could be:
  
  * Multiple deploy environments such as Production, Staging, etc
  * Many instances for the same configuration in many differents entity. ie: many AWS Accounts or many regions in the same account
  


* How we could manage workspaces?
When you run `terraform init`, by default creates workspace named `default`

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

