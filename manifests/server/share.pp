# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   samba::server::share { 'namevar': }
define samba::server::share (
  Stdlib::Absolutepath $path,
  Stdlib::Absolutepath $config_file = $samba::config::config_file,
  String[1] $share_name = $title,
  Optional[String] $comment = undef,

  # reference another existing share as template to copy parameters from
  Optional[String[1]] $copy = undef,

  # network access config
  Optional[Array[String[1]]] $hosts_allow = undef,
  Optional[Array[String[1]]] $hosts_deny = undef,

  # share access config
  Optional[Stdlib::Yes_no] $access_based_share_enum = undef,
  Optional[Array[String[1]]] $admin_users = undef,
  Optional[Stdlib::Yes_no] $available = undef,
  Optional[Stdlib::Yes_no] $browseable = undef,
  Optional[Stdlib::Yes_no] $guest_ok = undef,
  Optional[Stdlib::Yes_no] $guest_only = undef,
  Optional[Array[String[1]]] $read_list = undef,
  Optional[Stdlib::Yes_no] $read_only = undef,
  Optional[Array[String[1]]] $write_list = undef,
  Optional[Stdlib::Yes_no] $writeable = undef,
  Optional[Array[String[1]]] $valid_users = undef,
  Optional[Array[String[1]]] $invalid_users = undef,

  # file/directory ownership and permissions (modes/masks and acls)
  Optional[Stdlib::Yes_no] $acl_allow_execute_always = undef,
  Optional[Stdlib::Yes_no] $acl_flag_inherited_canonicalization = undef,
  Optional[Stdlib::Yes_no] $acl_group_control = undef,
  Optional[Stdlib::Yes_no] $acl_map_full_control = undef,
  Optional[Stdlib::Yes_no] $map_acl_inherit = undef,
  Optional[Stdlib::Filemode] $create_mask = undef,
  Optional[Stdlib::Filemode] $directory_mask = undef,
  Optional[Stdlib::Filemode] $force_create_mode = undef,
  Optional[Stdlib::Filemode] $force_directory_mode = undef,
  Optional[String] $force_group = undef,
  Optional[String] $force_user = undef,
  Optional[Stdlib::Yes_no] $inherit_acls = undef,
  Optional[Enum['yes','no','windows and unix','unix only']] $inherit_owner = undef,
  Optional[Stdlib::Yes_no] $inherit_permissions = undef,

  # links
  Optional[Stdlib::Yes_no] $follow_symlinks = undef,
  Optional[Stdlib::Yes_no] $wide_links = undef,

  # vfs
  Optional[Array[String[1]]] $vfs_objects = undef,

  # name mangling
  Optional[Stdlib::Yes_no] $case_sensitive = undef,
  Optional[Enum['upper','lower']] $default_case = undef,
  Optional[Stdlib::Yes_no] $preserve_case = undef,
  Optional[Stdlib::Yes_no] $short_preserve_case = undef,

  # hiding files
  Optional[Stdlib::Yes_no] $hide_dot_files = undef,
  Optional[Stdlib::Yes_no] $hide_special_files = undef,

  # locks
  Optional[Stdlib::Yes_no] $locking = undef,
  Optional[Stdlib::Yes_no] $posix_locking = undef,
  Optional[Enum['auto','yes','no']] $strict_locking = undef,
  Optional[Stdlib::Yes_no] $blocking_locks = undef,
  Optional[Stdlib::Yes_no] $oplocks = undef,
  Optional[Stdlib::Yes_no] $kernel_oplocks = undef,
  Optional[Stdlib::Yes_no] $level2_oplocks = undef,

  # dos attributes
  Optional[Stdlib::Yes_no] $store_dos_attributes = undef,

  # additional config
  Optional[Array[String[1]]] $additional_config = undef,
) {
  # The base class must be included first because it is used by parameter defaults
  if ! defined(Class['samba::config']) {
    fail('You must include the samba::config class before using any share resources')
  }
  concat::fragment { "samba_config_share_${name}":
    target  => $config_file,
    content => epp('samba/share.epp', {
        'share_name'                          => $share_name,
        'path'                                => $path,
        'comment'                             => $comment,

        # reference another existing share as template to copy parameters from
        'copy'                                => $copy,

        # network access config
        'hosts_allow'                         => $hosts_allow,
        'hosts_deny'                          => $hosts_deny,

        # share access config
        'access_based_share_enum'             => $access_based_share_enum,
        'admin_users'                         => $admin_users,
        'available'                           => $available,
        'browseable'                          => $browseable,
        'guest_ok'                            => $guest_ok,
        'guest_only'                          => $guest_only,
        'read_list'                           => $read_list,
        'read_only'                           => $read_only,
        'write_list'                          => $write_list,
        'writeable'                           => $writeable,
        'valid_users'                         => $valid_users,
        'invalid_users'                       => $invalid_users,

        # file/directory ownership and permissions (modes/masks and acls)
        'acl_allow_execute_always'            => $acl_allow_execute_always,
        'acl_flag_inherited_canonicalization' => $acl_flag_inherited_canonicalization,
        'acl_group_control'                   => $acl_group_control,
        'acl_map_full_control'                => $acl_map_full_control,
        'map_acl_inherit'                     => $map_acl_inherit,
        'create_mask'                         => $create_mask,
        'directory_mask'                      => $directory_mask,
        'force_create_mode'                   => $force_create_mode,
        'force_directory_mode'                => $force_directory_mode,
        'force_group'                         => $force_group,
        'force_user'                          => $force_user,
        'inherit_acls'                        => $inherit_acls,
        'inherit_owner'                       => $inherit_owner,
        'inherit_permissions'                 => $inherit_permissions,

        # links
        'follow_symlinks'                     => $follow_symlinks,
        'wide_links'                          => $wide_links,

        # vfs
        'vfs_objects'                         => $vfs_objects,

        # name mangling
        'case_sensitive'                      => $case_sensitive,
        'default_case'                        => $default_case,
        'preserve_case'                       => $preserve_case,
        'short_preserve_case'                 => $short_preserve_case,

        # hiding files
        'hide_dot_files'                      => $hide_dot_files,
        'hide_special_files'                  => $hide_special_files,

        # locks
        'locking'                             => $locking,
        'posix_locking'                       => $posix_locking,
        'strict_locking'                      => $strict_locking,
        'blocking_locks'                      => $blocking_locks,
        'oplocks'                             => $oplocks,
        'kernel_oplocks'                      => $kernel_oplocks,
        'level2_oplocks'                      => $level2_oplocks,

        # dos attributes
        'store_dos_attributes'                => $store_dos_attributes,

        # additional config
        'additional_config'                   => $additional_config,
    }),
    order   => '02',
  }
}
