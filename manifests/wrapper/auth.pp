class stringed::wrapper::auth (
  $sssd_config_options = {}
) {

  anchor { 'stringed::wrapper::auth::begin': }
  anchor { 'stringed::wrapper::auth::end': }

  exec { 'authconfig update':
    command => "/usr/sbin/authconfig --enablesssd --enablesssdauth --enablemkhomedir --update",
    unless  => '/bin/egrep "(USEMKHOMEDIR=yes|USESSSD=yes)" /etc/sysconfig/authconfig | wc -l | grep 2',
    require => Anchor['stringed::wrapper::auth::begin'],
  } ->
  class { 'sssd':
     config_options    => $sssd_config_options,
     require => Anchor['stringed::wrapper::auth::begin'],
  } ->
  class { 'sudo':
     before => Anchor['stringed::wrapper::auth::end'],
  }
}
