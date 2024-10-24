# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include samba::install::common
class samba::install::common (
  Boolean $manage = $samba::install::manage_common_packages,
  Stdlib::Ensure::Package $ensure = $samba::install::ensure_common_packages,
  Array[String[1]] $packages = $samba::install::common_packages,
) inherits samba::install {
  if $manage == true {
    package { $packages:
      ensure => $ensure,
    }
  }
}
