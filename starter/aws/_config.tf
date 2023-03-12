provider "aws" {
  region = "us-east-2"
  access_key = "xx"
  secret_key = "xx/8/UpBGRq"
  token = "xx"

  default_tags {
    tags = local.tags
  }
}