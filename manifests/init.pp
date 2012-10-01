# Class: fail2ban
#
#
class fail2ban (
  $config_dir        = $fail2ban::params::config_dir,
  $config_dir_action = $fail2ban::params::config_dir_action,
  $config_dir_jail   = $fail2ban::params::config_dir_jail,
  $config_fail2ban   = $fail2ban::params::config_fail2ban,
  $config_file       = $fail2ban::params::config_file,
  $config_group      = $fail2ban::params::config_group,
  $config_jail       = $fail2ban::params::config_jail,
  $config_user       = $fail2ban::params::config_user,
  $daemon_enable     = $fail2ban::params::daemon_enable,
  $daemon_ensure     = $fail2ban::params::daemon_ensure,
  $daemon_hasrestart = $fail2ban::params::daemon_hasrestart,
  $daemon_hasstatus  = $fail2ban::params::daemon_hasstatus,
  $daemon_name       = $fail2ban::params::daemon_name,
  $package_deps      = $fail2ban::params::package_deps,
  $package_ensure    = $fail2ban::params::package_ensure,
  $package_name      = $fail2ban::params::package_name,
) inherits fail2ban::params {
  # motd::register{'fail2ban': }

  class { 'fail2ban::install': }
  class { 'fail2ban::config': }
  class { 'fail2ban::service': }

  Class['fail2ban::install'] ->
  Class['fail2ban::config'] ->
  Class['fail2ban::service']
}

