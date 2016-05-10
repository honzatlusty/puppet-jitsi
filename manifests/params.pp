#jitsi::params
class jitsi::params {
  $jicofo_service_ensure            = 'running'
  $jitsi_videobridge_service_ensure = 'running'
  $nat_harvester_local_address      = undef
  $nat_harvester_public_address     = undef
  $tcp_harvester_port               = undef
  $enable_media_recording           = undef,
  $media_recording_path             = undef,
  $media_recording_token            = undef,
}
