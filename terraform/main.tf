provider "aws" {
  region = "us-east-1"

  access_key = "test"
  secret_key = "test"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  skip_region_validation      = true

  s3_use_path_style = true

  endpoints {
    s3       = "http://localhost:4566"
    sqs      = "http://localhost:4566"
    dynamodb = "http://localhost:4566"
  }
}
resource "aws_s3_bucket" "artifact" {
  bucket = "artifact-bucket"

  force_destroy = true
}

resource "aws_s3_bucket" "deploy" {
  bucket = "deploy-bucket"

  force_destroy = true
}

resource "aws_sqs_queue" "pipeline_queue" {
  name = "pipeline-queue"

  visibility_timeout_seconds = 30

  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }
}


resource "aws_dynamodb_table" "pipeline_status" {
  name         = "pipeline-status"
  billing_mode = "PROVISIONED"   

  hash_key = "id"

  read_capacity  = 1
  write_capacity = 1

  attribute {
    name = "id"
    type = "S"
  }

  lifecycle {
    ignore_changes = [
      read_capacity,
      write_capacity
    ]
  }

  timeouts {
    create = "20s"
  }
}