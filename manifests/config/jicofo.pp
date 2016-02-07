# == Class: jitsi::jicofo

class jitsi::config::jicofo (
  $jicofo_configuration,
) {

  file { '/etc/systemd/system/jicofo.service.d':
    ensure => 'directory',
  }

  file { '/etc/systemd/system/jicofo.service.d/jicofo.conf':
    ensure  => present,
    content => template('jitsi/jicofo.conf.erb'),
    notify  => [ Exec['jitsi-systemctl-daemon-reload'], Service['jicofo'] ],
  }

  Exec['jitsi-systemctl-daemon-reload'] ~>  Service['jicofo']

  file { '/usr/share/jicofo/lib/logging.properties':
    ensure  => present,
    require => Package['jicofo'],
    notify  => Service['jicofo'],
  }->

  file_line {'jicofo-logging':
    ensure => present,
    path   => '/usr/share/jicofo/lib/logging.properties',
    line   => 'java.util.logging.FileHandler.append = true',
    match  => '^java.util.logging.FileHandler.append.*$',
    notify => Service['jicofo'],
  }

  service { 'jicofo':
    ensure => 'running',
  }
}
