variable "pool_name" {
  description = "The name of the Cognito User Pool"
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
