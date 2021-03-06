# Remote State

#### Set an S3 bucket as the remote backend to store the terraform state

---
#### 1. *Create an S3 bucket*

```bash
aws s3api create-bucket --bucket pelu-workshop-example-$RANDOM --region us-east-1
```

<image src="./images/create_bucket.gif">

#### 2. *Set the bucket name in `backend.tf`*
<image src="./images/set_backend.gif">


#### 3. *Run `terraform init` to initialize the backend.*

```bash
terraform init
```

<image src="./images/tf_init.png">
