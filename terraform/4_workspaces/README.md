# First Steps: Working with Terraform Workspaces <a href="https://www.terraform.io/docs/state/workspaces.html">(doc) </a>.

Permit switch beetween differents instances of a single terraform configuration. They are very convenient but cannot resolve all problems.
For example, A common use for multiple workspaces is to create a parallel, distinct copy of a set of infrastructure in order to test a set of changes before modifying the main production infrastructure. In order to be successfull on it, you need to add prefix or dynamic names on your resources.

#### Terraform Command Workspaces
```
#Listing all your workspaces
terraform workspaces list

#Showing actual workspace
terraform workspace show

#Creating new workspace
terraform workspace new ${WORKSPACE_NAME}

#Switching another workspace
terraform workspace select ${WORKSPACE_NAME}
```

### How terraform save states for many workspaces?
Terraform 
#### Local States
Terraform creates the folder named terraform.tfstate.d and one folder by workspace inside of it.
```

  terraform.tfstate.d/${WORKSPACE_NAME}/terraform.tfstate
```

#### Remote States
For example, in a S3 bucket, Terraform creates the folder named :env and one folder by workspace inside of it. Finally, terraform saves the status on the s3 key defined.
```
  ${S3_BUCKET_NAME}/:env/${WORKSPACE_NAME}/${KEY}
```
