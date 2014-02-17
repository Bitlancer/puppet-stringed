class stringed::profile::rabbitmq (
  $firewall_rules = {}
)
{
  class { '::erlang':
    epel_enable => true
  } ->
  class { '::rabbitmq': }
  create_resources(firewall, $firewall_rules)
}
