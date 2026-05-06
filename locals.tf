locals {
  metric_alerts = {
    high_cpu = {
      enabled     = var.cpu_alert.enabled
      name        = "${var.name}-mysql-high-cpu"
      description = "MySQL Flexible Server ${var.mysql_server_id} CPU usage is above ${var.cpu_alert.threshold}%."
      metric_name = "cpu_percent"
      aggregation = var.cpu_alert.aggregation
      operator    = "GreaterThan"
      threshold   = var.cpu_alert.threshold
      severity    = var.cpu_alert.severity
      frequency   = var.cpu_alert.frequency
      window_size = var.cpu_alert.window_size
    }

    high_memory = {
      enabled     = var.memory_alert.enabled
      name        = "${var.name}-mysql-high-memory"
      description = "MySQL Flexible Server ${var.mysql_server_id} memory usage is above ${var.memory_alert.threshold}%."
      metric_name = "memory_percent"
      aggregation = var.memory_alert.aggregation
      operator    = "GreaterThan"
      threshold   = var.memory_alert.threshold
      severity    = var.memory_alert.severity
      frequency   = var.memory_alert.frequency
      window_size = var.memory_alert.window_size
    }

    high_storage = {
      enabled     = var.storage_alert.enabled
      name        = "${var.name}-mysql-high-storage"
      description = "MySQL Flexible Server ${var.mysql_server_id} storage usage is above ${var.storage_alert.threshold}%."
      metric_name = "storage_percent"
      aggregation = var.storage_alert.aggregation
      operator    = "GreaterThan"
      threshold   = var.storage_alert.threshold
      severity    = var.storage_alert.severity
      frequency   = var.storage_alert.frequency
      window_size = var.storage_alert.window_size
    }

    threads_running = {
      enabled     = var.threads_running_alert.enabled
      name        = "${var.name}-mysql-threads-running"
      description = "MySQL Flexible Server ${var.mysql_server_id} has too many running threads."
      metric_name = "Threads_running"
      aggregation = var.threads_running_alert.aggregation
      operator    = "GreaterThan"
      threshold   = var.threads_running_alert.threshold
      severity    = var.threads_running_alert.severity
      frequency   = var.threads_running_alert.frequency
      window_size = var.threads_running_alert.window_size
    }

    active_connections = {
      enabled     = var.active_connections_alert.enabled
      name        = "${var.name}-mysql-active-connections"
      description = "MySQL Flexible Server ${var.mysql_server_id} has too many active connections."
      metric_name = "active_connections"
      aggregation = var.active_connections_alert.aggregation
      operator    = "GreaterThan"
      threshold   = var.active_connections_alert.threshold
      severity    = var.active_connections_alert.severity
      frequency   = var.active_connections_alert.frequency
      window_size = var.active_connections_alert.window_size
    }

    slow_queries = {
      enabled     = var.slow_queries_alert.enabled
      name        = "${var.name}-mysql-slow-queries"
      description = "MySQL Flexible Server ${var.mysql_server_id} has too many slow queries."
      metric_name = "Slow_queries"
      aggregation = var.slow_queries_alert.aggregation
      operator    = "GreaterThan"
      threshold   = var.slow_queries_alert.threshold
      severity    = var.slow_queries_alert.severity
      frequency   = var.slow_queries_alert.frequency
      window_size = var.slow_queries_alert.window_size
    }

    replica_lag = {
      enabled     = var.replica_lag_alert.enabled
      name        = "${var.name}-mysql-replica-lag"
      description = "MySQL Flexible Server ${var.mysql_server_id} replication lag is above ${var.replica_lag_alert.threshold_seconds} seconds."
      metric_name = "replication_lag"
      aggregation = var.replica_lag_alert.aggregation
      operator    = "GreaterThan"
      threshold   = var.replica_lag_alert.threshold_seconds
      severity    = var.replica_lag_alert.severity
      frequency   = var.replica_lag_alert.frequency
      window_size = var.replica_lag_alert.window_size
    }
  }

  enabled_metric_alerts = {
    for k, v in local.metric_alerts : k => v
    if v.enabled
  }
}