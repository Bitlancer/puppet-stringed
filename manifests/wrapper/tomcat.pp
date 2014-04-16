class stringed::wrapper::tomcat (
  $contexts = {},
)
{
  include ::tomcat
  create_resources(tomcat::context, $contexts)
}
