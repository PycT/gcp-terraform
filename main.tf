terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "3.55.0"
        }
    }
}

provider "google" {
  project = var.project_id
  region = var.region
  zone = var.zone
}

module "instances" {
  source = "./modules/instances"
  project_id = var.project_id
  region = var.region
  zone = var.zone
  vpcName = var.vpcName
}

module "storage" {
  source = "./modules/storage"
  project_id = var.project_id
  region = var.region
  zone = var.zone
  stateBucketName = var.stateBucketName
  vpcName = var.vpcName
}

module "vpc" {
    source  = "terraform-google-modules/network/google//modules/vpc"
    version = "3.4.0"

    project_id   = var.project_id
    network_name = var.vpcName

    shared_vpc_host = false
}

#UNCOMMENT AFTER THE VPC IS CREATED
# resource "google_compute_subnetwork" "subnet_01" {
#     name = "subnet-01"
#     network = var.vpcName
#     ip_cidr_range = "10.10.10.0/24"
#     region = var.region
# }

# resource "google_compute_subnetwork" "subnet_02" {
#     name = "subnet-02"
#     network = var.vpcName
#     ip_cidr_range = "10.10.20.0/24"
#     region = var.region
# }

module "firewall_rules" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  project_id   = var.project_id
  network_name = module.vpc.network_name

  rules = [{
    name                    = "tf-firewall"
    description             = null
    direction               = "INGRESS"
    priority                = null
    ranges                  = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["80"]
    }]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]
}

# UNCOMMENT AFTER THE BUCKET IS CREATED
# terraform {
#     backend "gcs" {
#         bucket = "FILLME"
#         prefix = "terraform/state"
#     }
# }