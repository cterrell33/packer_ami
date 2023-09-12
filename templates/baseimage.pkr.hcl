variables {
  source_ami      = null
  vpc_id          = null
  subnet_id       = null
  boundary        = null
  instanceprofile = null
  security_group  = null
}

source "amazon-ebs" "firstbuild" {
  ami_name             = "my_custom_id"
  instance_type        = "t2.medium"
  region               = "us-east-1"
  source_ami           = var.source_ami
  ssh_username         = "ec2-user"
  communicator         = "ssh"
  iam_instance_profile = var.instanceprofile
  vpc_id               = var.vpc_id
  subnet_id            = var.subnet_id
  security_group_id    = var.security_group
  run_tags = {
    Name : "my_custom_id"
  }
  force_deregister      = true
  force_delete_snapshot = true
  encrypt_boot          = false
  aws_polling {
    delay_seconds = 40
    max_attempts  = 3000
  }
}

build {
  sources = ["source.amazon-ebs.firstbuild"]
  post-processor "manifest" {
    output     = "manifest.json"
    strip_path = true
    strip_time = true
  }
  post-processor "shell-local" {
    scripts = ["scripts/ami-param.sh"]
  }
  provisioner "shell" {
    scripts         = ["scripts/install-software.sh"]
    execute_command = "{{.Vars}} bash '{{.Path}}'"
  }
}