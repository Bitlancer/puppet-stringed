class stringed::wrapper::apache_phpfpm (
  $listen                  = '127.0.0.1:9000',
  $user                    = 'apache',
  $pm_max_requests         = 500,
  $catch_workers_output    = 'no',
  $php_admin_values        = {},
  $php_values              = {},
  $php_modules             = [],
) {
  include ::apache
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
  include apache::mod::fastcgi
  file { '/etc/httpd/conf.d/10-php-fpm-www.conf':
    ensure => present,
    content => template('stringed/10-php-fpm-www.conf.erb')
  }
  Class['apache::mod::fastcgi'] -> File['/etc/httpd/conf.d/10-php-fpm-www.conf']
  File['/etc/httpd/conf.d/10-php-fpm-www.conf'] ~> Service['httpd']
}
