# retrouver le vpc via le tag
data "aws_vpc" "myvpc" {
  tags = {
    Name = "Demo"  
  }
}

# prendre les zone de disponibilité
data "aws_availability_zones" "available" {
  state = "available"
}

# creer la gateway internet et la lier au vpc
resource "aws_internet_gateway" "my_igw" {
  vpc_id = data.aws_vpc.myvpc.id
  tags = {
    Name = "Demo"  
  }
}

# Subnet publique
resource "aws_subnet" "public" {
  count             = var.count
  cidr_block        = element(["10.0.2.0/24", "10.0.3.0/24"], count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  vpc_id            = data.aws_vpc.myvpc.id
  tags = {
    Name = "public-subnet-${count.index}"
  }
}
# Subnet privée
resource "aws_subnet" "private" {
  count             = var.count
  cidr_block        = element(["10.0.0.0/24", "10.0.1.0/24"], count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  vpc_id            = data.aws_vpc.myvpc.id
  tags = {
    Name = "private-subnet-${count.index}"
  }
}

# Creer la route table publique 
resource "aws_route_table" "public_rt" {
  vpc_id = data.aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "public-rt"
  }
}
# creer la route table privée
resource "aws_route_table" "private_rt" {
  vpc_id = data.aws_vpc.myvpc.id

  tags = {
    Name = "private-rt"
  }
}

# associer la route table publique au subnet publique
resource "aws_route_table_association" "public_subnet_association" {
  count          = var.count
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

# associer la route table privée au subnet privée
resource "aws_route_table_association" "private_subnet_association" {
  count          = var.count
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_rt.id
}