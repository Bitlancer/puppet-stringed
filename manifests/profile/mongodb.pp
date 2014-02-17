class stringed::profile::mongodb (
  $firewall_rules = {}
)
{
  include ::mongodb::server
  include ::mongodb::client
  create_resources(firewall, $firewall_rules)
}
