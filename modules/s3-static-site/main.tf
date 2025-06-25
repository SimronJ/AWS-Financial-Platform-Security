# S3 static site module stub 

resource "aws_s3_bucket" "site" {
  bucket = var.bucket_name
  acl    = "private"
  force_destroy = true
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
  tags = {
    Name = var.bucket_name
  }
}

resource "aws_s3_bucket_public_access_block" "site" {
  bucket = aws_s3_bucket.site.id
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}

output "bucket_name" {
  value = aws_s3_bucket.site.bucket
} 