# Infrastructure as code - Workshop

## Table of Contents
1. [IAC Concepts](#what-is-iac)
2. [IAC Benefits](#why-should-we-use-iac)
3. [Infrastructure Provisioning vs Software Provisioning](#difference-beetween-provisioning-and-configuration-management-tools)
4. [Tools](#tools)
5. [Start Workshop](#start-workshop)

### What is IAC?
Nowadays, most companies create their infrastructure resources manually, this could carry problems when you want to replicate or modify it, having the possibility to introduce errors or not knowing exactly wich resources are part of it.
Infrastructure as code allows us to define all resources and configurations in an automated, versioned and controlled way

### Why should we use IAC?
   * It is auditable, easy to visualize its resources based on code definition.
   * It is versioned, being a code, we can upload it to github and keep our control versions.
   * It is replicable, easy to replicate in other environments.
   * It is updated, we can ask for the current status of our resources in order to validate if its have been modified.
   * It decreases human error, even though we can introduce bugs through the code, before applying the changes we will see which infrastructure components and properties will be modified.


### Difference beetween Provisioning and Configuration Management tools:
The provisioning tools let us create automated infraestructure through the interaction with different providers (AWS, GCP, AZURE, etc). For Example, we can create an EC2 instance, a S3 bucket or a Route53 DNS zone.
Instead the Configuration Management tools are the ones which configure and provision software inside the servers. For instance, the web server installation and configuration.

#### **Tools:**
   * Provisioning:
        + Terraform
        + Cloudformation
        + Deploy Manager
   * Configuration Management:
        + Ansible
        + Puppet
        + Cheff 
        + Saltstack
   * Building Custom Images
        + Packer

<image src="./tools.png"/>


In example, we could create an EC2 instance with Terraform and then, once it is created, you should configure it by ansible playbook.
Other way of software provisioning could be the creation of an image with all needed configurations and software using Packer + Provisioner (ansible, etc) and  then to make an EC2 instance deployment with Terraform using this image.

In this workshop, we are going to talk about 3 different types of provisioning.
  * Infrastructure Provisioning (ie: Terraform)
  * Infrastructure Provisioning + Configuration Management (ie: Terraform + Ansible)
  * Build Custom Image + Infrastructure Provisioning (ie: Packer + Terraform).

<br/>

### Start Workshop
* <a href="./terraform">Terraform</a>
* <a href="./packer">Packer</a>

