class stringed::wrapper::auth (
  $sssd_config_options = {}
) {
  exec { 'authconfig update':
    command => "/usr/sbin/authconfig --enablesssd --enablemkhomedir --update",
    unless  => '/bin/egrep "(USEMKHOMEDIR=yes|USESSSD=yes)" /etc/sysconfig/authconfig | wc -l | grep 2'
  } ->
  class { 'sssd':
     config_options    => $sssd_config_options,
  } ->
  class { 'sudo': }
}
