# tfaction が使うS3バケット
# 用途はいくつかありバケットを分離することもできるが、今回は1つで運用してみる

resource "aws_s3_bucket" "tfaction" {
  bucket        = var.s3_tfaction_bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_acl" "tfaction" {
  bucket = aws_s3_bucket.tfaction.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "tfaction" {
  bucket = aws_s3_bucket.tfaction.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "tfaction" {
  bucket = aws_s3_bucket.tfaction.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tfaction" {
  bucket = aws_s3_bucket.tfaction.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
