#jitsi:install
class jitsi::install (
) {
  $jitsi_packages = [ 'jitsi-videobridge', 'jicofo', 'jitsi-meet' ]
  package { $jitsi_packages: ensure => 'present' }
}
