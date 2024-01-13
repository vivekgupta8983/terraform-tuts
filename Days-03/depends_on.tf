# resource "aws_instance" "ec2" {
#   provider = aws.tushar
#   ami           = "ami-a1b2c3d4"
#   instance_type = "t2.micro"

#   # Terraform can infer from this that the instance profile must
#   # be created before the EC2 instance.
#   # iam_instance_profile = aws_iam_instance_profile.instance-profile

#   # However, if software running in this EC2 instance needs access
#   # to the S3 API in order to boot properly, there is also a "hidden"
#   # dependency on the aws_iam_role_policy that Terraform cannot
#   # automatically infer, so it must be declared explicitly:
#   depends_on = [
#     aws_iam_role_policy.policy
#   ]
# }

# resource "aws_iam_role_policy" "policy" {
#    provider = aws.tushar
#   name = "demo-policy"
#   role = aws_iam_role.role.name
#   policy = jsonencode({
#     "Statement" = [{
#       "Action" = "s3:*",
#       "Effect" = "Allow",
#     }],
#   })
# }

# resource "aws_iam_role" "role" {
#    provider = aws.tushar
#   name = "demo-role"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Sid    = ""
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })
# }

# resource "aws_iam_instance_profile" "instance-profile" {
#    provider = aws.tushar
#   # Terraform can infer automatically that the role must be created first.
#   role = aws_iam_role.role.name
# }





