class stringed::profile::nodejs (
  $firewall_rules = {}
)
{
  include ::nodejs
  create_resources(firewall, $firewall_rules)
}
