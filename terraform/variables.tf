variable "number_of_subnets" {
  type        = number
  description = "this defines the number of subnets"
  default     = 2
  validation {
    condition     = var.number_of_subnets < 5
    error_message = "The subnets must be less than 5."
  }
}

variable "number_of_machines" {
  type        = number
  description = "this defines the number of machines"
  default     = 2
}

variable "resource_groups" {
  description = "Map ofe settings for creating resource groups."
  type = map(object({
    bounded_context = string
    location        = string
    iterator        = optional(string, "001")
    tags            = optional(map(any), {})
  }))
}

variable "bounded_context" {
  type = map(string)
}

variable "domain" {
  description = "The name of the domain for these workloads."
  type        = string
}

variable "environment" {
  description = "Name of the deployment promotion environment"
  type        = string

  validation {
    condition     = var.environment == "dev" || var.environment == "qa" || var.environment == "uat" || var.environment == "prod" || var.environment == "dr"
    error_message = "Environment must be dev, qa, uat, dr, or prod."
  }
}

variable "location" {
  description = "The Azure region that will be the primary location for resource creation."
  type        = string
  default     = "eastus"
}

variable "iterator" {
  type    = string
  default = ""
}

