# Project Structure

We think about there is not a one ways to structure Terraform projects, but we could try to give you sane practices since our experience working with big terraforms projects.

* Separate your development and production environments.
  * It is better if you working in two environments completily independents, this will give you warranties about your configurations are totally independents, e.g: using two distincts AWS Accounts
* Use modules, in order to group resources either by purpose or by type. It makes the code more readable and easier to locate the resources and their relations.
* If you have medium to large scale projects, it might be better to split them into sub projects. This will allow you to reduce the amount of resources that you need to manage when using `terraform apply`.


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
