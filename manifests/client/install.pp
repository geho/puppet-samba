# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include samba::client::install
class samba::client::install (
  Boolean $manage = $samba::client::manage_packages,
  Stdlib::Ensure::Package $ensure = $samba::client::ensure_packages,
  Array[String[1]] $packages = $samba::client::packages,
) {
  if $manage == true {
    package { $packages:
      ensure => $ensure,
    }
  }
}
