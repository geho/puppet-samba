# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include samba::ad_join
class samba::ad_join (
  Boolean $manage = $samba::manage_ad_join,
  Boolean $log_output = $samba::log_output,
  Stdlib::Absolutepath $config_file = $samba::config_file,

  Optional[Enum['secrets only','system keytab','dedicated keytab','secrets and keytab']] $kerberos_method = $samba::kerberos_method,

  Optional[String[1]] $join_user = $samba::join_user,
  Optional[String[1]] $join_password = $samba::join_password,
  Optional[String[1]] $computer_ou = $samba::computer_ou,
  Optional[String[1]] $os_name = $samba::os_name,
  Optional[String[1]] $os_version = $samba::os_version,
  Optional[String[1]] $os_service_pack = $samba::os_service_pack,
  Optional[Array[String[1]]] $service_names = $samba::service_names,
) inherits samba {
  if $manage == true {
    $computer_name = upcase($facts['networking']['hostname'])
    $computer_fqdn = downcase($facts['networking']['fqdn'])
    if $computer_ou {
      $param_computer_ou = " \"createcomputer=${$computer_ou}\""
    } else {
      $param_computer_ou = ''
    }
    if $os_name {
      $param_os_name = " osName=${os_name}"
    } else {
      $param_os_name = " osName=${facts['os']['name']}"
    }
    if $os_version {
      $param_os_version = " osVer=${os_version}"
    } else {
      $param_os_version = " osName=${facts['os']['release']['major']}"
    }
    if $os_version {
      $param_os_service_pack = " osVer=${os_service_pack}"
    } else {
      $param_os_service_pack = " osServicePack=${facts['os']['release']['minor']}"
    }
    $join_env = ["ADJOINPW=${join_password}"]
    $join_cmd = "net ads join -U ${join_user}%\$ADJOINPW -- ${param_os_name}${param_os_version}${param_os_service_pack}${param_computer_ou}"
    $join_chk = 'net ads testjoin'
    exec { 'net ads join':
      path        => ['/usr/sbin', '/usr/bin', '/bin', '/sbin'],
      environment => $join_env,
      command     => $join_cmd,
      unless      => $join_chk,
      logoutput   => $log_output,
      require     => Concat[$config_file],
    }
    if $service_names and $kerberos_method =~ 'keytab' {
      $service_names.each |String $service_name| {
        $setspn_name_cmd = "net ads setspn add -U ${join_user}%\$ADJOINPW ${computer_name} ${service_name}/${computer_name}"
        $setspn_name_chk = "net ads setspn list | grep ${service_name}/${computer_name}"
        $setspn_fqdn_cmd = "net ads setspn add -U ${join_user}%\$ADJOINPW ${computer_name} ${service_name}/${computer_fqdn}"
        $setspn_fqdn_chk = "net ads setspn list | grep ${service_name}/${computer_fqdn}"
        exec { "net ads setspn add ${computer_name} ${service_name}/${computer_name}":
          path        => ['/usr/sbin', '/usr/bin', '/bin', '/sbin'],
          environment => $join_env,
          command     => $setspn_name_cmd,
          unless      => $setspn_name_chk,
          logoutput   => $log_output,
          notify      => Exec['net ads keytab create'],
          require     => Exec['net ads join'],
        }
        exec { "net ads setspn add ${computer_name} ${service_name}/${computer_fqdn}":
          path        => ['/usr/sbin', '/usr/bin', '/bin', '/sbin'],
          environment => $join_env,
          command     => $setspn_fqdn_cmd,
          unless      => $setspn_fqdn_chk,
          logoutput   => $log_output,
          notify      => Exec['net ads keytab create'],
          require     => Exec['net ads join'],
        }
      }
      exec { 'net ads keytab create':
        path        => ['/usr/sbin', '/usr/bin', '/bin', '/sbin'],
        command     => 'net ads keytab create',
        refreshonly => true,
        require     => Exec['net ads join'],
      }
    }
  }
}
