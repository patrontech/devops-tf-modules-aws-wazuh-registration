## The following file is responsible for generating and outputing the user-data which can be used to register an instance
## with wazuh. It should be concatenated with whatever other userdata scripts we have
data "template_file" "userdata_snippet" {
  template = file("${path.module}/bash.tpl")
  vars = {
    wazuh_manager_ip        = var.wazuh_manager_ip
    wazuh_manager_password  = var.wazuh_manager_password 
  }
}

output "userdata_snippet" {
  description = "Userdata snippet to be added to EC2 instance during bootstrap"
  value       = data.template_file.userdata_snippet.rendered
}