source :rubygems

puppetversion = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 2.7']
facterversion = ENV.key?('FACTER_VERSION') ? "= #{ENV['FACTER_VERSION']}" : ['>= 1.6']
gem 'puppet', puppetversion
gem 'facter', facterversion

gem 'rake'
gem 'puppet-lint', '>=0.2.0'
gem 'rspec-puppet', '>=0.1.3'
gem 'puppetlabs_spec_helper', '>=0.2.0'

