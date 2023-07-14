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

resource "google_compute_instance" "example_instance" {
  name         = "example-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
}
