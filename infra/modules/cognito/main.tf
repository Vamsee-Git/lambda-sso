resource "aws_cognito_user_pool" "this" {
  name = var.pool_name
 
  auto_verified_attributes = ["email"]
  mfa_configuration        = "OFF"
 
  username_attributes = ["email"]
}
 
output "user_pool_id" {
  value = aws_cognito_user_pool.this.id
}
 
output "user_pool_arn" {
  value = aws_cognito_user_pool.this.arn
}
