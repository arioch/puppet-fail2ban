# Class fail2ban::params
#
#
class fail2ban::params {
  $action_template = 'fail2ban/action.erb'
  $config_group    = 'root'
  $config_user     = 'root'
  $daemon_enable   = true
  $daemon_ensure   = 'running'
  $jail_backend    = 'auto'
  $jail_bantime    = '600'
  $jail_findtime   = '600'
  $jail_ignoreip   = '127.0.0.1'
  $jail_maxretry   = '3'
  $jail_template   = 'fail2ban/jail.erb'
  $log_level       = 'info'
  $log_target      = 'SYSLOG'
  $package_ensure  = 'present'

  case $::operatingsystem {
    'Debian', 'Ubuntu': {
      $config_dir        = '/etc/fail2ban'
      $config_dir_action = '/etc/fail2ban/action.d'
      $config_dir_jail   = '/etc/fail2ban/jail.d'
      $config_dir_mode   = '0750'
      $config_fail2ban   = 'fail2ban/fail2ban.conf.debian.erb'
      $config_jail       = 'fail2ban/jail.conf.debian.erb'
      $config_mode       = '0640'
      $daemon_hasrestart = true
      $daemon_hasstatus  = true
      $daemon_name       = 'fail2ban'
      $package_deps      = undef
      $package_name      = 'fail2ban'
      $socket            = '/var/run/fail2ban/fail2ban.sock'
    }

    'RedHat', 'CentOS', 'Fedora', 'Scientific', 'OEL', 'Amazon': {
      $config_dir        = '/etc/fail2ban'
      $config_dir_action = '/etc/fail2ban/action.d'
      $config_dir_jail   = '/etc/fail2ban/jail.d'
      $config_fail2ban   = 'fail2ban/fail2ban.conf.rhel.erb'
      $config_jail       = 'fail2ban/jail.conf.rhel.erb'
      $daemon_hasrestart = true
      $daemon_hasstatus  = true
      $daemon_name       = 'fail2ban'
      $package_deps      = undef
      $package_name      = 'fail2ban'
      $socket            = '/var/run/fail2ban/fail2ban.sock'
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported."
    }
  }
}

