# Class: fail2ban::config
#
#
class fail2ban::config {
  $config_dir   = $::fail2ban::config_dir
  $config_file  = $::fail2ban::config_file
  $config_group = $::fail2ban::config_group
  $config_user  = $::fail2ban::config_user
  $daemon_name  = $::fail2ban::daemon_name

  $fail2ban_config = $::operatingsystem ? {
    'Debian'     => 'fail2ban/fail2ban.conf.debian.erb',
    'Ubuntu'     => 'fail2ban/fail2ban.conf.debian.erb',
    'RedHat'     => 'fail2ban/fail2ban.conf.rhel.erb',
    'CentOS'     => 'fail2ban/fail2ban.conf.rhel.erb',
    'Scientific' => 'fail2ban/fail2ban.conf.rhel.erb',
    'OEL'        => 'fail2ban/fail2ban.conf.rhel.erb',
    'Amazon'     => 'fail2ban/fail2ban.conf.rhel.erb',
  }

  $jail_config = $::operatingsystem ? {
    'Debian'     => 'fail2ban/jail.conf.debian.erb',
    'Ubuntu'     => 'fail2ban/jail.conf.debian.erb',
    'RedHat'     => 'fail2ban/jail.conf.rhel.erb',
    'CentOS'     => 'fail2ban/jail.conf.rhel.erb',
    'Scientific' => 'fail2ban/jail.conf.rhel.erb',
    'OEL'        => 'fail2ban/jail.conf.rhel.erb',
    'Amazon'     => 'fail2ban/jail.conf.rhel.erb',
  }

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
      content => template($fail2ban_config);

    "${config_dir}/jail.conf":
      ensure  => present,
      mode    => '0600',
      content => template($jail_config);

    "${config_dir}/action.d":
      ensure => present;

    "${config_dir}/jail.d":
      ensure => present;
  }
}

