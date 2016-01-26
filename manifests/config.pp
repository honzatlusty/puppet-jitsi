# Class: jitsi:config

class jitsi::config (
) {
  exec { 'jitsi-systemctl-daemon-reload':
        path        => $::path,
        command     => 'systemctl daemon-reload',
        refreshonly => true,
  }

  include jitsi::config::jitsi_videobridge
  include jitsi::config::jicofo
  include jitsi::config::jitsi_meet

}
