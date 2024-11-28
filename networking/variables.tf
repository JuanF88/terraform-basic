variable "location" {
  type        = string
  description = "this defines the location"
}

variable "resource_group_name" {
  type        = string
  description = "this defines the resource group name"
}

variable "number_of_subnets" {
  type        = number
  description = "this defines the number of subnets"
  default     = 2
  validation {
    condition     = var.number_of_subnets < 5
    error_message = "The subnets must be less than 5."
  }
}