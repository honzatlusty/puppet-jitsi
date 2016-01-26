# == Class: jitsi::jitsi_meet

class jitsi::config::jitsi_meet (
  $bosh,
  $jitsi_vhost_server_name,

) {
  file { '/usr/share/jitsi-meet/config.js':
    ensure  => present,
    content => template('profile_inuits/jitsi/config.js.erb'),
    notify  => Service['nginx'],
    require => Package['jitsi-meet'],
  }
}
