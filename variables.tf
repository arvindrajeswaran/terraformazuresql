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