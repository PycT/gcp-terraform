provider "google" {
  project_id = var.project_id
  region = var.region
  zone = var.zone
}

module "instances" {
  source = "./instances"
  project_id = var.project_id
  region = var.region
  zone = var.zone
}

module "storage" {
  source = "./storage"
  project_id = var.project_id
  region = var.region
  zone = var.zone
  stateBucketName = var.stateBucketName
}

module "vpc" {
    source  = "terraform-google-modules/network/google//modules/vpc"
    version = "3.4.0"

    project_id   = var.project_id
    network_name = var.vpcName

    shared_vpc_host = false
}

resource "google_compute_subnetwork" "subnet_01" {
    name = "subnet-01"
    network = var.vpcName
    ip_cidr_range = "10.10.10.0/24"
    region = var.region
}

resource "google_compute_subnetwork" "subnet_02" {
    name = "subnet-02"
    network = var.vpcName
    ip_cidr_range = "10.10.20.0/24"
    region = var.region
}


terraform {
    backend "gcs" {
        bucket = module.storage.stateBucketName
        prefix = "terraform/state"
    }
}