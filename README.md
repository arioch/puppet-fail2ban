## Basic usage

    # cat site.pp
    node default {
      include fail2ban
    }

## Unit testing

Plain RSpec:

    # rspec

Using bundle:

    # bundle exec rspec

Test against a specific Puppet or Facter version:

    # PUPPET_VERSION=2.7.1  bundle update && bundle exec rspec
    # PUPPET_VERSION=2.7.19 bundle update && bundle exec rspec
    # FACTER_VERSION=1.6.8  bundle update && bundle exec rspec

