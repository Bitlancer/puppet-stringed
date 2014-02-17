class stringed::profile::httpd::bare (
  $firewall_rules = {
    '100 allow http and https access' => {
      port => [80, 443],
      proto => tcp,
      action => accept
    }
  }
)
{
  include ::apache
  create_resources(firewall, $firewall_rules)
}
