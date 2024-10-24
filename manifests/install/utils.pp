# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include samba::install::utils
class samba::install::utils (
  Boolean $manage = $samba::install::manage_utils_packages,
  Stdlib::Ensure::Package $ensure = $samba::install::ensure_utils_packages,
  Array[String[1]] $packages = $samba::install::utils_packages,
) inherits samba::install {
  if $manage == true {
    package { $packages:
      ensure => $ensure,
    }
  }
}
