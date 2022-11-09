data "aws_vpc" "this" {
  default = true
}


data "aws_subnet_ids" "subnet" {
  vpc_id = data.aws_vpc.this.id
}
