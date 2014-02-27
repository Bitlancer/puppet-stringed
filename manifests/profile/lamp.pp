class stringed::profile::lamp (
  $firewall_rules = {}
)
{
  include stringed::wrapper::apache_phpfpm
  include stringed::wrapper::mysql
  create_resources(firewall, $firewall_rules)
}
