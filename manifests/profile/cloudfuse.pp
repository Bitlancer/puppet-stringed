class stringed::profile::cloudfuse (
  $mounts = {}
)
{
  create_resources(cloudfuse::mount, hiera_hash("stringed::profile::cloudfuse::mounts", $mounts))
}
