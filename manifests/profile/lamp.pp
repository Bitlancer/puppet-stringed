class stringed::profile::lamp (
  $firewall_rules = {}
)
{
  include stringed::wrapper::apache_phpfpm
  class { ::mysql::server:
    override_options => hiera_hash('stringed::profile::lamp::mysql_override_options', $override_options)
  }
  create_resources(firewall, $firewall_rules)
}
