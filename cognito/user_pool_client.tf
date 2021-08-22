resource "aws_cognito_user_pool_client" "user_pool_client" {
  access_token_validity                = 60
  allowed_oauth_flows                  = []
  allowed_oauth_flows_user_pool_client = false
  allowed_oauth_scopes                 = []
  callback_urls                        = []
  enable_token_revocation              = true
  explicit_auth_flows = [
    "ALLOW_ADMIN_USER_PASSWORD_AUTH",
    "ALLOW_CUSTOM_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH",
  ]
  id_token_validity             = 60
  logout_urls                   = []
  name                          = "apiApp"
  prevent_user_existence_errors = "ENABLED"
  refresh_token_validity        = 30
  supported_identity_providers  = []
  user_pool_id                  = aws_cognito_user_pool.user_pool.id
}
