class stringed::profile::apache (
  $listen = ['80'],
  $name_virtual_hosts = ['*:80'],
  $modules = [],
  $vhosts = {},
  $firewall_rules = {}
) {

  include ::apache

  apache::listen { $listen: }
  apache::namevirtualhost { $name_virtual_hosts: }
  apache::mod { $modules: }
  create_resources(apache::vhosts, $vhosts)

  create_resources(firewall, $firewall_rules)
}
