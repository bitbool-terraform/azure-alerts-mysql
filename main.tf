resource "azurerm_monitor_metric_alert" "this" {
  for_each = local.enabled_metric_alerts

  name                = each.value.name
  resource_group_name = var.resource_group

  scopes = [
    var.mysql_server_id
  ]

  target_resource_type     = "Microsoft.DBforMySQL/flexibleServers"
  target_resource_location = var.location

  description = each.value.description
  severity    = each.value.severity
  frequency   = each.value.frequency
  window_size = each.value.window_size
  enabled     = true

  criteria {
    metric_namespace = "Microsoft.DBforMySQL/flexibleServers"
    metric_name      = each.value.metric_name
    aggregation      = each.value.aggregation
    operator         = each.value.operator
    threshold        = each.value.threshold
  }

  dynamic "action" {
    for_each = toset(var.action_group_ids)

    content {
      action_group_id = action.value
    }
  }

  tags = var.tags
}