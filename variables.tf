variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "saname" {
  type = string
}

variable "sqlname" {
  type = string
}

variable "sqlusername" {
  type = string
}

variable "sqlpassword" {
  type = string
  sensitive = true
}

variable "databasename" {
  type = string
}

variable "location2" {
  type = string
}

variable "sqlname2" {
  type = string
}

variable "databasename2" {
  type = string
}

variable "failovername" {
  type = string
}