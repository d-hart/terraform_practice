provider "aws" {
    region = "us-east-1"
    profile = "nonprod-com"
}

resource "aws_s3_bucket" "mybucket" {
    bucket = "durells-tf-bucket-terraform"
    acl = "private"
    tags = {
        Environment = "Dev"
    }
}
resource "aws_s3_bucket_object" "myfirstobject" {
    bucket = aws_s3_bucket.mybucket.id
    key = "test.txt"
    source = "/Users/durell.hart/code/terraform/terraform-training/create_s3/text.txt"
    etag = md5(file("/Users/durell.hart/code/terraform/terraform-training/create_s3/text.txt"))
}