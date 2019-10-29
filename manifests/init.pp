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

}
