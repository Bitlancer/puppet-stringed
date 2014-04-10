class stringed::profile::openldap (
  $firewall_rules = {}
)
{
  include ::openldap
  include ::openldap::server
  create_resources(firewall, $firewall_rules)
}
