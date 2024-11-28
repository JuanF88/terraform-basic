<<<<<<< HEAD
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
=======
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
>>>>>>> d618bd4f32e312ca2676901947554ca89dda2dfc
}