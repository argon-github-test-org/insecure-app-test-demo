resource "github_repository" "example" {
  name        = "example"
  description = "My awesome codebase"

  visibility = "public"

  template {
    owner      = "github"
    repository = "terraform-module-template"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "example"
    tags = {
    name        = "My bucket"
    environment = "Dev"
  }
  versioning {
    enabled = true
    mfa_delete = true
  }
    logging {
  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "log/"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  restrict_public_buckets = true
  block_public_acls   = true
  block_public_policy = true
}
