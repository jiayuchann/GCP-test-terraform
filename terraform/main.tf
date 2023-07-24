terraform {
    backend "gcs" { 
      bucket  = "terraform-state-github-action"
      prefix  = "prod"
    }
}

provider "google" {
  project = var.project
  region  = var.region
}

# Create bucket
resource "google_storage_bucket" "cf-bucket" {
  project = var.project
  name = var.bucket_name
  force_destroy = true
  location = var.region
}

# Upload function.zip to bucket
resource "google_storage_bucket_object" "cf-function-zip" {
  name = "function.zip"
  source = "function.zip"
  bucket = google_storage_bucket.cf-bucket.name
}

# Deploy Cloud Function
resource "google_cloudfunctions_function" "function-gen1" {
  name = var.function_name
  runtime = var.function_runtime
  source_archive_bucket = google_storage_bucket.cf-bucket.name
  source_archive_object = google_storage_bucket_object.cf-function-zip.name
  trigger_http = true
  entry_point = "bigquery_to_metric"
}