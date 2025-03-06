variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  type        = string
}

variable "client_id" {
  description = "The client ID of the Cognito App"
  type        = string
}
 
variable "region" {
  description = "The AWS region"
  type        = string
}
 
variable "user_pool_id" {
  description = "The User Pool ID"
  type        = string
}
