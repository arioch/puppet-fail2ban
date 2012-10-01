# Define: fail2ban::file
#
#
define fail2ban::jail (
  $name
) {
  file { "${fail2ban::config_dir}/${name}":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('fail2ban/jail.erb'),
    require => Class['fail2ban::config'],
  }
}

