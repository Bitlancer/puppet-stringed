class stringed::general::rackspace {
  augeas { "network peerdns setup eth0":
    context => "/files/etc/sysconfig/network-scripts/ifcfg-eth0",
    changes => [
      "set PEERDNS no",
    ],
  }
  augeas { "network peerdns setup eth1":
    context => "/files/etc/sysconfig/network-scripts/ifcfg-eth1",
    changes => [
      "set PEERDNS no",
    ],
  }
}
