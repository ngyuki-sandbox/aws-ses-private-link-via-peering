################################################################################
# VPC Endpoint

resource aws_vpc_endpoint ssm {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  subnet_ids = [
    aws_subnet.back_a.id,
  ]

  security_group_ids = [
    aws_security_group.sg.id,
  ]

  tags = {
    Name = "${var.tag_prefix}-ssm"
  }
}

resource aws_vpc_endpoint ssmmessages {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.ssmmessages"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  subnet_ids = [
    aws_subnet.back_a.id,
  ]

  security_group_ids = [
    aws_security_group.sg.id,
  ]

  tags = {
    Name = "${var.tag_prefix}-ssmmessages"
  }
}

resource aws_vpc_endpoint smtp {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.email-smtp"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  subnet_ids = [
    aws_subnet.back_a.id,
  ]

  security_group_ids = [
    aws_security_group.sg.id,
  ]

  tags = {
    Name = "${var.tag_prefix}-smtp"
  }
}

output vpc_endpoint_smtp_dns_name {
  value = aws_vpc_endpoint.smtp.dns_entry[0].dns_name
}
