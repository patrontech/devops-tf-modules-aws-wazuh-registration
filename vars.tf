variable "wazuh_manager_ip" {
  description = "Wazuh manager IP or DNS Name"
}

variable "wazuh_manager_password" {
  description = "Wazuh manager password (leave blank if it doesn't require it"
}

variable "wazuh_agent_groups" {
  description = "Wazuh agent groups to register with (comma seperate values)"
  default     = "default"
}
