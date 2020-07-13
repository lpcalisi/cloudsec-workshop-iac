# First Steps: Create AWS Instance with security group and inbound rules
#### Instance with public IP and allow inbound traffic (22, 80) from my home

```
#First create ssh keypair
ssh-keygen -b 2048 -t rsa -f $(pwd)/ssh/key_workshop

#download and init provider plugins
terraform init

#deploy provisioning my own public ip
terraform apply -var "MY_PUBLIC_IP_ADDRESS=$(curl ifconfig.me)/32"

#get public ip assigned to instance
terraform output
``` 
