class stringed::profile::tomcat (
  $firewall_rules = {}
)
{
  include ::stringed::wrapper::tomcat
  create_resources(firewall, $firewall_rules)
}
