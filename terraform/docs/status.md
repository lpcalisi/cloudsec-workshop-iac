# State

One of the best qualities of terraform is to keep your infrastructure in a certain state. Terraform states is in charge of keeping track of every change made on our terraform resources. State, should represent the actual infrastructure deployed. Changing resources without terraform will be not reflected on the state.
Terraform has two ways to manage states.

#### Local State
 * By default, terraform creates a `terraform.tfstate` file in the root modules's path which holds all the data of your states. Additionally, a second file  `terraform.tfstate.backup` saves the previous state. If you want to define your own terraform state file path, you can do so with the flag `-state=path`
 * Local state is generally used for little / medium sized projects. You could save it in github for version controlling.
 * One disadvantage, it's that we all have to be sure to have the latest version of the state.

#### Remote State
  * Remote states are generally used in large scale projects. Since it always avaiable and updated. Every developer used the same file which can be hosted in a common place.
  * You need to provide the remote storage manually, it's not posible to create it with terraform within the same project.
  * You need to have access to the remote storage such as AWS S3 or GCS (Google Cloud Storage).
 
Usually remote states are defined in the `backend.tf`. If not terraform `terraform {}` is defined the state will be stored locally. 

 ```
 terraform {
  backend "s3" {
    bucket = "workshop-terraform-cloudsec-states"
    key    = "workshop_status.tf"
    region = "us-east-1"
  }
}
 ```
