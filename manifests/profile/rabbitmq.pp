class stringed::profile::rabbitmq {
  class { '::erlang':
    epel_enable => true
  } ->
  class { '::rabbitmq':
  }
}
