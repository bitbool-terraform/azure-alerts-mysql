output "alert_ids" {
  description = "Map of enabled MySQL metric alert IDs."
  value = {
    for k, alert in azurerm_monitor_metric_alert.this : k => alert.id
  }
}

output "alert_names" {
  description = "Map of enabled MySQL metric alert names."
  value = {
    for k, alert in azurerm_monitor_metric_alert.this : k => alert.name
  }
}