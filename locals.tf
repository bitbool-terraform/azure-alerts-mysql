locals {
  metric_alerts = {
    high_cpu = {
      enabled     = var.alerts.cpu.enabled
      name        = "${var.name}-mysql-high-cpu"
      description = "MySQL Flexible Server ${var.mysql_server_id} CPU usage is above ${var.alerts.cpu.threshold}%."
      metric_name = "cpu_percent"
      aggregation = var.alerts.cpu.aggregation
      operator    = "GreaterThan"
      threshold   = var.alerts.cpu.threshold
      severity    = var.alerts.cpu.severity
      frequency   = var.alerts.cpu.frequency
      window_size = var.alerts.cpu.window_size
    }

    high_memory = {
      enabled     = var.alerts.memory.enabled
      name        = "${var.name}-mysql-high-memory"
      description = "MySQL Flexible Server ${var.mysql_server_id} memory usage is above ${var.alerts.memory.threshold}%."
      metric_name = "memory_percent"
      aggregation = var.alerts.memory.aggregation
      operator    = "GreaterThan"
      threshold   = var.alerts.memory.threshold
      severity    = var.alerts.memory.severity
      frequency   = var.alerts.memory.frequency
      window_size = var.alerts.memory.window_size
    }

    high_storage = {
      enabled     = var.alerts.storage.enabled
      name        = "${var.name}-mysql-high-storage"
      description = "MySQL Flexible Server ${var.mysql_server_id} storage usage is above ${var.alerts.storage.threshold}%."
      metric_name = "storage_percent"
      aggregation = var.alerts.storage.aggregation
      operator    = "GreaterThan"
      threshold   = var.alerts.storage.threshold
      severity    = var.alerts.storage.severity
      frequency   = var.alerts.storage.frequency
      window_size = var.alerts.storage.window_size
    }

    threads_running = {
      enabled     = var.alerts.threads_running.enabled
      name        = "${var.name}-mysql-threads-running"
      description = "MySQL Flexible Server ${var.mysql_server_id} has too many running threads."
      metric_name = "Threads_running"
      aggregation = var.alerts.threads_running.aggregation
      operator    = "GreaterThan"
      threshold   = var.alerts.threads_running.threshold
      severity    = var.alerts.threads_running.severity
      frequency   = var.alerts.threads_running.frequency
      window_size = var.alerts.threads_running.window_size
    }

    active_connections = {
      enabled     = var.alerts.active_connections.enabled
      name        = "${var.name}-mysql-active-connections"
      description = "MySQL Flexible Server ${var.mysql_server_id} has too many active connections."
      metric_name = "active_connections"
      aggregation = var.alerts.active_connections.aggregation
      operator    = "GreaterThan"
      threshold   = var.alerts.active_connections.threshold
      severity    = var.alerts.active_connections.severity
      frequency   = var.alerts.active_connections.frequency
      window_size = var.alerts.active_connections.window_size
    }

    slow_queries = {
      enabled     = var.alerts.slow_queries.enabled
      name        = "${var.name}-mysql-slow-queries"
      description = "MySQL Flexible Server ${var.mysql_server_id} has too many slow queries."
      metric_name = "Slow_queries"
      aggregation = var.alerts.slow_queries.aggregation
      operator    = "GreaterThan"
      threshold   = var.alerts.slow_queries.threshold
      severity    = var.alerts.slow_queries.severity
      frequency   = var.alerts.slow_queries.frequency
      window_size = var.alerts.slow_queries.window_size
    }

    replica_lag = {
      enabled     = var.alerts.replica_lag.enabled
      name        = "${var.name}-mysql-replica-lag"
      description = "MySQL Flexible Server ${var.mysql_server_id} replication lag is above ${var.alerts.replica_lag.threshold_seconds} seconds."
      metric_name = "replication_lag"
      aggregation = var.alerts.replica_lag.aggregation
      operator    = "GreaterThan"
      threshold   = var.alerts.replica_lag.threshold_seconds
      severity    = var.alerts.replica_lag.severity
      frequency   = var.alerts.replica_lag.frequency
      window_size = var.alerts.replica_lag.window_size
    }
  }

  enabled_metric_alerts = {
    for k, v in local.metric_alerts : k => v
    if v.enabled
  }
}