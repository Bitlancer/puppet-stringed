class stringed::profile::phpfpm (
  $pools = {
    'www' => {
      listen  => '127.0.0.1:9000',
      user => 'apache',
      pm_max_requests => 500,
      catch_workers_output => 'no',
      php_admin_values => {},
      php_values => {}
    }
  },
  $php_modules = [],
  $firewall_rules = {}
) {
  
  include ::php::fpm::daemon
  create_resources(php::fpm::conf, hiera_hash('stringed::profile::php-fpm::pools', $pools))
  php::module { $php_modules: } ~> Service['php-fpm']
  
  create_resources(firewall, $firewall_rules)
}
