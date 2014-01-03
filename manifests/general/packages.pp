class stringed::general::packages {
  # Duplicate what's in base image (less some installed by other modules):
  package { [
               bc,
               bind-utils,
               curl,
               finger,
               git,
               gnupg2,
               man,
               mlocate,
               nano,
#              ntp,
               patch,
#              postfix,
#              puppet,
               rsync,
               screen,
               sudo,
               sysstat,
               telnet,
               unzip,
            ]:
    ensure => latest,
  }
}
