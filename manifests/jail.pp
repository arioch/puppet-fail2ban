# Define: fail2ban::jail
#
#
define fail2ban::jail (
  $config_dir_jail = $::fail2ban::config_dir,
  $config_dir_mode = $::fail2ban::config_dir_mode,
  $config_group    = $::fail2ban::config_group,
  $config_mode     = $::fail2ban::config_mode,
  $config_user     = $::fail2ban::config_user
) {
  file { "${fail2ban::config_dir_jail}/${name}":
    ensure  => present,
    owner   => $config_user,
    group   => $config_group,
    mode    => $config_mode,
    content => template('fail2ban/jail.erb'),
    require => Class['fail2ban::config'],
  }
}

