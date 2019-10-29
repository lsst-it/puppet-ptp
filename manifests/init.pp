# Install and run ptp time service
#
# @summary Install and run ptp time service
#
# @example
#   include ptp
class ptp (
  $packages,
  $services,
)
{

  ensure_packages( $packages, { 'ensure' => 'present'} )

  ensure_resources('service', $services, )

  if $facts['networking']['primary']
  {
    $primary_interface = $facts['networking']['primary']
    file_line { '/etc/sysconfig/ptp4l':
      notify  => Service['ptp4l'],
      line    => "OPTIONS=\"-f /etc/ptp4l.conf -i ${primary_interface}\"",
      match   => '^OPTIONS=',
      replace_all_matches_not_matching_line => true,
    }
  }

}
