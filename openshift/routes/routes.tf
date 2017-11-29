provider "aws" {
  region = "us-east-1"
}

data "aws_route53_zone" "liatrio" {
  name = "liatr.io"
}

resource "aws_route53_record" "jenkins" {
  zone_id = "${data.aws_route53_zone.liatrio.zone_id}"
  name    = "jenkins.petclinic.liatr.io"
  type    = "A"

  alias {
    name                   = "master.os-sandbox.liatr.io"
    zone_id                = "${data.aws_route53_zone.liatrio.zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "nexus" {
  zone_id = "${data.aws_route53_zone.liatrio.zone_id}"
  name    = "nexus.petclinic.liatr.io"
  type    = "A"

  alias {
    name                   = "master.os-sandbox.liatr.io"
    zone_id                = "${data.aws_route53_zone.liatrio.zone_id}"
    evaluate_target_health = false
  }
}

