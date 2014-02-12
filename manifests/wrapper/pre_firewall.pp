class stringed::wrapper::pre_firewall {
  Firewall {
    require => undef,
  }
  $default_rules = {
    '000 accept all icmp' => {
      proto => 'icmp',
      action => 'accept'
    },
    '001 accept all to lo interface' => {
      proto => 'all',
      iniface => 'lo',
      action => 'accept'
    },
    '002 accept related and established' => {
      proto => 'all',
      ctstate => ['RELATED','ESTABLISHED'],
      action => 'accept'
    },
    '003 accept ssh from everywhere' => {
      state => 'NEW',
      proto => 'tcp',
      port => '22',
      action => 'accept'
    }
  }
  create_resources(firewall, hiera_hash('stringed::wrapper::pre_firewall::rules', $default_rules))
}
