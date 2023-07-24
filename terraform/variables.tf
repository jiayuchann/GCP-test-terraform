variable "project" {
    type = string
    default = "bigquery-stuff-389701"
    description = "ID of GCP project"
}

variable "region" {
    type = string
    default = "us-central1"
    description = "Region where resources will be created"
}

variable "bucket_name" {
    type = string
    default = "cf-bucket-12340912374"
    description = "Bucket name for Cloud Function"
}

variable "function_name" {
    type = string
    default = "cf-deployed-from-terraform"
}

variable "function_runtime" {
    type = string
    default = "python39"
}