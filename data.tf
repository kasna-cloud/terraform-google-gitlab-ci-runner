data "google_compute_zones" "available" {
  project = var.project
  region  = var.region
}

resource "random_shuffle" "zones" {
  input        = data.google_compute_zones.available.names
  result_count = 1
}

resource "random_id" "this" {
  byte_length = 8
}

data "google_compute_network" "this" {
  project = var.project
  name    = var.network
}

data "google_compute_image" "cos_stable" {
  count = var.runner_machine_image == "cos-stable" ? 1 : 0

  family  = "cos-stable"
  project = "cos-cloud"
}
