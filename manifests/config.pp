# Class: jitsi:config

class jitsi::config (
  $bosh,
  $jicofo_configuration,
  $jitsi_vhost_server_name,
  $jitsi_videobridge_configuration,
  $nat_harvester_local_address  = undef,
  $nat_harvester_public_address = undef,
  $tcp_harvester_port           = undef,
  $enable_media_recording       = undef,
  $media_recording_path         = undef,
  $media_recording_token        = undef,
) {
  exec { 'jitsi-systemctl-daemon-reload':
        path        => $::path,
        command     => 'systemctl daemon-reload',
        refreshonly => true,
  }

  class {'jitsi::config::jitsi_videobridge':
    jitsi_videobridge_configuration => $jitsi_videobridge_configuration,
    nat_harvester_local_address     => $nat_harvester_local_address,
    nat_harvester_public_address    => $nat_harvester_public_address,
    tcp_harvester_port              => $tcp_harvester_port,
  }

  class {'jitsi::config::jicofo':
    jicofo_configuration => $jicofo_configuration,
  }

  class {'jitsi::config::jitsi_meet':
    bosh                    => $bosh,
    jitsi_vhost_server_name => $jitsi_vhost_server_name,
  }

}
