class stringed::profile::phpfpm (
  $listen                  = '127.0.0.1:9000',
  $user                    = 'apache',
  $pm_max_requests,
  $catch_workers_output,
  $php_admin_values        = {},
  $php_values              = {},
  $php_modules             = [],
) {
  include php::fpm::daemon
  php::fpm::conf { 'www':
    listen                 => $listen,
    user                   => $user,
    pm_max_requests        => $pm_max_requests,
    catch_workers_output   => $catch_workers_output,
    php_admin_value        => $php_admin_values,
    php_value              => $php_values,
    require                => Package['httpd'],
  }
  php::module { $php_modules: }
}
