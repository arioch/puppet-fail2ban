# Class: fail2ban::install
#
#
class fail2ban::install {
  $package_deps   = $::fail2ban::package_deps
  $package_ensure = $::fail2ban::package_ensure
  $package_name   = $::fail2ban::package_name

  package { $package_name:
    ensure => $package_ensure;
  }
}
