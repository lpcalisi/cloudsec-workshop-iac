terraform {
  backend "s3" {
    bucket = "workshop-terraform-cloudsec-states"
    key    = "workspaces/workshop_status.tf"
    region = "us-east-1"
  }
}

