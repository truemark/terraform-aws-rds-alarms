provider "aws" {
  region = var.provider_region
}

resource "aws_prometheus_rule_group_namespace" "this" {
  for_each     = var.database_collector_thresholds
  name         = each.key
  workspace_id = var.prometheus_workspace_id
  data = templatefile("${path.module}/templates/database-collector.tftpl", {
    databaseIdentifier = each.key,
    thresholds         = each.value.thresholds
  })
}