# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include samba::winbind::install
class samba::winbind::install (
  Boolean $manage = $samba::winbind::manage_packages,
  Stdlib::Ensure::Package $ensure = $samba::winbind::ensure_packages,
  Array[String[1]] $packages = $samba::winbind::packages,
) {
  if $manage == true {
    package { $packages:
      ensure => $ensure,
    }
  }
}
