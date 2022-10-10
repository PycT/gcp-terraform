resource "google_storage_bucket" "state-bucket" {
    name = var.stateBucketName
    location = "US"
    uniform_bucket_level_access = true
    force_destroy = "true"
}