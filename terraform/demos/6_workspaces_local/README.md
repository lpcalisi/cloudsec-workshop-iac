# First Steps: Working with Terraform Workspaces <a href="https://www.terraform.io/docs/state/workspaces.html">(doc) </a>.

Workspaces allow us to switch beetween different instances of a single terraform configuration. They are very convenient to have the same configuration for different environments.
For example, a common use case for multiple workspaces is to create a parallel, distinct copy of your infrastructure in order to test some changes before modifying the production infrastructure. You have to be careful with unique ids (such as bucket names) because they might be repeated if you deploy two workspaces in the same AWS environment. A common way around this is to add a prefix with the workspace name using the variable `${terraform.workspace}`

#### Terraform Command Workspaces
```console
#Listing all your workspaces
foo@bar:~$ terraform workspaces list

#Showing current workspace
foo@bar:~$ terraform workspace show

#Creating new workspace
foo@bar:~$ terraform workspace new ${WORKSPACE_NAME}

#Switching to the new workspace
foo@bar:~$ terraform workspace select ${WORKSPACE_NAME}
```

---

#### 1. *Run `terraform init` to initialize the backend.*

#### 2. *Create a new workspace using `terraform workspace new dev`*

#### 3. *Create a new workspace using `terraform workspace new staging`*
  
#### 4. *Switch to the `dev` workspace and apply the configuration*
```bash
terraform workspace select dev && terraform apply
```

#### 5. *Check the terraform state to view the details of the instance created*
```bash
terraform state show aws_instance.test
```

#### 5. *Switch to the `staging` workspace and list the terraform state*
```bash
terraform workspace select staging && terraform state list
```

The instance should not be present, because we only created it in the `dev` workspace!
If you want you can run `terraform apply` to have a new independent instance created for the `staging` workspace.
