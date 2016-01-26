# == Class: jitsi

class jitsi (
  $bosh,
  $jicofo_configuration,
  $jitsi_vhost_server_name,
  $jitsi_videobridge_configuration,
  $nat_harvester_local_address  = undef,
  $nat_harvester_public_address = undef,
  $tcp_harvester_port           = undef,
) {

  class {'jitsi::install':}
  ->
  class {'jitsi:config':
    bosh                            => $bosh,
    jicofo_configuration            => $jicofo_configuration,
    jitsi_vhost_server_name         => $jitsi_vhost_server_name,
    jitsi_videobridge_configuration => $jitsi_videobridge_configuration,
    nat_harvester_local_address     => $nat_harvester_local_address,
    nat_harvester_public_address    => $nat_harvester_public_address,
    tcp_harvester_port              => $tcp_harvester_port,
  }

}

