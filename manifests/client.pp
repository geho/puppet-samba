# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include samba::client
class samba::client (
  Boolean $manage_packages = $samba::manage_client_packages,
  Stdlib::Ensure::Package $ensure_packages = $samba::ensure_client_packages,
  Array[String[1]] $packages = $samba::client_packages,
) inherits samba {
  require samba::config
  contain samba::client::install
}
