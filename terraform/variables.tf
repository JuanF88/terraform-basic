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