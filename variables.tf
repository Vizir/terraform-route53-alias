variable "alias_target" {}

variable "alias_evaluate_target_health" {}

variable "alias_zone_id" {
  default = ""
}

variable "aws_region" {}

variable "count" {
  default     = 1
  description = "Way to workaround the lack of support in Terraform for count in modules. It should be 0 or 1"
}

variable "record_name" {}

variable "zone_id" {}
