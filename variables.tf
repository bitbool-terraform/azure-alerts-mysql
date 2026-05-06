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

variable "cpu_alert" {
  description = "High CPU percentage alert."
  type = object({
    enabled     = optional(bool, true)
    threshold   = optional(number, 80)
    aggregation = optional(string, "Average")
    severity    = optional(number, 2)
    frequency   = optional(string, "PT1M")
    window_size = optional(string, "PT5M")
  })

  default = {}
}

variable "memory_alert" {
  description = "High memory percentage alert."
  type = object({
    enabled     = optional(bool, true)
    threshold   = optional(number, 80)
    aggregation = optional(string, "Average")
    severity    = optional(number, 2)
    frequency   = optional(string, "PT1M")
    window_size = optional(string, "PT5M")
  })

  default = {}
}

variable "storage_alert" {
  description = "High storage percentage alert."
  type = object({
    enabled     = optional(bool, false)
    threshold   = optional(number, 85)
    aggregation = optional(string, "Average")
    severity    = optional(number, 1)
    frequency   = optional(string, "PT5M")
    window_size = optional(string, "PT15M")
  })

  default = {}
}

variable "threads_running_alert" {
  description = "Too many running MySQL threads alert."
  type = object({
    enabled     = optional(bool, false)
    threshold   = optional(number, 50)
    aggregation = optional(string, "Maximum")
    severity    = optional(number, 2)
    frequency   = optional(string, "PT1M")
    window_size = optional(string, "PT5M")
  })

  default = {}
}

variable "active_connections_alert" {
  description = "Too many active MySQL connections alert."
  type = object({
    enabled     = optional(bool, false)
    threshold   = optional(number, 100)
    aggregation = optional(string, "Maximum")
    severity    = optional(number, 2)
    frequency   = optional(string, "PT1M")
    window_size = optional(string, "PT5M")
  })

  default = {}
}

variable "slow_queries_alert" {
  description = "Too many slow queries alert."
  type = object({
    enabled     = optional(bool, false)
    threshold   = optional(number, 10)
    aggregation = optional(string, "Total")
    severity    = optional(number, 2)
    frequency   = optional(string, "PT5M")
    window_size = optional(string, "PT15M")
  })

  default = {}
}

variable "replica_lag_alert" {
  description = "Read replica lag alert, in seconds. Disable this for non-replica servers."
  type = object({
    enabled           = optional(bool, false)
    threshold_seconds = optional(number, 60)
    aggregation       = optional(string, "Average")
    severity          = optional(number, 1)
    frequency         = optional(string, "PT1M")
    window_size       = optional(string, "PT5M")
  })

  default = {}
}

variable "tags" {
  description = "Tags to apply to alert resources."
  type        = map(string)
  default     = {}
}