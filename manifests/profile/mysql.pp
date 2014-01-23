class stringed::profile::mysql {
  class { '::mysql::server':
    override_options => { 
      'mysqld' => { 
        'innodb-buffer-pool-size' => $innodb_buffer_pool_size,
        'max-connections' => $max_connections
      }
    }
  }
}
