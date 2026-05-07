variable "name" {
  description = "Base name/prefix for MySQL alert resources."
  type        = string
}

variable "resource_group" {
  description = "Resource group where alert rules are created."
  type        = string
}

variable "location" {
  type        = string
}

variable "mysql_server_id" {
  description = "The MySQL Flexible Server monitored by this submodule."
  type        = string
}

variable "action_group_ids" {
  description = "Action Group IDs created/passed by the parent generic alerts module."
  type        = list(string)
  default     = []
}

variable "alerts" {
  description = "MySQL Flexible Server metric alert settings."
  type = object({
    cpu = optional(object({
      enabled     = optional(bool, true)
      threshold   = optional(number, 80)
      aggregation = optional(string, "Average")
      severity    = optional(number, 2)
      frequency   = optional(string, "PT1M")
      window_size = optional(string, "PT5M")
    }), {})

    memory = optional(object({
      enabled     = optional(bool, true)
      threshold   = optional(number, 80)
      aggregation = optional(string, "Average")
      severity    = optional(number, 2)
      frequency   = optional(string, "PT1M")
      window_size = optional(string, "PT5M")
    }), {})

    storage = optional(object({
      enabled     = optional(bool, true)
      threshold   = optional(number, 85)
      aggregation = optional(string, "Average")
      severity    = optional(number, 1)
      frequency   = optional(string, "PT5M")
      window_size = optional(string, "PT15M")
    }), {})

    threads_running = optional(object({
      enabled     = optional(bool, false)
      threshold   = optional(number, 50)
      aggregation = optional(string, "Maximum")
      severity    = optional(number, 2)
      frequency   = optional(string, "PT1M")
      window_size = optional(string, "PT5M")
    }), {})

    active_connections = optional(object({
      enabled     = optional(bool, false)
      threshold   = optional(number, 100)
      aggregation = optional(string, "Maximum")
      severity    = optional(number, 2)
      frequency   = optional(string, "PT1M")
      window_size = optional(string, "PT5M")
    }), {})

    slow_queries = optional(object({
      enabled     = optional(bool, false)
      threshold   = optional(number, 10)
      aggregation = optional(string, "Total")
      severity    = optional(number, 2)
      frequency   = optional(string, "PT5M")
      window_size = optional(string, "PT15M")
    }), {})

    replica_lag = optional(object({
      enabled           = optional(bool, false)
      threshold_seconds = optional(number, 60)
      aggregation       = optional(string, "Average")
      severity          = optional(number, 1)
      frequency         = optional(string, "PT1M")
      window_size       = optional(string, "PT5M")
    }), {})
  })

  default = {}
}

variable "tags" {
  description = "Tags to apply to alert resources."
  type        = map(string)
  default     = {}
}