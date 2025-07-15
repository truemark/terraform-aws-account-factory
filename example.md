module "control_tower_account" {
  source = "../../modules/control_tower_account"

  region              = "us-east-1"
  account_email       = "john.appleseed01@example.com"
  account_name        = "John-Appleseed-01"
  organizational_unit = "Core-Ops"

  tags = {
    environment = "prod"
    team        = "operations"
  }
}