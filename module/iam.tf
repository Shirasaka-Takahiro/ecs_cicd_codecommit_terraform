##IAM Role
resource "aws_iam_role" "fargate_task_execution" {
  name               = "role-fargate_task_execution"
  assume_role_policy = file("${path.module}/ecs_json/fargate_task_assume_role.json")
}

resource "aws_iam_role" "codebuild_service_role" {
  name               = "role-codebuild-service-role"
  assume_role_policy = file("${path.module}/ecs_json/codebuild_assume_role.json")
}

resource "aws_iam_role" "codepipeline_service_role" {
  name               = "role-codepipeline-service-role"
  assume_role_policy = file("${path.module}/ecs_json/codepipeline_assume_role.json")
}

##IAM Role Policy
resource "aws_iam_role_policy" "fargate_task_execution" {
  name   = "execution-policy"
  role   = aws_iam_role.fargate_task_execution.name
  policy = file("${path.module}/ecs_json/task_execution_policy.json")
}

resource "aws_iam_role_policy" "codebuild_service_role" {
  name   = "build-policy"
  role   = aws_iam_role.codebuild_service_role.name
  policy = file("${path.module}/ecs_json/codebuild_build_policy.json")
}

resource "aws_iam_role_policy" "codepipeline_service_role" {
  name   = "pipeline-policy"
  role   = aws_iam_role.codepipeline_service_role.name
  policy = file("${path.module}/ecs_json/codepipeline_pipeline_policy.json")
}