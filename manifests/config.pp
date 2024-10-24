# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include samba::config
class samba::config (
  Boolean $manage = $samba::manage_config,

  Stdlib::Absolutepath $testparm = $samba::testparm,

  Stdlib::Absolutepath $system_config_directory = $samba::system_config_directory,
  Stdlib::Absolutepath $system_config_file = $samba::system_config_file,
  Stdlib::Absolutepath $config_directory = $samba::config_directory,

  # common config
  Stdlib::Absolutepath $config_file = $samba::config_file,
  String[1] $security = $samba::security,
  String[1] $workgroup = $samba::workgroup,
  String[1] $passdb_backend = $samba::passdb_backend,

  # networking config
  Optional[Array[String[1]]] $hosts_allow = $samba::hosts_allow,
  Optional[Array[String[1]]] $hosts_deny = $samba::hosts_deny,
  Optional[Stdlib::Yes_no] $hostname_lookups = $samba::hostname_lookups,
  Optional[Array[String[1]]] $interfaces = $samba::interfaces,
  Optional[Stdlib::Yes_no] $bind_interfaces_only = $samba::bind_interfaces_only,
  Optional[Integer] $keepalive = $samba::keepalive,
  Optional[Array[String[1]]] $socket_options = $samba::socket_options,

  # tls config
  Optional[Stdlib::Yes_no] $tls_enabled = $samba::tls_enabled,
  # paths can be relative (String[1]) to private dir
  Optional[Variant[Stdlib::Absolutepath,String[1]]] $tls_cafile = $samba::tls_cafile,
  Optional[Variant[Stdlib::Absolutepath,String[1]]] $tls_certfile = $samba::tls_certfile,
  Optional[Variant[Stdlib::Absolutepath,String[1]]] $tls_crlfile = $samba::tls_crlfile,
  Optional[Variant[Stdlib::Absolutepath,String[1]]] $tls_dh_params_file = $samba::tls_dh_params_file,
  Optional[Variant[Stdlib::Absolutepath,String[1]]] $tls_keyfile = $samba::tls_keyfile,
  Optional[Array[String[1]]] $tls_priority = $samba::tls_priority,
  Optional[Enum['no_check','ca_only','ca_and_name_if_available','ca_and_name','as_strict_as_possible']] $tls_verify_peer = $samba::tls_verify_peer, # lint:ignore:140chars

  # kerberos config
  Optional[Enum['all','strong','legacy']] $kerberos_encryption_types = $samba::kerberos_encryption_types,
  Optional[Enum['secrets only','system keytab','dedicated keytab','secrets and keytab']] $kerberos_method = $samba::kerberos_method,
  Optional[String[1]] $realm = $samba::realm,

  # ldap config
  Optional[Enum['auto','never','finding','searching','always']] $ldap_deref = $samba::ldap_deref,
  Optional[Stdlib::Yes_no] $ldap_follow_referral = $samba::ldap_follow_referral,
  Optional[Enum['off','start_tls']] $ldap_ssl = $samba::ldap_ssl,
  Optional[String[1]] $ldap_suffix = $samba::ldap_suffix,
  Optional[String[1]] $ldap_machine_suffix = $samba::ldap_machine_suffix,

  # winbind config
  Optional[Stdlib::Yes_no] $create_krb5_conf = $samba::create_krb5_conf,
  Optional[Integer] $idmap_cache_time = $samba::idmap_cache_time,
  Optional[Hash[String,Hash[String[1],String[1]]]] $idmap_config = $samba::idmap_config,
  Optional[Stdlib::Yes_no] $include_system_krb5_conf = $samba::include_system_krb5_conf,
  Optional[Stdlib::Yes_no] $require_strong_key = $samba::require_strong_key,
  Optional[String[1]] $template_homedir = $samba::template_homedir,
  Optional[String[1]] $template_shell = $samba::template_shell,
  Optional[Stdlib::Yes_no] $winbind_enum_groups = $samba::winbind_enum_groups,
  Optional[Stdlib::Yes_no] $winbind_enum_users = $samba::winbind_enum_users,
  Optional[Stdlib::Yes_no] $winbind_nested_groups = $samba::winbind_nested_groups,
  Optional[Stdlib::Yes_no] $winbind_normalize_names = $samba::winbind_normalize_names,
  Optional[String[1]] $winbind_nss_info = $samba::winbind_nss_info,
  Optional[Stdlib::Yes_no] $winbind_offline_logon = $samba::winbind_offline_logon,
  Optional[Stdlib::Yes_no] $winbind_refresh_tickets = $samba::winbind_refresh_tickets,

  # client config
  Optional[String[1]] $client_ipc_min_protocol = $samba::client_ipc_min_protocol,
  Optional[String[1]] $client_ipc_max_protocol = $samba::client_ipc_max_protocol,
  Optional[String[1]] $client_ipc_signing = $samba::client_ipc_signing,
  Optional[Enum['plain','sign','seal']] $client_ldap_sasl_wrapping = $samba::client_ldap_sasl_wrapping,
  Optional[String[1]] $client_min_protocol = $samba::client_min_protocol,
  Optional[String[1]] $client_max_protocol = $samba::client_max_protocol,
  Optional[Enum['default','plain','sign','encrypt']] $client_protection = $samba::client_protection,
  Optional[Enum['default','desired','required','disabled']] $client_signing = $samba::client_signing,
  Optional[Array[String[1]]] $client_smb3_encryption_algorithms = $samba::client_smb3_encryption_algorithms,
  Optional[Enum['default','if_required','desired','required','off']] $client_smb_encrypt = $samba::client_smb_encrypt,
  Optional[Array[String[1]]] $client_smb3_signing_algorithms = $samba::client_smb3_signing_algorithms,
  Optional[Enum['desired','required','off']] $client_use_kerberos = $samba::client_use_kerberos,
  Optional[Stdlib::Yes_no] $client_use_spnego_principal = $samba::client_use_spnego_principal,

  # server config
  Optional[String[1]] $server_string = $samba::server_string,
  Optional[String[1]] $netbios_name = $samba::netbios_name,
  Optional[String[1]] $server_min_protocol = $samba::server_min_protocol,
  Optional[String[1]] $server_max_protocol = $samba::server_max_protocol,
  Optional[String[1]] $server_role = $samba::server_role,
  Optional[Array[String[1]]] $server_services = $samba::server_services,
  Optional[Enum['default','auto','mandatory','disabled']] $server_signing = $samba::server_signing,
  Optional[Array[String[1]]] $server_smb3_encryption_algorithms = $samba::server_smb3_encryption_algorithms,
  Optional[Array[String[1]]] $server_smb3_signing_algorithms = $samba::server_smb3_signing_algorithms,
  Optional[Enum['Never','Bad User','Bad Password','Bad Uid']] $map_to_guest = $samba::map_to_guest,
  Optional[Array[String[1]]] $vfs_objects = $samba::vfs_objects,

  # logging config
  Optional[String] $logging = $samba::logging,
  Optional[Stdlib::Absolutepath] $log_file = $samba::log_file,
  Optional[Variant[Integer,Array[String[1]]]] $log_level = $samba::log_level,
  Optional[Integer] $max_log_size = $samba::max_log_size,

  # additional config
  Optional[Array[String]] $additional_config = $samba::additional_config,

  # shares config
  Optional[Hash] $shares = $samba::shares,
) inherits samba {
  if $manage == true {
    if $system_config_file != $config_file {
      file { $system_config_file:
        ensure   => file,
        owner    => 'root',
        group    => 'root',
        mode     => '0644',
        content  => "# This file is managed by puppet. Do not edit\n[global]\n\tconfig file = ${config_file}\n",
        validate => "${testparm} ${system_config_file}",
        require  => Class['samba::install::common'],
      }
    }
    concat { $config_file:
      ensure       => present,
      owner        => 'root',
      group        => 'root',
      mode         => '0644',
      show_diff    => true,
      validate_cmd => "${testparm} ${config_file}",
    }
    concat::fragment { 'samba_config_global':
      target  => $config_file,
      content => epp('samba/smb.conf.epp', {
          'security'                          => $security,
          'workgroup'                         => $workgroup,
          'passdb_backend'                    => $passdb_backend,
          # networking config
          'hosts_allow'                       => $hosts_allow,
          'hosts_deny'                        => $hosts_deny,
          'hostname_lookups'                  => $hostname_lookups,
          'interfaces'                        => $interfaces,
          'bind_interfaces_only'              => $bind_interfaces_only,
          'keepalive'                         => $keepalive,
          'socket_options'                    => $socket_options,
          # tls config
          'tls_enabled'                       => $tls_enabled,
          'tls_cafile'                        => $tls_cafile,
          'tls_certfile'                      => $tls_certfile,
          'tls_crlfile'                       => $tls_crlfile,
          'tls_dh_params_file'                => $tls_dh_params_file,
          'tls_keyfile'                       => $tls_keyfile,
          'tls_priority'                      => $tls_priority,
          'tls_verify_peer'                   => $tls_verify_peer,
          # kerberos config
          'kerberos_encryption_types'         => $kerberos_encryption_types,
          'kerberos_method'                   => $kerberos_method,
          'realm'                             => $realm,
          # ldap config
          'ldap_deref'                        => $ldap_deref,
          'ldap_follow_referral'              => $ldap_follow_referral,
          'ldap_ssl'                          => $ldap_ssl,
          'ldap_suffix'                       => $ldap_suffix,
          'ldap_machine_suffix'               => $ldap_machine_suffix,
          # winbind config
          'create_krb5_conf'                  => $create_krb5_conf,
          'idmap_cache_time'                  => $idmap_cache_time,
          'idmap_config'                      => $idmap_config,
          'include_system_krb5_conf'          => $include_system_krb5_conf,
          'require_strong_key'                => $require_strong_key,
          'template_homedir'                  => $template_homedir,
          'template_shell'                    => $template_shell,
          'winbind_enum_groups'               => $winbind_enum_groups,
          'winbind_enum_users'                => $winbind_enum_users,
          'winbind_nested_groups'             => $winbind_nested_groups,
          'winbind_normalize_names'           => $winbind_normalize_names,
          'winbind_nss_info'                  => $winbind_nss_info,
          'winbind_offline_logon'             => $winbind_offline_logon,
          'winbind_refresh_tickets'           => $winbind_refresh_tickets,
          # client config
          'client_ipc_min_protocol'           => $client_ipc_min_protocol,
          'client_ipc_max_protocol'           => $client_ipc_max_protocol,
          'client_ipc_signing'                => $client_ipc_signing,
          'client_ldap_sasl_wrapping'         => $client_ldap_sasl_wrapping,
          'client_min_protocol'               => $client_min_protocol,
          'client_max_protocol'               => $client_max_protocol,
          'client_protection'                 => $client_protection,
          'client_signing'                    => $client_signing,
          'client_smb3_encryption_algorithms' => $client_smb3_encryption_algorithms,
          'client_smb_encrypt'                => $client_smb_encrypt,
          'client_smb3_signing_algorithms'    => $client_smb3_signing_algorithms,
          'client_use_kerberos'               => $client_use_kerberos,
          'client_use_spnego_principal'       => $client_use_spnego_principal,
          # server config
          'server_string'                     => $server_string,
          'netbios_name'                      => $netbios_name,
          'server_min_protocol'               => $server_min_protocol,
          'server_max_protocol'               => $server_max_protocol,
          'server_role'                       => $server_role,
          'server_services'                   => $server_services,
          'server_signing'                    => $server_signing,
          'server_smb3_encryption_algorithms' => $server_smb3_encryption_algorithms,
          'server_smb3_signing_algorithms'    => $server_smb3_signing_algorithms,
          'map_to_guest'                      => $map_to_guest,
          # global share defaults
          'vfs_objects'                       => $vfs_objects,
          # logging config
          'logging'                           => $logging,
          'log_file'                          => $log_file,
          'log_level'                         => $log_level,
          'max_log_size'                      => $max_log_size,
          # additional config
          'additional_config'                 => $additional_config,
      }),
      order   => '01',
    }
    if $shares {
      $shares.each |String $share_key, Hash $share_parameters| {
        samba::server::share { $share_key:
          * => $share_parameters,
        }
      }
    }
  }
}
