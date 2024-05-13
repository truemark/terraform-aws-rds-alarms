variable "provider_region" {
  description = "The region in which the provider will be created"
  default     = "us-east-2"
}

variable "rule_group_namespace_name" {
  description = "The name of the namespace in which the rule group will be created"
  default     = "default"
}

variable "prometheus_workspace_id" {
  description = "The workspace id of the prometheus workspace"
}

variable "database_collector_thresholds" {
  description = "The rules for the database collector"
  type = map(object({
    thresholds = object({
      TablespaceWarning = number
      TablespaceCritical = number
      SessionUtilization = number
      RecoveryFileDestinationUsage = number
      BlockingCount = number
      DatabaseRestarted = number
    })
  }))
  default = {
    test = {
      thresholds = {
        TablespaceWarning = 85
        TablespaceCritical = 90
        SessionUtilization = 70
        RecoveryFileDestinationUsage = 80
        BlockingCount = 0
        DatabaseRestarted = 1200
      }
    }
    test1 = {
      thresholds = {
        TablespaceWarning = 80
        TablespaceCritical = 95
        SessionUtilization = 85
        RecoveryFileDestinationUsage = 90
        BlockingCount = 1
        DatabaseRestarted = 1500
      }
    }
  }
}

// Option 2
variable "alert_rules" {
  description = "The alert rules to be created"
    type = map(object({
        alert_rule_name = string
        alert_rule_description = string
        alert_rule_expression = string
        alert_rule_duration = string
        alert_rule_severity = string
        alert_rule_namespace = string
    }))
}