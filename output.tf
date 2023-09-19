output "VPC_ID" {
  value = data.aws_vpc.myvpc.id
}


output "public_subnets" {
  value = [for subnet in aws_subnet.public : subnet.id]
}


output "private_subnets" {
  value = [for subnet in aws_subnet.private : subnet.id]
}