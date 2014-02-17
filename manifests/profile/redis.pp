class stringed::profile::redis (
  $firewall_rules = {}
)
{
  include ::redis
  create_resources(firewall, $firewall_rules)
}
