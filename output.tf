output "web_instance_ip" {
  value = ["${aws_instance.this.*.public_ip}"]
}

output "lb_dns" {
  value = aws_lb.this.dns_name
}
