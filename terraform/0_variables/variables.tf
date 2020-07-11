variable "myvar" {
	type = string
	default = "HOLA"
}

variable "mymap" {
	type = map
	default = {
		"key1": "value1",
		"key2": "value"
	}
}

variable "mylist" {
	type = list
	default = [1,2,3]
}

variable "SECRET" {}