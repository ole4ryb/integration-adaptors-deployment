data "aws_ami" "base_linux" {
  most_recent      = true
  name_regex       = "^al2023-ami-2023*"
  owners           = ["137112412989"]

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
      name = "image-type"
      values = ["machine"]
  }

  filter {
      name = "is-public"
      values = ["true"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
