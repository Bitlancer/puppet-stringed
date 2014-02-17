class stringed::profile::apache_phpfpm (
  $firewall_rules = {}
)
{
  include stringed::wrapper::apache_phpfpm
  create_resources(firewall, $firewall_rules)
}
