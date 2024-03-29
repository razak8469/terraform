provider "google" {
  project = "<YOUR_PROJECT_ID>"
  region  = "us-central-1"
}

resource "google_storage_bucket" "test-bucket-for-state" {
  name                        = "<YOUR_PROJECT_ID>"
  location                    = "US"
  uniform_bucket_level_access = true
}

terraform {
  backend "gcs" {
    bucket = "<YOUR_BUCKET_NAME>"
    prefix = "terraform/state"
  }
}
