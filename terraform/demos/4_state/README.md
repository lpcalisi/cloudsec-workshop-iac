# State

In this demo we will create an S3 bucket using Terraform. Then we will edit the bucket properties manually using the AWS Console. Finally we will use Terraform to detect the drift in the configuration and fix it.

---
#### 1. *Create an S3 bucket using terraform*

```bash
terraform init && terraform apply
```

#### 2. *Show the state of the bucket in the terraform state, and get its ID*
```bash
terraform state show aws_s3_bucket.bucket
```

#### 3. *Change the bucket tag manually*
<image src="./images/change_tag.png">


#### 4. *Run `terraform apply` to detect the configuration drift and fix it.*

```bash
terraform apply
```

You should see that terraform detected the change and that will change the tag configuration to match the desired state.
