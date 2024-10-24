# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include samba::server::service
class samba::server::service (
  Boolean $manage = $samba::server::manage_services,
  Stdlib::Ensure::Service $ensure = $samba::server::ensure_services,
  Boolean $enable = $samba::server::enable_services,
  Array[String[1]] $service_names = $samba::server::service_names,
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
