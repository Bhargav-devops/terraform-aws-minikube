module "minikube" {
  # source = "git::https://github.com/Bhargav-devops/terraform-aws-minikube.git?ref=master"
  source = "git::https://github.com/PramodCodes/terraform-aws-minikube-module?ref=master"
  aws_region    = "us-east-1"
  cluster_name  = "roboshop"
  aws_instance_type = "t3.medium"
  ssh_public_key = "~/bhargav-76s.pub"
  aws_subnet_id = "subnet-093b42bfb66a1297e" #replace your default subnet id
  # by default centos7 will be used
  #ami_image_id = "ami-b81dbfc5"
  #ami_image_id = data.aws_ami.centos8.id
  hosted_zone = "bhargavdevops.online"
  hosted_zone_private = false

  tags = {
    Application = "Minikube"
  }

  addons = [
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/storage-class.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/heapster.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/dashboard.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/external-dns.yaml"
  ]
}

# data "aws_ami" "centos8_minikube"{
#     owners = ["973714476881"]
#     most_recent      = true

#     filter {
#         name   = "name"
#         values = ["Centos-8-DevOps-Practice"]
#     }

#     filter {
#         name   = "root-device-type"
#         values = ["ebs"]
#     }

#     filter {
#         name   = "virtualization-type"
#         values = ["hvm"]
#     }
# }

# output "testing" {
#   value = data.aws_ami.centos8.id
  
# }
