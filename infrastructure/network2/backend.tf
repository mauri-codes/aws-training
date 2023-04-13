terraform {
  backend "s3" {
    # Bucket S3
    bucket = "mauri-terraform-state"
    key    = "network2.ftstate"
    region = "us-east-1"
    # DynamoDB Table, Partition Key = LockID
    dynamodb_table = "mau-terraform-state"
  }
}
