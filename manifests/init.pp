# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @param manage_common_packages
#   Enable or disable package management for common samba packages.
# @param manage_client_packages
#   Enable or disable package management for samba client packages.
# @param manage_server_packages
#   Enable or disable package management for samba server packages.
# @param manage_utils_packages
#   Enable or disable package management for samba utility packages.
# @param manage_winbind_packages
#   Enable or disable package management for samba winbind packages.
# @param manage_plugins_packages
#   Enable or disable package management for samba/winbind plugins packages.
# @param manage_config
#   Enable or disable configuration file management.
# @param manage_ad_join
#   Enable or disable AD join.
# @param manage_server_services
#   Enable or disable samba server services management.
# @param manage_winbind_services
#   Enable or disable samba winbind services management.
#
# @param log_output
#   Enable or disable puppet logging output when executing ad join commands.
#
# @param ensure_common_packages
#   Ensure common samba packages are set to defined state (installed, purged, ...).
# @param ensure_client_packages
#   Ensure samba client packages are set to defined state (installed, purged, ...).
# @param ensure_server_packages
#   Ensure samba server packages are set to defined state (installed, purged, ...).
# @param ensure_utils_packages
#   Ensure samba utility packages are set to defined state (installed, purged, ...).
# @param ensure_winbind_packages
#   Ensure samba winbind packages are set to defined state (installed, purged, ...).
# @param ensure_plugins_packages
#   Ensure samba/winbind plugin packages are set to defined state (installed, purged, ...).
# @param common_packages
#   Specify list of common samba packages to be managed.
# @param client_packages
#   Specify list of samba client packages to be managed.
# @param server_packages
#   Specify list of samba server packages to be managed.
# @param utils_packages
#   Specify list of samba utility packages to be managed.
# @param winbind_packages
#   Specify list of samba winbind packages to be managed.
# @param plugins_packages
#   Specify list of samba/winbind plugin packages to be managed.

