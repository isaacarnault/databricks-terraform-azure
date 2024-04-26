variable "subscription_id" {
  description = "The Azure subscription ID."
}

variable "client_id" {
  description = "The Azure service principal client ID."
}

variable "client_secret" {
  description = "The Azure service principal client secret."
}

variable "tenant_id" {
  description = "The Azure tenant ID."
}

variable "location" {
  description = "The Azure region in which to deploy resources."
  default     = "East US"
}

