# resource "aws_iam_user" "accounts" {
#   for_each = toset( ["Developer", "Tester", "Administrator", "Cloud-Architect"] )
#   name     = each.key
# }