# @example
#   include samba
class samba (
  #
  # samba role/component selection
  #
  Boolean $client,
  Boolean $server,
  Boolean $winbind,
  #
  # management scope
  #
  Boolean $manage_common_packages,
  Boolean $manage_client_packages,
  Boolean $manage_server_packages,
  Boolean $manage_utils_packages,
  Boolean $manage_winbind_packages,
  Boolean $manage_plugins_packages,
  Boolean $manage_config,
  Boolean $manage_ad_join,
  Boolean $manage_server_services,
  Boolean $manage_winbind_services,
  #
  # puppet log output control
  #
  Boolean $log_output,
  #
  # install / package management
  #
  Stdlib::Ensure::Package $ensure_common_packages,
  Stdlib::Ensure::Package $ensure_client_packages,
  Stdlib::Ensure::Package $ensure_server_packages,
  Stdlib::Ensure::Package $ensure_utils_packages,
  Stdlib::Ensure::Package $ensure_winbind_packages,
  Stdlib::Ensure::Package $ensure_plugins_packages,
  Array[String[1]] $common_packages,
  Array[String[1]] $client_packages,
  Array[String[1]] $server_packages,
  Array[String[1]] $utils_packages,
  Array[String[1]] $winbind_packages,
  Array[String[1]] $plugins_packages,
  #
  # service management
  #
  Stdlib::Ensure::Service $ensure_server_services,
  Stdlib::Ensure::Service $ensure_winbind_services,
  Boolean $enable_server_services,
  Boolean $enable_winbind_services,
  Array[String[1]] $server_service_names,
  Array[String[1]] $winbind_service_names,
  #
  # smb.conf parameters
  # https://www.samba.org/samba/docs/current/man-html/smb.conf.5.html
  #

  Stdlib::Absolutepath $testparm,

  Stdlib::Absolutepath $system_config_directory,
  Stdlib::Absolutepath $system_config_file,
  Stdlib::Absolutepath $config_directory,

  # common config
  Stdlib::Absolutepath $config_file,
  String[1] $security,
  String[1] $workgroup,
  String[1] $passdb_backend,

  # networking config
  Optional[Array[String[1]]] $hosts_allow,
  Optional[Array[String[1]]] $hosts_deny,
  Optional[Stdlib::Yes_no] $hostname_lookups,
  Optional[Array[String[1]]] $interfaces,
  Optional[Stdlib::Yes_no] $bind_interfaces_only,
  Optional[Integer] $keepalive,
  Optional[Array[String[1]]] $socket_options,

  # tls config
  Optional[Stdlib::Yes_no] $tls_enabled,
  Optional[Variant[Stdlib::Absolutepath,String[1]]] $tls_cafile,
  Optional[Variant[Stdlib::Absolutepath,String[1]]] $tls_certfile,
  Optional[Variant[Stdlib::Absolutepath,String[1]]] $tls_crlfile,
  Optional[Variant[Stdlib::Absolutepath,String[1]]] $tls_dh_params_file,
  Optional[Variant[Stdlib::Absolutepath,String[1]]] $tls_keyfile,
  Optional[Array[String[1]]] $tls_priority,
  Optional[Enum['no_check','ca_only','ca_and_name_if_available','ca_and_name','as_strict_as_possible']] $tls_verify_peer,

  # kerberos config
  Optional[Enum['all','strong','legacy']] $kerberos_encryption_types,
  Optional[Enum['secrets only','system keytab','dedicated keytab','secrets and keytab']] $kerberos_method,
  Optional[String[1]] $realm,

  # ldap config
  Optional[Enum['auto','never','finding','searching','always']] $ldap_deref,
  Optional[Stdlib::Yes_no] $ldap_follow_referral,
  Optional[Enum['off','start_tls']] $ldap_ssl,
  Optional[String[1]] $ldap_suffix,
  Optional[String[1]] $ldap_machine_suffix,

  # winbind config
  Optional[Stdlib::Yes_no] $create_krb5_conf,
  Optional[Integer] $idmap_cache_time,
  Optional[Hash[String,Hash[String[1],String[1]]]] $idmap_config,
  Optional[Stdlib::Yes_no] $include_system_krb5_conf,
  Optional[Stdlib::Yes_no] $require_strong_key,
  Optional[String[1]] $template_homedir,
  Optional[String[1]] $template_shell,
  Optional[Stdlib::Yes_no] $winbind_enum_groups,
  Optional[Stdlib::Yes_no] $winbind_enum_users,
  Optional[Stdlib::Yes_no] $winbind_nested_groups,
  Optional[Stdlib::Yes_no] $winbind_normalize_names,
  Optional[String[1]] $winbind_nss_info,
  Optional[Stdlib::Yes_no] $winbind_offline_logon,
  Optional[Stdlib::Yes_no] $winbind_refresh_tickets,

  # client config
  Optional[String[1]] $client_ipc_min_protocol,
  Optional[String[1]] $client_ipc_max_protocol,
  Optional[String[1]] $client_ipc_signing,
  Optional[Enum['plain','sign','seal']] $client_ldap_sasl_wrapping,
  Optional[String[1]] $client_min_protocol,
  Optional[String[1]] $client_max_protocol,
  Optional[Enum['default','plain','sign','encrypt']] $client_protection,
  Optional[Enum['default','desired','required','disabled']] $client_signing,
  Optional[Array[String[1]]] $client_smb3_encryption_algorithms,
  Optional[Enum['default','if_required','desired','required','off']] $client_smb_encrypt,
  Optional[Array[String[1]]] $client_smb3_signing_algorithms,
  Optional[Enum['desired','required','off']] $client_use_kerberos,
  Optional[Stdlib::Yes_no] $client_use_spnego_principal,

  # server config
  Optional[String[1]] $server_string,
  Optional[String[1]] $netbios_name,
  Optional[String[1]] $server_min_protocol,
  Optional[String[1]] $server_max_protocol,
  Optional[String[1]] $server_role,
  Optional[Array[String[1]]] $server_services,
  Optional[Enum['default','auto','mandatory','disabled']] $server_signing,
  Optional[Array[String[1]]] $server_smb3_encryption_algorithms,
  Optional[Array[String[1]]] $server_smb3_signing_algorithms,
  Optional[Enum['Never','Bad User','Bad Password','Bad Uid']] $map_to_guest,

  # global share defaults
  Optional[Array[String[1]]] $vfs_objects,

  # logging config
  Optional[String] $logging,
  Optional[Stdlib::Absolutepath] $log_file,
  Optional[Variant[Integer,Array[String[1]]]] $log_level,
  Optional[Integer] $max_log_size,

  # files and directory config
  Optional[Stdlib::Absolutepath] $binddns_dir,
  Optional[Stdlib::Absolutepath] $cache_directory,
  Optional[Stdlib::Absolutepath] $ctdbd_socket,
  Optional[Stdlib::Absolutepath] $lock_directory,
  Optional[Stdlib::Absolutepath] $ncalrpc_dir,
  Optional[Stdlib::Absolutepath] $ntp_signd_socket_directory,
  Optional[Stdlib::Absolutepath] $pid_directory,
  Optional[Stdlib::Absolutepath] $private_dir,
  Optional[Stdlib::Absolutepath] $root_directory,
  Optional[Stdlib::Absolutepath] $smb_passwd_file,
  Optional[Stdlib::Absolutepath] $state_directory,
  Optional[Stdlib::Absolutepath] $usershare_path,
  Optional[Stdlib::Absolutepath] $utmp_directory,
  Optional[Stdlib::Absolutepath] $winbindd_socket_directory,
  Optional[Stdlib::Absolutepath] $wtmp_directory,

  # additional config
  Optional[Array[String]] $additional_config,

  # shares config
  Optional[Hash] $shares,

  #
  # ad join parameters
  #

  Optional[String[1]] $join_user,
  Optional[String[1]] $join_password,
  Optional[String[1]] $computer_ou,
  Optional[String[1]] $os_name,
  Optional[String[1]] $os_version,
  Optional[String[1]] $os_service_pack,
  Optional[Array[String[1]]] $service_names,
) {
  contain samba::install
  contain samba::config
  contain samba::ad_join

  if $client == true {
    contain samba::client
  }

  if $server == true {
    contain samba::server
  }

  if $winbind == true {
    contain samba::winbind
  }
}
