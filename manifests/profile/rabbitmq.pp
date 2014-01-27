class stringed::profile::rabbitmq {
  class { '::erlang':
    epel_enable => true
  }
  include '::rabbitmq'
  Class['erlang'] -> Class['rabbitmq']
}
