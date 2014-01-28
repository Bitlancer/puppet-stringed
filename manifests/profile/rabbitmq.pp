class stringed::profile::rabbitmq {
  class { '::erlang':
    epel_enable => true
  }
  class { '::rabbitmq':
    package_provider => 'yum',
    package_name => 'rabbitmq-server'
  }
  Class['erlang'] -> Class['rabbitmq']
}
