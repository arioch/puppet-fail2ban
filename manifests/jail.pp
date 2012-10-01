# Define: fail2ban::jail
#
#
define fail2ban::jail (
  #enabled = false
  #filter  = sasl
  #backend = polling
  #action  = iptables[name=sasl, port=smtp, protocol=tcp]
  #          sendmail-whois[name=sasl, dest=you@example.com]
  #logpath = /var/log/mail.log

  $config_dir_jail = $::fail2ban::config_dir_jail,
  $config_dir_mode = $::fail2ban::config_dir_mode,
  $config_group    = $::fail2ban::config_group,
  $config_mode     = $::fail2ban::config_mode,
  $config_user     = $::fail2ban::config_user,
  $daemon_name     = $::fail2ban::daemon_name,
  $jail_template   = $::fail2ban::jail_template
) {
  file { "${config_dir_jail}/${name}.conf":
    ensure  => present,
    owner   => $config_user,
    group   => $config_group,
    mode    => $config_mode,
    content => template($jail_template),
    require => Class['::fail2ban::config'],
    notify  => Service[$daemon_name],
  }
}

