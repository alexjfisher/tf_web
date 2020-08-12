variable "region" {
  type = string
}
variable "ami" {
  type = map(string)
  default = {
    "us-east-1" = "ami-f652979b"
    "us-west-1" = "ami-7c4b331c"
    "eu-west-1" = "ami-0ae77879"
  }
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "key_name" {
  type    = string
  default = "alex"
}
variable "environment" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "public_subnet_ids" {
  type = list(string)
}
variable "private_subnet_ids" {
  type = list(string)
}
variable "domain" {
  type = string
}
variable "web_instance_count" {
  type = number
}
variable "app_instance_count" {
  type = number
}

output "web_elb_address" {
  value = aws_elb.web.dns_name
}

output "web_host_addresses" {
  value = aws_instance.web[*].private_ip
}

output "app_host_addresses" {
  value = aws_instance.app[*].private_ip
}
