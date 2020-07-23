# Variables
### Types:
The `type` argument in a variable block allows you to restrict the type of value that will be accepted as the value for a variable.
* string
* number
* bool

<br>

### Constructors
Allow specify more complex types such as collections

* list
* set
* map


#### Examples:
```hcl
# simple variable
variable "mystring" {
  type    = string
  default = "example1"
}

# map variable
variable "mymap" {
  type = map(string)
  default = {
    "key1" : "value1"
    "key2" : "value2"
  }
}

# complex var without type
variable "complex" {
  default = {
    "type1" : {
      "subkey1" : "subvalue1",
      "subkey2" : "subvalue1"
    },
    "type2" : "value2"
  }
}
``` 

### Other assign variables ways
Anyway, we need to define the vars empty into root module like
```hcl
  variable "variableName" {}
```
#### On the command line
Can be specified on `terraform plan` or `terraform apply`
```console
foo$bar:~$ terraform apply -var="image_id=ami-abc123"
foo$bar:~$ terraform apply -var='image_id_list=["ami-abc123","ami-def456"]'
foo$bar:~$ terraform apply -var='image_id_map={"us-east-1":"ami-abc123","us-east-2":"ami-def456"}'
```

#### Variable Files
We could define some files ending in either `.tfvars` or `.tfvars.json` to set predefined empty vars. It's very usefull for git ignore.
This example file `terraform.tfvars` will set `secret` predefined empty variable. If you want to use another var file name, you could specify it with flag `-var-file=filepath` 

###### .tfvars
```hcl
secret="THIS IS MY SECRET"
```

###### .tfvars.json
```json
{
  "tags": {
    "team": "cloudsec",
    "project": "workshop"
  }
}
```

#### Environment Variables
Terraform could get all enviroments variables that named `TF_VAR` followed the name of the declared variable
```console
foo$bar:~$ export TF_VAR_secret="THIS IS MY SECRET"
```

<br>
For more docs ->
<a href="https://www.terraform.io/docs/configuration/variables.html">Terraform Variables Documentation</a>
