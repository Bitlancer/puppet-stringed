class stringed::profile::tomcat (
  $contexts = {},
  $firewall_rules = {}
)
{
  
  include ::tomcat
  create_resources(tomcat::context, $contexts)
  
  create_resources(firewall, $firewall_rules)
}
