require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'fail2ban::file' do
  let(:title) { 'fail2ban' }
  let(:node)  { 'fail2ban' }

  rpm_distros = [ 'RedHat', 'CentOS' ]
  deb_distros = [ 'Debian', 'Ubuntu' ]
  all_distros = rpm_distros | deb_distros

  all_distros.each do |os|
    describe "fail2ban::file" do
      let(:facts) { {:operatingsystem => os, :kernel => 'Linux'} }

      let(:title) { '_entry_' }
      let(:params) {
        {
          :log => [ '_log1_', '_log2_' ]
        }
      }

      it do
        should create_fail2ban__jail('_entry_')
      end
    end
  end
end

