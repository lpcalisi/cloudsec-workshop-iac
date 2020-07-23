# Remote State

#### Set S3 bucket as remote backend for save and get terraform state

---
#### 1. *Create S3 bucket*

<image src="https://github.com/lpcalisi/cloudsec-workshop-iac/blob/master/terraform/3_remote_state/images/create_bucket.gif">


#### 2. *Set bucket name in `backend.tf`*
<image src="https://github.com/lpcalisi/cloudsec-workshop-iac/blob/master/terraform/3_remote_state/images/set_backend.gif">


#### 3. *Run `terraform init` to inicilizate the backend.
<image src="https://github.com/lpcalisi/cloudsec-workshop-iac/blob/master/terraform/3_remote_state/images/tf_init.png">
