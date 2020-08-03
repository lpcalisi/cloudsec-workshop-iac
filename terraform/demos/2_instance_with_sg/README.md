# First Steps: Create AWS Instance with security group and inbound rules
#### Instance with public IP and allow inbound traffic (22) from your home

```console
#First create ssh keypair
foo@bar:~$ ssh-keygen -b 2048 -t rsa -f $(pwd)/ssh/key_workshop

#download and init provider plugins
foo@bar:~$ terraform init

#deploy provisioning my own public ip
foo@bar:~$ terraform apply -var "MY_PUBLIC_IP_ADDRESS=$(curl ifconfig.me)/32"

#get public ip assigned to instance
foo@bar:~$ terraform output
``` 

#### After applied, you should see the next output. 
<image src="./images/applied.png">
  

### Its everything works ok, only your home public ip adress should be get access to the instance.

#### Try it!

<image src="./images/ssh.gif">
