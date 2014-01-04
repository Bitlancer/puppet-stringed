class stringed::profile::base {
  include stringed::general::repos
  include stringed::general::packages
  include stringed::general::rackspace
  include stringed::wrapper::auth
  include ::resolvconf
  include ::ntp
  include ::motd
  include ::firewall

  Yumrepo['strings'] -> Package<| tag == repo |> -> Package<| tag != repo |>
}
