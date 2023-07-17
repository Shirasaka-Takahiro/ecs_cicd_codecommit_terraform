##SSM
#resource "aws_ssm_parameter" "codecommit_username" {
#  name        = "codecommit-username"
#  type        = "SecureString"
#  value       = aws_iam_service_specific_credential.codecommit.service_user_name
#}

#resource "aws_ssm_parameter" "codecommit_password" {
#  name        = "codecommit-password"
#  type        = "SecureString"
#  value       = aws_iam_service_specific_credential.codecommit.service_password
#}

#resource "aws_secretsmanager_secret" "codecommit" {
#  name = "codecommit-git-secrets"
#}

#resource "aws_secretsmanager_secret_version" "codecommit" {
#  secret_id = aws_secretsmanager_secret.codecommit.id
#  secret_string = jsonencode({
#    "UserName" : aws_iam_service_specific_credential.codecommit.service_user_name,
#    "Password" : aws_iam_service_specific_credential.codecommit.service_password,
#  })
#}