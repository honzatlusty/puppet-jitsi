#jitsi::service
class jitsi::service (
  $jicofo_service_ensure,
  $jitsi_videobridge_service_ensure,

) {
  service {'jicofo':
    ensure => $jicofo_service_ensure,
  }

  service {'jitsi-videobridge':
    ensure => $jitsi_videobridge_service_ensure,
  }

}
