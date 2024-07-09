terraform {
  backend "s3" {
    bucket = "terraform-state-personal-adr"
    key    = "kube/terraform.tfstate"
    region = "eu-west-1"
  }
}