# resource "aws_s3_bucket" "terraform_s3_backend" {
#   bucket_prefix = "terraform-s3-backend"
# }

# # resource "aws_s3_bucket_acl" "terraform_s3_backend_acl" {
# #   bucket = aws_s3_bucket.terraform_s3_backend.id
# #   acl    = "private"
# # }

# resource "aws_s3_bucket_versioning" "terraform_s3_backend_versioning" {
#   bucket = aws_s3_bucket.terraform_s3_backend.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# resource "aws_dynamodb_table" "terraform-lock" {
#     name           = "terraform_state"
#     read_capacity  = 5
#     write_capacity = 5
#     hash_key       = "LockID"
#     attribute {
#         name = "LockID"
#         type = "S"
#     }
#     tags = {
#         "Name" = "DynamoDB Terraform State Lock Table"
#     }
# }

# output "bucket_name" {
#     value = aws_s3_bucket.terraform_s3_backend.id
  
# }



# terraform {
#   backend "s3" {
#     bucket     = "terraform-s3-backend20240116022743663600000001"
#     key        = "s3-backend.tfstate"
#     region     = "us-east-1"
#     access_key = "AKIAWAY3OUANH6DHP57Z"
#     secret_key = "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"
#     dynamodb_table = "terraform_state"
#   }
# }

