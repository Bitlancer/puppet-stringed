class stringed::general::firewall {

  resources { firewall:
    purge => true
  }
  Firewall {
    before  => Class['stringed::wrapper::post_firewall'],
    require => Class['stringed::wrapper::pre_firewall'],
  }
  class { ['stringed::wrapper::pre_firewall', 'stringed::wrapper::post_firewall']: }
  class { ::firewall: }

  create_resources(firewall, hiera_hash('firewall_rules', {}))
}
