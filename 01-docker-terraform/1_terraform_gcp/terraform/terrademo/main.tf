terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.42.0"
    }
  }
}

provider "google" {
credentials = "./keys/mycreds.json"
  project     = "theta-totem-432901-f9"
  region      = "us-east1"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "gs-demo-bucket-de-zoomcamp"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

#try2