class stringed::wrapper::post_firewall {
  $default_rules = {
    '999 drop all' => {
      proto => 'all',
      action => 'drop',
      before => undef
    }
  }
  create_resources(firewall, hiera_hash('stringed::wrapper::post_firewall::rules', $default_rules))
}
