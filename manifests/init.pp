# Install and run ptp time service
#
# @summary Install and run ptp time service
#
# @example
#   include ptp
class ptp (
  $packages,
  $enabled_services,
  $disabled_services,
)
{

  ensure_packages( $packages, { 'ensure' => 'present'} )

  ensure_resources('service', $disabled_services, { 'ensure' => 'stopped', 'enable' => 'false', })

  ensure_resources('service', $enabled_services, { 'ensure' => 'running', 'enable' => 'true', })

}
