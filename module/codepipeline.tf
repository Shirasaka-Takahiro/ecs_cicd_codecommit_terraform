resource "aws_codepipeline" "pipeline" {
  name     = "${var.general_config["project"]}-${var.general_config["env"]}-pipeline"
  role_arn = aws_iam_role.codepipeline_service_role.arn

  artifact_store {
    location = aws_s3_bucket.bucket_pipeline.bucket
    type     = "S3"
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn        = aws_codestarconnections_connection.github.arn
        FullRepositoryId     = "Shirasaka-Takahiro/ecs_cicd_terraform"
        BranchName              = "main"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"
      configuration = {
        ProjectName = aws_codebuild_project.project.name
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      input_artifacts = ["build_output"]
      version         = "1"

      configuration = {
        ClusterName = aws_ecs_cluster.cluster.arn
        ServiceName = aws_ecs_service.service.name
        FileName    = "imagedef.json"
      }
    }
  }
}


##Codestar Connections Connection
resource "aws_codestarconnections_connection" "github" {
  name = "${var.general_config["project"]}-github-connection"
  provider_type = "GitHub"
}