require 'dockerspec/serverspec'

describe 'My Dockerfile' do
  describe docker_build('.') do
    it { should have_label "maintainer" => 'sbrown@oteemo.com' }

    describe docker_run(described_image) do
      describe file('/opt/nexus/nexus-iq-cli.jar') do
        it {should exist}
      end
      describe command('java -jar /opt/nexus/nexus-iq-cli.jar') do
        its(:stdout) {should contain "[ERROR]"}
      end
    end
  end
end
