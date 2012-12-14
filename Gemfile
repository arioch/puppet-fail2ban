source :rubygems

puppetversion = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 3.0.1']
facterversion = ENV.key?('FACTER_VERSION') ? "= #{ENV['FACTER_VERSION']}" : ['>= 1.6.16']
gem 'puppet', puppetversion
gem 'facter', facterversion

gem 'rake'
gem 'puppet-lint', '>=0.3.2'
gem 'puppetlabs_spec_helper', '>=0.3.0'
gem 'rspec-core', '>=2.12.2'
gem 'rspec-puppet', '>=0.1.5'

