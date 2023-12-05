terraform {
  backend "s3" {
    bucket = "vaishnavi-b75"
    key    = "misc/jenkins-ip/terraform.tfstate"
    region = "us-east-1"

  }
}

data "aws_instance" "instance" {
  instance_id = "i-0764490aed97ac91a"
}

resource "aws_route53_record" "jenkins" {
  name    = "jenkins.vaishnavidevops.online"
  type    = "A"
  zone_id = "Z0933457MNFW7LZX9MNJ"
  records = [data.aws_instance.instance.public_ip]
  ttl     = 10
}