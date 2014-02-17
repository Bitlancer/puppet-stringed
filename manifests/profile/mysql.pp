class stringed::profile::mysql (
  $override_options = {},
  $firewall_rules = {}
)
{
  class { ::mysql::server:
    override_options => hiera_hash('stringed::profile::mysql::override_options', $override_options)
  }
  create_resources(firewall, $firewall_rules)
}
