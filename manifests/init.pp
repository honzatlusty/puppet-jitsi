# == Class: jitsi

class jitsi (
  $bosh,
  $jicofo_configuration,
  $jitsi_vhost_server_name,
  $jitsi_videobridge_configuration,
  $jicofo_service_ensure            = $jitsi::params::jicofo_service_ensure,
  $jitsi_videobridge_service_ensure = $jitsi::params::jitsi_videobridge_service_ensure,
  $nat_harvester_local_address      = $jitsi::params::nat_harvester_local_address,
  $nat_harvester_public_address     = $jitsi::params::nat_harvester_local_address,
  $tcp_harvester_port               = $jitsi::params::nat_harvester_public_address,
  $enable_media_recording           = $jitsi::params::enable_media_recording,
  $media_recording_path             = $jitsi::params::media_recording_path,
  $media_recording_token            = $jitsi::params::media_recording_token,
) inherits jitsi::params  {

  class {'jitsi::install':
    media_recording_path => $media_recording_path,
  }
  ->
  class {'jitsi::config':
    bosh                            => $bosh,
    jicofo_configuration            => $jicofo_configuration,
    jitsi_vhost_server_name         => $jitsi_vhost_server_name,
    jitsi_videobridge_configuration => $jitsi_videobridge_configuration,
    nat_harvester_local_address     => $nat_harvester_local_address,
    nat_harvester_public_address    => $nat_harvester_public_address,
    tcp_harvester_port              => $tcp_harvester_port,
    enable_media_recording          => $enable_media_recording,
    media_recording_path            => $media_recording_path,
    media_recording_token           => $media_recording_token,
  }
  ->
  class {'jitsi::service':
    jicofo_service_ensure            => $jicofo_service_ensure,
    jitsi_videobridge_service_ensure => $jitsi_videobridge_service_ensure,
  }

}

