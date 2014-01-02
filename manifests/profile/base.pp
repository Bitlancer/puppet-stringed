class stringed::profile::base {
  class { 'stringed::general::repos': }
  class { 'stringed::general::packages': }
  class { 'ntp': }
}
