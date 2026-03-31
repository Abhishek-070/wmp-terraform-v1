resource "aws_instance" "frontend" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids= ["sg-0a4cc58f87a256401"]

  tags = {
    Name = "frontend"
  }
}

resource "aws_instance" "postgresql" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids= ["sg-0a4cc58f87a256401"]

  tags = {
    Name = "postgresql"
  }
}

resource "aws_instance" "auth-service" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids= ["sg-0a4cc58f87a256401"]

  tags = {
    Name = "auth-service"
  }
}

resource "aws_instance" "portfolio-service" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids= ["sg-0a4cc58f87a256401"]

  tags = {
    Name = "portfolio-service"
  }
}

resource "aws_instance" "analytics-service" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids= ["sg-0a4cc58f87a256401"]

  tags = {
    Name = "analytics-service"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z04759742TOEKPTLQKQGL"
  name    = "frontend-dev"
  type    = "A"
  ttl     = "30"
  records = [ aws_instance.frontend.private_ip]
}

resource "aws_route53_record" "postgresql" {
  zone_id = "Z04759742TOEKPTLQKQGL"
  name    = "postgresql-dev"
  type    = "A"
  ttl     = "30"
  records = [ aws_instance.postgresql.private_ip]
}

resource "aws_route53_record" "auth-service" {
  zone_id = "Z04759742TOEKPTLQKQGL"
  name    = "auth-service-dev"
  type    = "A"
  ttl     = "30"
  records = [ aws_instance.auth-service.private_ip]
}

resource "aws_route53_record" "portfolio-service" {
  zone_id = "Z04759742TOEKPTLQKQGL"
  name    = "portfolio-service-dev"
  type    = "A"
  ttl     = "30"
  records = [ aws_instance.portfolio-service.private_ip]
}

resource "aws_route53_record" "analytics-service" {
  zone_id = "Z04759742TOEKPTLQKQGL"
  name    = "analytics-service-dev"
  type    = "A"
  ttl     = "30"
  records = [ aws_instance.analytics-service.private_ip]
}