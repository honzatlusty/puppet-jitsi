#jitsi:install
class jitsi::install (
  $media_recording_path = undef,
) {
  $jitsi_packages = [ 'jitsi-videobridge', 'jicofo', 'jitsi-meet' ]
  package { $jitsi_packages: ensure => 'present' }
  if $media_recording_path {
    # Jitsi seems to run as root :(
    file {
      $media_recording_path:
        ensure => directory,
    }
  }
}
