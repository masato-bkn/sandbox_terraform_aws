resource "aws_cognito_user_pool" "user_pool" {
    auto_verified_attributes  = [
        "email",
    ]
    mfa_configuration         = "OFF"
    name                      = "user_pool"

    account_recovery_setting {
        recovery_mechanism {
            name     = "verified_email"
            priority = 1
        }
        recovery_mechanism {
            name     = "verified_phone_number"
            priority = 2
        }
    }

    admin_create_user_config {
        allow_admin_create_user_only = false
    }
    email_configuration {
        email_sending_account = "COGNITO_DEFAULT"
    }

    password_policy {
        minimum_length                   = 8
        require_lowercase                = true
        require_numbers                  = true
        require_symbols                  = true
        require_uppercase                = true
        temporary_password_validity_days = 7
    }

    schema {
        attribute_data_type      = "String"
        developer_only_attribute = false
        mutable                  = true
        name                     = "email"
        required                 = true

        string_attribute_constraints {
            max_length = "2048"
            min_length = "0"
        }
    }

    username_configuration {
        case_sensitive = false
    }

    verification_message_template {
        default_email_option = "CONFIRM_WITH_CODE"
    }
}