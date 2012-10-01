# Class: fail2ban::service
#
#
class fail2ban::service {
  $daemon_enable     = $::fail2ban::daemon_enable
  $daemon_ensure     = $::fail2ban::daemon_ensure
  $daemon_hasrestart = $::fail2ban::daemon_hasrestart
  $daemon_hasstatus  = $::fail2ban::daemon_hasstatus
  $daemon_name       = $::fail2ban::daemon_name

  service { $daemon_name:
    ensure     => $daemon_ensure,
    enable     => $daemon_enable,
    hasrestart => $daemon_hasrestart,
    hasstatus  => $daemon_hasstatus;
  }
}
