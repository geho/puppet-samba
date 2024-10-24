# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include samba::install
class samba::install (
  Boolean $manage_common_packages = $samba::manage_common_packages,
  Boolean $manage_utils_packages = $samba::manage_utils_packages,
  Boolean $manage_plugins_packages = $samba::manage_plugins_packages,
  Stdlib::Ensure::Package $ensure_common_packages = $samba::ensure_common_packages,
  Stdlib::Ensure::Package $ensure_utils_packages = $samba::ensure_utils_packages,
  Stdlib::Ensure::Package $ensure_plugins_packages = $samba::ensure_plugins_packages,
  Array[String[1]] $common_packages = $samba::common_packages,
  Array[String[1]] $utils_packages = $samba::utils_packages,
  Array[String[1]] $plugins_packages = $samba::plugins_packages,
) inherits samba {
  contain samba::install::common
  contain samba::install::utils
  contain samba::install::plugins
}
