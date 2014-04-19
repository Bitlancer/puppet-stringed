class stringed::profile::python (
  $version = 'system',
  $dev = true,
  $virtualenv = true,
  $virtual_envs = {},
  $pip_packages = {},
  $gunicorn = false,
  $gunicorn_vhosts = {},
  $firewall_rules = {}
) {

  class { ::python:
    version => $version,
    dev => $dev,
    virtualenv => $virtualenv,
    gunicorn => $gunicorn
  }
  create_resources(python::virtualenv, hiera_hash('stringed::profile::python::virtual_envs', $virtual_envs))
  create_resources(python::pip, hiera_hash('stringed::profile::python::pip_packages', $pip_packages))
  create_resources(python::gunicorn, hiera_hash('stringed::profile::python::gunicorn_vhosts', $gunicorn_vhosts))
  
  create_resources(firewall, $firewall_rules)
}
