# Create EC2 based on module

# ec2 demo ubuntu with public ip in public subnet
module "demo_ubuntu_public_ip_enabled" {
  source = "../../modules/ec2-apse1/ec2-ubuntu"
  count  = 1

  associate_public_ip = true
  vpc_security_group  = data.terraform_remote_state.vpc_ap_southeast_1.outputs.sec_group_demo_public_apse1_0
  vpc_subnet          = data.terraform_remote_state.vpc_ap_southeast_1.outputs.subnet_public_apse1_0

  ec2_tags = {
    Name = "demo-ubuntu-public-${count.index}"
  }
}

# ec2 demo ubuntu without public ip in public subnet
module "demo_ubuntu_public_ip_disabled" {
  source = "../../modules/ec2-apse1/ec2-ubuntu"
  count  = 1

  associate_public_ip = false
  vpc_security_group  = data.terraform_remote_state.vpc_ap_southeast_1.outputs.sec_group_demo_public_apse1_0
  vpc_subnet          = data.terraform_remote_state.vpc_ap_southeast_1.outputs.subnet_public_apse1_0

  ec2_tags = {
    Name = "demo-ubuntu-public-${count.index}"
  }
}

# ec2 demo ubuntu-arm with public ip in public subnet
module "demo_ubuntu_arm_public_ip_enabled" {
  source = "../../modules/ec2-apse1/ec2-ubuntu-arm"
  count  = 1

  associate_public_ip = true
  vpc_security_group  = data.terraform_remote_state.vpc_ap_southeast_1.outputs.sec_group_demo_public_apse1_0
  vpc_subnet          = data.terraform_remote_state.vpc_ap_southeast_1.outputs.subnet_public_apse1_0

  ec2_tags = {
    Name = "demo-ubuntu-arm-${count.index}"
  }
}

# ec2 demo amazon linux 2 with public ip in public subnet
module "demo_amazon_linux_2_public_ip_enabled" {
  source = "../../modules/ec2-apse1/ec2-amazon-linux-2"
  count  = 1

  associate_public_ip = true
  vpc_security_group  = data.terraform_remote_state.vpc_ap_southeast_1.outputs.sec_group_demo_public_apse1_0
  vpc_subnet          = data.terraform_remote_state.vpc_ap_southeast_1.outputs.subnet_public_apse1_0

  ec2_tags = {
    Name = "demo-amazon-linux-2-${count.index}"
  }
}
