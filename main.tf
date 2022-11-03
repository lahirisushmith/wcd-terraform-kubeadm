provider "aws" {
  region  = "us-east-2"
}
/*terraform {
   backend "s3" {
    bucket = "# Add your S3 bucket here"
    key    = "default.tfstate"
    region = "# Add the S3 bucket region"
  }
}*/

module "kubernetes" {
  source = "./kubernetes"
  vpc_cidr_block = "10.0.0.0/16"
  cluster_name = "basic-cluster"
  master_instance_type = "t2.micro"
  nodes_max_size = 2
  nodes_min_size = 2
  private_subnet01_netnum = "1"
  public_subnet01_netnum = "2"
  region = "us-east-2"
  worker_instance_type = "t2.micro"
  vpc_name = "kubernetes"
  public_key_location = "/Users/sushmithlahiri/.ssh/id_rsa.pub"
}