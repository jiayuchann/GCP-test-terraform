terraform {
    backend "gcs" { 
      bucket  = "terraform-state-github-action"
      prefix  = "prod"
    }
}

provider "google" {
  project = var.project
  region = var.region
}

resource "google_storage_bucket" "test-bucket" {
  project = var.project
  name = "very_unique_bucket_2"
  force_destroy = false
  uniform_bucket_level_access = true
  location = var.region
}
