variable "region" {
  description = "Region that the instances will be created"
}

/*====
environment specific variables
======*/

variable "staging_database_name" {
  description = "The database name for staging"
}

variable "staging_database_username" {
  description = "The username for the staging database"
}

variable "staging_database_password" {
  description = "The user password for the staging database"
}

variable "staging_app_database_username" {
  description = "The username for the staging database"
}

variable "staging_app_database_password" {
  description = "The user password for the staging database"
}
