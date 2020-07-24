# Providers
#### Terraform supports a lot of providers and it is generally IaaS, PaaS or SaaS. It's used to create and manage resources.

ie:
```hcl
provider "grafana" {
  url  = "http://grafana.example.com/"
  auth = "1234abcd"
}
```

#### On the other hand, we could write our own custom providers in `golang` for example to manage our own private cloud.

<br>
Guide for write custom providers &rarr; <a href="https://www.terraform.io/docs/extend/writing-custom-providers.html"> Terraform Write Custom Providers </a>

For view all of avaiables providers &rarr; <a href="https://www.terraform.io/docs/providers/index.html"> Terraform Providers </a>
