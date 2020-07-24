# First Steps: Working with Terraform Workspaces <a href="https://www.terraform.io/docs/state/workspaces.html">(doc) </a>.

Permit switch beetween differents instances of a single terraform configuration. They are very convenient but cannot resolve all problems.
For example, A common use for multiple workspaces is to create a parallel, distinct copy of a set of infrastructure in order to test a set of changes before modifying the main production infrastructure. In order to be successfull on it, you need to add prefix or dynamic names on your resources.

#### Terraform Command Workspaces
```console
#Listing all your workspaces
foo@bar:~$ terraform workspaces list

#Showing actual workspace
foo@bar:~$ terraform workspace show

#Creating new workspace
foo@bar:~$ terraform workspace new ${WORKSPACE_NAME}

#Switching another workspace
foo@bar:~$ terraform workspace select ${WORKSPACE_NAME}
```

---

#### 1. *Set bucket name in `backend.tf`*
<image src="./images/set_backend.gif">

#### 2. *Create new workspace using `terraform workspace new example`*
<image src="./images/create_workspace.png">

#### 3. *Run `terraform init` to inicilizate the backend.*
<image src="./images/tf_init.png">
  
#### 4. *After init, terraform creates terraform.tfstate in S3 bucket.*
<image src="./images/list_backend.gif">

