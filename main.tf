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
