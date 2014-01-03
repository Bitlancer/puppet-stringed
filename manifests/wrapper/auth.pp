class stringed::wrapper::auth (
  $sssd_config_options = {}
) {
  exec { 'authconfig update':
    command => "/usr/sbin/authconfig --enablesssd --enablemkhomedir --update",
  } ->
  class { 'sssd':
     config_options    => $sssd_config_options,
  } ->
  class { 'sudo': }
}
