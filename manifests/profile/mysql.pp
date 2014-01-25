class stringed::profile::mysql {
  class { '::mysql::server':
    override_options => hiera_hash('stringed::profile::mysql::override_options', {})
  }
}
