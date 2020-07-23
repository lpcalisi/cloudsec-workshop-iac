variable "myvar" {
  type    = string
  default = "example"
}

variable "mymap" {
  type = map
  default = {
    "key1" : "value1",
    "key2" : "value"
  }
}

variable "mylist" {
  type    = list
  default = [1, 2, 3]
}

variable "complexvar" {
  default = {
    "key1" : {
      "subkey1" : "subvalue1",
      "subkey2" : "subvalue"
    },
    "key2" : "value"
  }
}

variable "secret" {}
