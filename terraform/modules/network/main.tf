resource "aws_security_group" "web" {
  name        = "${var.name}-web-sg"
  description = "Allow inbound SSH and HTTP for the web server"
  vpc_id      = var.vpc_id

  # SSH access is gated by var.allowed_ssh_cidr. Lock this to your own IP
  # (x.x.x.x/32) for real deployments; the open default is for demo convenience.
  #tfsec:ignore:aws-ec2-no-public-ingress-sgr
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  # A public web server must be reachable from the internet on port 80.
  #tfsec:ignore:aws-ec2-no-public-ingress-sgr
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.allowed_http_cidr]
  }

  # Outbound access is required for package installation (apt update / nginx).
  #tfsec:ignore:aws-ec2-no-public-egress-sgr
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-web-sg"
  }
}
