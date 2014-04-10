class stringed::profile::openldap (
  $firewall_rules = {}
)
{
  include ::openldap
  create_resources(firewall, $firewall_rules)
}
