class stringed::general::packages {
  # Duplicate what's in base image (less some installed by other modules):
  #  ntp postfix sudo ldap bc bind-utils curl finger gnupg man mlocate nano vi patch rsync screen sysstat telnet unzip git puppet
  package { [ postfix, sudo, ldap, bc, bind-utils, curl, finger, gnupg, man, mlocate, nano, vi, patch, rsync, screen, sysstat, telnet, unzip, git, puppet ]:
    ensure => latest,
  }
}
