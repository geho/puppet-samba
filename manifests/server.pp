# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include samba::server
class samba::server (
  Boolean $manage_packages = $samba::manage_server_packages,
  Stdlib::Ensure::Package $ensure_packages = $samba::ensure_server_packages,
  Array[String[1]] $packages = $samba::server_packages,
  Boolean $manage_services = $samba::manage_server_services,
  Stdlib::Ensure::Service $ensure_services = $samba::ensure_server_services,
  Boolean $enable_services = $samba::enable_server_services,
  Array[String[1]] $service_names = $samba::server_service_names,
) inherits samba {
  require samba::config
  contain samba::server::install
  contain samba::server::service
}
