# Project Structure

We think about there is not a one ways to structure Terraform projects, but we could try to give you good practices since our experience working with big terraforms projects.

* Separate your development and production environments.
  * Is better if you working in two environments completily independents, this will give you warranties about your configurations are totally independents, e.g: using two distincts AWS Accounts
* Use modules, in order to group resources by purpose or type. This will make it easier for you locate the resources and relate them.
* If you have medium to large scale projects, it might be better split them into sub projects will also reduce resources that you'll need to manage on `terraform apply`.
