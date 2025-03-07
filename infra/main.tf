provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-two-tier-vamsee"
    key            = "terraform/lambda_sso_statefile"
    region         = "ap-south-1"
    encrypt        = true
  }
}

module "ecr" {
  source = "./modules/ecr"

  repository_name = var.ecr_repository_name
}

module "iam" {
  source = "./modules/iam"

  lambda_function_name = var.lambda_function_name
}

module "lambda" {
  source = "./modules/lambda"

  lambda_function_name = var.lambda_function_name
  ecr_repository_url   = var.ecr_repository_url
  iam_role_arn         = module.iam.lambda_role_arn
}

module "api_gateway" {
  source               = "./modules/api_gateway"
  lambda_function_name = module.lambda.lambda_function_name
  lambda_function_arn  = module.lambda.lambda_invoke_arn
  user_pool_id  = module.cognito.user_pool_id
  region          = "us-east-1"
  client_id       = module.cognito_user_pool_client.client_id
}

module "cognito" {
  source      = "./modules/cognito"
  pool_name   = "UserPool-1"
}
 
# Cognito App Client
module "cognito_user_pool_client" {
  source      = "./modules/cognito_user_pool_client"
  user_pool_id = module.cognito.user_pool_id
  client_name = "AppClient-1"
  #client_id     = module.cognito_user_pool_client.client_id
# region        = "us-east-1"
}
