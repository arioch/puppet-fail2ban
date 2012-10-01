# Class fail2ban::params
#
#
class fail2ban::params {
  $config_group   = 'root'
  $config_user    = 'root'
  $package_ensure = 'present'
  $daemon_ensure  = 'running'
  $daemon_enable  = true

  case $::operatingsystem {
    'Debian', 'Ubuntu': {
      $config_dir        = '/etc/fail2ban'
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

