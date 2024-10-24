# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include samba::install::plugins
class samba::install::plugins (
  Boolean $manage = $samba::install::manage_plugins_packages,
  Stdlib::Ensure::Package $ensure = $samba::install::ensure_plugins_packages,
  Array[String[1]] $packages = $samba::install::plugins_packages,
) inherits samba::install {
  if $manage == true {
    package { $packages:
      ensure => $ensure,
    }
  }
}
