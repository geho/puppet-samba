# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include samba::server::install
class samba::server::install (
  Boolean $manage = $samba::server::manage_packages,
  Stdlib::Ensure::Package $ensure = $samba::server::ensure_packages,
  Array[String[1]] $packages = $samba::server::packages,
) {
  if $manage == true {
    package { $packages:
      ensure => $ensure,
    }
  }
}
