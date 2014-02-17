class stringed::profile::apache_phpfpm (
  $firewall_rules = {
    '100 allow http and https access' => {
      port => [80, 443],
      proto => tcp,
      action => accept
    }
  }
)
{
  include stringed::wrapper::apache_phpfpm
  create_resources(firewall, $firewall_rules)
}
