class stringed::profile::apache_python (
  firewall_rules = {}
) {
  
  include ::stringed::profile::apache
  include ::stringed::profile::python
  
  create_resources(firewall, $firewall_rules)
}
