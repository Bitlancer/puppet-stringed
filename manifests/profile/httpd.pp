class stringed::profile::httpd::bare (
  $firewall_rules = {}
)
{
  include ::apache
  create_resources(firewall, $firewall_rules)
}
