# Project Structure

We think about there is not a one ways to structure Terraform projects, but we could try to give you sane practices since our experience working with big terraforms projects.

* Separate your development and production environments.
  * Is better if you working in two environments completily independents, this will give you warranties about your configurations are totally independents, e.g: using two distincts AWS Accounts
* Use modules, in order to group resources by purpose or type. They make more readable and this will make it easier for you locate the resources and their relations.
* If you have medium to large scale projects, it might be better split them into sub projects will also reduce resources that you'll need to manage on `terraform apply`.


e.g:

```console
foo@bar:~$ tree tf/
tf
├── modules
│   ├── elb
│   │   ├── asg.tf
│   │   ├── config.tf
│   │   └── main.tf
│   └── vpc
│       ├── config.tf
│       ├── main.tf
│       └── subnets.tf
├── prod
│   ├── config.tf
│   └── main.tf
└── staging
    ├── config.tf
    └── main.tf
```
