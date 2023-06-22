variable "detection_lab" {
  description = <<EOD
  Detection Lab Sanity Test variable
  EOD
  type = map(object({
    enabled     = optional(bool)
    name        = optional(string)
    namespace   = optional(string)
    environment = optional(string)
    stage       = optional(string)
    location    = optional(string)
  }))
}