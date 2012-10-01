require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'fail2ban' do
  let(:title) { 'fail2ban' }
  let(:node)  { 'fail2ban' }

  rpm_distros = [ 'RedHat', 'CentOS' ]
  deb_distros = [ 'Debian', 'Ubuntu' ]
  all_distros = rpm_distros | deb_distros

  all_distros.each do |os|
    describe "#{os}, w/o parameters" do
      let(:facts) {
        {
          :operatingsystem => os,
          :kernel          => 'Linux'
        }
      }

      it { should create_class('fail2ban') }
      it { should include_class('fail2ban::install') }
      it { should include_class('fail2ban::config') }
 
      it { should contain_file('/etc/fail2ban').with_ensure('directory') }
      it { should contain_package('fail2ban').with_ensure('present') }
      it { should_not raise_error(Puppet::ParseError) }
 
      it do
        should contain_service('fail2ban').with(
          'enable'     => 'true',
          'ensure'     => 'running',
          'hasrestart' => 'true',
          'hasstatus'  => 'true',
        )
      end
    end
  end
end

