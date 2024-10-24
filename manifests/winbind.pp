# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include samba::winbind
class samba::winbind (
  Boolean $manage_packages = $samba::manage_winbind_packages,
  Stdlib::Ensure::Package $ensure_packages = $samba::ensure_winbind_packages,
  Array[String[1]] $packages = $samba::winbind_packages,
  Boolean $manage_services = $samba::manage_winbind_services,
  Stdlib::Ensure::Service $ensure_services = $samba::ensure_winbind_services,
  Boolean $enable_services = $samba::enable_winbind_services,
  Array[String[1]] $service_names = $samba::winbind_service_names,
) inherits samba {
  require samba::config
  contain samba::winbind::install
  contain samba::winbind::service
}
