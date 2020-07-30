# First Steps: Working with Terraform Workspaces <a href="https://www.terraform.io/docs/state/workspaces.html">(doc) </a>.

Workspaces allow us to switch beetween different instances of a single terraform configuration. They are very convenient to have the same configuration for different environments.
For example, a common use for multiple workspaces is to create a parallel, distinct copy of a set of infrastructure in order to test a set of changes before modifying the main production infrastructure. You have to be careful with unique ids (such as bucket names) because they might be repeated if you deploy the same stack in two different workspaces. A common way around this is to add a prefix with the workspace name using the variable `${terraform.workspace}`

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

#### 1. *Set the bucket name in `backend.tf`*
<image src="./images/set_backend.gif">

#### 2. *Create a new workspace using `terraform workspace new example`*
<image src="./images/create_workspace.png">

#### 3. *Run `terraform init` to initialize the backend.*
<image src="./images/tf_init.png">
  
#### 4. *After init, terraform creates the terraform.tfstate file in the S3 bucket.*
<image src="./images/list_backend.gif">

