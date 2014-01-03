class stringed::profile::base {
  class { 'resolvconf': } ->
  class { 'stringed::general::repos': } -> 
  class { 'stringed::general::packages': } ->
  class { 'stringed::wrapper::auth': }
  class { 'ntp': }
  class { 'motd': }
  class { 'firewall': }
}
