## Brief
The following terraform module is used to generate a user-data snippet which can be used to register a host with wazuh upon startup.

The host will already require wazuh agent to actually be installed previously before this is run, but that should be pre-packed into an AMI already to avoid the additional install time.

## Example
```terraform
module "autoscale_wazuh_agent_hander" {
  source  = "github.com/patrontech/devops-tf-module-aws-wazuh-registration?ref=v1.0.0"
  wazuh_manager_ip = "wazuh.mydomain.com"
  wazuh_manager_password = "changeme"
}

resource "aws_launch_template" "ecs_node_group" {
  name                   = "${var.aws_base_tags.env_name}-app-ecs-node-group"
  .......
  .......
  user_data              = base64encode(autoscale_wazuh_agent_hander.userdata_snippet)
}