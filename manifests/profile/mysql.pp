class stringed::profile::mysql (
  $innodb_buffer_pool_size,
  $max_connections
) {
  class { '::mysql::server':
    override_options => { 
      'mysqld' => { 
        'innodb_buffer_pool_size' => $innodb_buffer_pool_size,
        'max_connections' => $max_connections
      }
    }
  }
}
