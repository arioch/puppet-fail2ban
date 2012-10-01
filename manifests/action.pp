# Define: fail2ban::action
#
#
define fail2ban::action (
  $config_dir_action = $::fail2ban::config_dir,
  $config_dir_mode   = $::fail2ban::config_dir_mode,
  $config_group      = $::fail2ban::config_group,
  $config_mode       = $::fail2ban::config_mode,
  $config_user       = $::fail2ban::config_user
) {
  file { "${fail2ban::config_dir_action}/${name}":
    ensure  => present,
    owner   => $config_user,
    group   => $config_group,
    mode    => $config_mode,
    content => template('fail2ban/action.erb'),
    require => Class['fail2ban::config'],
  }
}

