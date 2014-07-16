class stringed::profile::base {
  include stringed::general::firewall
  include stringed::general::repos
  include stringed::general::packages
  include stringed::general::rackspace
  include stringed::wrapper::auth
  include ::resolvconf
  include ::ntp
  include ::motd
  include ::firewall
  include ::postfix::server
  include ssh::sshd_config
  
  Package <| provider == 'rpm' |> -> Yumrepo <| |> -> Package <| provider != 'rpm' |>
}
