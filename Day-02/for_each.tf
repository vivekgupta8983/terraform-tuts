# declaring a variable
variable "users" {
  type = list(string)
  default = ["demo-user", "admin1", "john", "tushar", "rahul"]
}

# creating IAM users
resource "aws_iam_user" "test" {
  for_each = toset(var.users) # converts a list to a set
  name = each.key
}

output "show_names" {
    # similar to Python's list comprehension
    value = [for n in var.users : lower(n)]
}