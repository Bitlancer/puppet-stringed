class stringed::general::repos {
  package { 'epel-release':
    source => 'https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm',
    ensure => present,
    provider => rpm,
  }
  package { 'puppetlabs-release':
    source => 'http://yum.puppetlabs.com/el/6x/products/x86_64/puppetlabs-release-6-7.noarch.rpm',
    ensure => present,
    provider => rpm,
  }
  package { 'ius-release':
    source => 'http://dl.iuscommunity.org/pub/ius/stable/CentOS/6/x86_64/ius-release-1.0-11.ius.centos6.noarch.rpm',
    ensure => present,
    provider => rpm,
    require => Package['epel-release'],
  }
}
