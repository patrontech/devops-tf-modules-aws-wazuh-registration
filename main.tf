## The following file is responsible for generating and outputing the user-data which can be used to register an instance
## with wazuh. It should be concatenated with whatever other userdata scripts we have
locals {
  userdata_snippet = templatefile("${path.module}/bash.tpl", {
    wazuh_manager_ip       = var.wazuh_manager_ip
    wazuh_manager_password = var.wazuh_manager_password
    wazuh_agent_groups     = var.wazuh_agent_groups
  })
}

output "userdata_snippet" {
  description = "Userdata snippet to be added to EC2 instance during bootstrap"
  value       = local.userdata_snippet
}
