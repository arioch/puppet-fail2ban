# Class fail2ban::params
#
#
class fail2ban::params {
  $config_group   = 'root'
  $config_user    = 'root'
  $daemon_enable  = true
  $daemon_ensure  = 'running'
  $package_ensure = 'present'

  case $::operatingsystem {
    'Debian', 'Ubuntu': {
      $config_dir        = '/etc/fail2ban'
      $config_dir_action = '/etc/fail2ban/action.d'
      $config_dir_jail   = '/etc/fail2ban/jail.d'
      $config_fail2ban   = 'fail2ban/fail2ban.conf.debian.erb'
      $config_jail       = 'fail2ban/jail.conf.debian.erb'
      $daemon_hasrestart = true
      $daemon_hasstatus  = true
      $daemon_name       = 'fail2ban'
      $package_deps      = undef
      $package_name      = 'fail2ban'
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
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported."
    }
  }
}

