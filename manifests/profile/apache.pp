class stringed::profile::apache (
  $listen = ['80'],
  $name_virtal_hosts = ['*:80'],
  $modules = [],
  $vhosts = {},
  $firewall_rules = {}
) {
 
  include ::apache
 
  apache::listen { $listen: }
  apache::namevirtualhost { $name_virtual_hosts: }
  create_resources(apache::vhosts, $vhosts)

  create_resources(firewall, $firewall_rules)
}
