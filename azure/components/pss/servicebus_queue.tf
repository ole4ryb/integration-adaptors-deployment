
resource "azurerm_servicebus_queue" "pss_tasks_queue" {
  name                = "${local.resource_prefix}-tasks"
  resource_group_name = var.account_resource_group
  namespace_name      = data.terraform_remote_state.base.outputs.base_servicebus_namespace

  enable_partitioning = false
}

# Namespace authorisation rule for all queues
resource "azurerm_servicebus_namespace_authorization_rule" "pss_servicebus_ar" {
  name = "${local.resource_prefix}-servicebus_ar"
  resource_group_name = var.account_resource_group
  namespace_name = data.terraform_remote_state.base.outputs.base_servicebus_namespace

  listen = true
  send = true
  manage = false
}
