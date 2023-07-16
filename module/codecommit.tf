##Repository
resource "aws_codecommit_repository" "repository" {
  repository_name = var.code_repository_name
  description     = "${var.code_repository_name} repository"
}

##Create IAM User for git
resource "aws_iam_user" "codecommit" {
  name = "codecommit-user"
  path = "/"
}

resource "aws_iam_user_group_membership" "codecommit" {
  user = aws_iam_user.codecommit.name

  groups = [
    aws_iam_group.codecommit.name,
  ]
}

resource "aws_iam_service_specific_credential" "codecommit" {
  service_name = "codecommit.amazonaws.com"
  user_name    = aws_iam_user.codecommit.name
}

resource "aws_iam_group" "codecommit" {
  name = "codecommit-group"
  path = "/"
}

resource "aws_iam_policy" "codecommit" {
  name        = "codecommit-group-policy"
  policy      = data.aws_iam_policy_document.codecommit.json
}

data "aws_iam_policy_document" "codecommit" {
  statement {
    effect    = "Allow"
    actions   = ["codecommit:GitPull", "codecommit:GitPush"]
    resources = ["arn:aws:codecommit:${data.aws_region.current.name}:${data.aws_caller_identity.current.id}:*"]
  }
}

resource "aws_iam_group_policy_attachment" "codecommit" {
  group      = aws_iam_group.codecommit.name
  policy_arn = aws_iam_policy.codecommit.arn
}