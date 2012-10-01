# Class: fail2ban::config
#
#
class fail2ban::config {
  $config_dir      = $::fail2ban::config_dir
  $config_fail2ban = $::fail2ban::config_fail2ban
  $config_file     = $::fail2ban::config_file
  $config_group    = $::fail2ban::config_group
  $config_jail     = $::fail2ban::config_jail
  $config_user     = $::fail2ban::config_user
  $daemon_name     = $::fail2ban::daemon_name

  File {
    require => Class['fail2ban::install'],
    notify  => Service[$daemon_name],
    owner   => $config_user,
    group   => $config_group,
  }

  file {
    $config_dir:
      ensure  => directory;

    "${config_dir}/fail2ban.conf":
      ensure  => present,
      mode    => '0600',
      content => template($config_fail2ban);

    "${config_dir}/jail.conf":
      ensure  => present,
      mode    => '0600',
      content => template($config_jail);

    "${config_dir}/action.d":
      ensure => present;

    "${config_dir}/jail.d":
      ensure => present;
  }
}

