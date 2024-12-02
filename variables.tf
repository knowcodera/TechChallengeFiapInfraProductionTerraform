variable "production_cosmosdb_name" {
  description = "Nome da conta CosmosDB para Production"
  type        = string
}

variable "production_db_name" {
  description = "Nome do banco de dados MongoDB para Production"
  type        = string
}

# somente local
# variable "subscription_id" {
#   description = "Azure Subscription ID"
#   type        = string
#   sensitive   = true
# }
