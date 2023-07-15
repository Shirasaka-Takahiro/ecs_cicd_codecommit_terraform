■Set-Up
1. Create S3 for tfstate
ex)example-dev-alb-accesslog-bucket

■Resources
<br />
ECS(fargate) x 2
<br />
ECR
<br />
ALB x 1
<br />
Cloud Watch Log Group
<br />
Route53
<br />
ACM
<br />
S3 x 3
<br />
IAM x 3
<br />
Codebuild
<br />
Codepipeline

■Architecture
<br />
Go to wiki page!

■Deploy
1. Build Dockerfile on local
docker build -t {IMAGE_NAME}:latest ./docker
2. Move prod directory
3. terraform init
4. terraform plan
5. terraform apply
6. Connect Github repository to AWS Account throughout Codestar Connections Connection
7. Restart Codepipeline