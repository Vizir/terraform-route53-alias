variable "hosted_zone_ids" {
  default = {
    "ap-northeast-1" = "Z1R25G3KIG2GBW"
    "ap-northeast-2" = "Z3JE5OI70TWKCP"
    "ap-south-1"     = "Z18NTBI3Y7N9TZ"
    "ap-southeast-1" = "Z16FZ9L249IFLT"
    "ap-southeast-2" = "Z2PCDNR3VC2G1N"
    "eu-central-1"   = "Z1FRNW7UH4DEZJ"
    "eu-west-1"      = "Z2NYPWQ7DFZAZH"
    "sa-east-1"      = "Z10X7K2B4QSOFV"
    "us-east-1"      = "Z117KPS5GTRQ2G"
    "us-west-1"      = "Z1LQECGX5PH1X"
    "us-west-2"      = "Z38NKT9BP95V3O"
  }
}

resource "aws_route53_record" "www" {
  count   = "${var.count}"
  name    = "${var.record_name}"
  type    = "A"
  zone_id = "${var.zone_id}"

  alias {
    evaluate_target_health = "${var.alias_evaluate_target_health}"
    name                   = "${var.alias_target}"
    zone_id                = "${var.alias_zone_id != "" ? var.alias_zone_id : lookup(var.hosted_zone_ids, var.aws_region)}"
  }
}
