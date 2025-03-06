resource "aws_cognito_user_pool" "this" {
  name = var.pool_name
 
  auto_verified_attributes = ["email"]
  mfa_configuration        = "OFF"
 
  username_attributes = ["email"]
}
resource "aws_cognito_user_pool_client" "this" {
  name          = var.client_name
  user_pool_id  = var.user_pool_id
  allowed_oauth_flows    = ["code", "implicit"]
  allowed_oauth_scopes   = ["openid", "email"]
  allowed_oauth_flows_user_pool_client = true
  supported_identity_providers = ["COGNITO"]
  callback_urls = ["http://localhost:3000/callback"]
  logout_urls   = ["https://localhost.com/logout"]
  explicit_auth_flows = [
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH",
    "ALLOW_ADMIN_USER_PASSWORD_AUTH",
    "ALLOW_USER_PASSWORD_AUTH"
  ]
}

output "user_pool_id" {
  value = aws_cognito_user_pool.this.id
}
 
output "user_pool_arn" {
  value = aws_cognito_user_pool.this.arn
}
 
output "client_id" {
  value = aws_cognito_user_pool_client.this.id
}
