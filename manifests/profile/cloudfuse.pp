class stringed::profile::cloudfuse {
  create_resources(cloudfuse::mount, hiera_hash("stringed::profile::cloudfuse::mounts", {})
}
