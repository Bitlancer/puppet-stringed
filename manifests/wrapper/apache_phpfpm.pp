class stringed::wrapper::apache_phpfpm (
  $listen                  = '127.0.0.1:9000',
  $user                    = 'apache',
  $pm_max_requests         = 500,
  $catch_workers_output    = 'no',
  $php_admin_values        = {},
  $php_values              = {},
  $php_modules             = [],
) {

  class { ::apache:
    purge_configs => true
  }

  $apache_listen = hiera_array('stringed::wrapper::apache_phpfpm::apache_listen', ['80'])
  apache::listen { $apache_listen: }

  $apache_name_virtual_hosts = hiera_array('stringed::wrapper::apache_phpfpm::apache_name_virtual_hosts', ['*:80'])
  apache::namevirtualhost { $apache_name_virtual_hosts: }

  # Maybe need to turn this into a create_resources() call
  $apache_mods = hiera_array('stringed::wrapper::apache_phpfpm::apache_modules', ['fastcgi'])
  apache::mod { $apache_mods: }

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

  file { '/etc/httpd/conf.d/php-fpm-www.conf':
    ensure => present,
    content => template('stringed/php-fpm-www.conf.erb'),
    require => Package['mod_fastcgi'],
    subscribe => Service['httpd']
  }

}
