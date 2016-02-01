# == Class: jitsi::jitsi_videobridge

class jitsi::config::jitsi_videobridge (
  $nat_harvester_local_address  = undef,
  $nat_harvester_public_address = undef,
  $tcp_harvester_port           = undef,
  $jitsi_videobridge_configuration,
) {

  file { '/root/.sip-communicator':
    ensure => 'directory',
  }

  file { '/root/.sip-communicator/sip-communicator.properties':
    ensure  => present,
    content => template('jitsi/sip-communicator.properties.erb'),
    notify  => [ Exec['jitsi-systemctl-daemon-reload'], Service['jitsi-videobridge'] ],
  }

  file { '/etc/systemd/system/jitsi-videobridge.service.d':
    ensure => 'directory',
  }

  file { '/etc/systemd/system/jitsi-videobridge.service.d/jitsi-videobridge.conf':
    ensure  => present,
    content => template('jitsi/jitsi-videobridge.conf.erb'),
    notify  => [ Exec['jitsi-systemctl-daemon-reload'], Service['jitsi-videobridge'] ],
  }

  file { '/usr/share/jitsi-videobridge/lib/logging.properties':
    ensure  => present,
    require => Package['jitsi-videobridge'],
    notify  => Service['jitsi-videobridge'],
  }->

  file_line {'jitsi-videobridge-logging':
    ensure => present,
    path   => '/usr/share/jitsi-videobridge/lib/logging.properties',
    line   => 'java.util.logging.FileHandler.append = true',
    match  => '^java.util.logging.FileHandler.append.*$',
    notify => Service['jitsi-videobridge'],
  }

  service { 'jitsi-videobridge':
    ensure => 'running',
  }
}
