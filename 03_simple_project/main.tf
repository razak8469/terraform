provider "google" {
  version = "~> 3.45.0"
}

provider "null" {
  version = "~> 2.1"
}

module "test-vpc-module" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 3.2.0"
  project_id   = var.project_id
  network_name = "my-custom-mode-network"
  mtu          = 1460

  subnets = [
    {
      subnets_name  = "subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-west1"
    },
    {
      subnet_name            = "subnet-02"
      subnet_ip              = "10.10.20.0/24"
      subnet_region          = "us-west1"
      subnets_private_access = "true"
      subnets_flow_logs      = "true"
    },
    {
      subnet_name                = "subnet-03"
      subnet_ip                  = "10.10.30.0/24"
      subnet_region              = "us-west1"
      subnets_private_access     = "true"
      subnets_flow_logs          = "true"
      subnets_flow_logs_interval = "INTERVAL-10-MIN"
      subnets_flow_logs_sampling = 0.7
      subnets_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    }
  ]
}

