terraform {
  backend "s3" {
    bucket = "shahawi-terra"
    key    = "terraform.tfstate"
    region = "eu-north-1"
    dynamodb_table = "testt"
  }
}
