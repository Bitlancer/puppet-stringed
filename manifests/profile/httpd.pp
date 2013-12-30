class stringed::profile::httpd (
  $ssl     = false,
  $modules = [
               'auth_basic',
               'authn_file',
               'authz_host',
               'authz_user',
               'mime',
               'negotiation',
               'dir',
               'alias',
               'rewrite',
               'proxy'
             ],
) {
  apache_httpd { 'prefork':
    ssl     => $ssl,
    modules => $modules,
    welcome => false,
  }
}
