class stringed::general::firewall {

  # This exists to work around a bug with the firewall module.
  # See bug report at
  # https://github.com/puppetlabs/puppetlabs-firewall/issues/310.
  # Once this issue is resolved this exec call should be removed
  # and purge should be set to true.
  exec { "flush firewall":
    command => "/sbin/iptables -F",
    onlyif => "/bin/grep system-config-firewall /etc/sysconfig/iptables"
  } ->
  resources { firewall:
    purge => false
  }
  Firewall {
    before  => Class['stringed::wrapper::post_firewall'],
    require => Class['stringed::wrapper::pre_firewall'],
  }
  class { ['stringed::wrapper::pre_firewall', 'stringed::wrapper::post_firewall']: }
  class { ::firewall: }

  create_resources(firewall, hiera_hash('firewall_rules', {}))
}
