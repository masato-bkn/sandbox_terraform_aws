resource "aws_iam_user" "ci_machine_users" {
  for_each = toset([
    "circle-ci",
  ])
  name = each.value
  path = "/ci/"
}
