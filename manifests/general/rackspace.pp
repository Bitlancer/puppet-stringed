class stringed::general::rackspace {
  augeas { "network peerdns setup eth0":
    context => "/files/etc/sysconfig/network-scripts/ifcfg-eth0",
    incl => "/etc/sysconfig/network-scripts/ifcfg-eth0",
    lens => "Shellvars.lns",
    changes => [
      "set PEERDNS no",
    ],
  }
  augeas { "network peerdns setup eth1":
    context => "/files/etc/sysconfig/network-scripts/ifcfg-eth1",
    incl => "/etc/sysconfig/network-scripts/ifcfg-eth1",
    lens => "Shellvars.lns",
    changes => [
      "set PEERDNS no",
    ],
  }
}
