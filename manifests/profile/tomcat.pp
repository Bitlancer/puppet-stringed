class stringed::profile::tomcat (
  $firewall_rules = {}
)
{
  include ::tomcat
  create_resources(firewall, $firewall_rules)
}
