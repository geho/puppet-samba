# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include samba::winbind::service
class samba::winbind::service (
  Boolean $manage = $samba::winbind::manage_services,
  Stdlib::Ensure::Service $ensure = $samba::winbind::ensure_services,
  Boolean $enable = $samba::winbind::enable_services,
  Array[String[1]] $service_names = $samba::winbind::service_names,
) {
  if $manage == true {
    service { $service_names:
      ensure     => $ensure,
      enable     => $enable,
      hasstatus  => true,
      hasrestart => true,
      subscribe  => Class["${module_name}::config"],
    }
  }
}
