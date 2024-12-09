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
