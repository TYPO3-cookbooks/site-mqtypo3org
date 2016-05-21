control 'rabbitmq-1' do
  title 'RabbitMQ Setup'
  desc '
    Check that slapd is installed and listening to ports
  '
  describe package('rabbitmq-server') do
    it { should be_installed }
  end

  describe service('rabbitmq-server') do
    it { should be_running }
  end

  describe port(5671) do
    it { should be_listening }
    # its('protocols') { should include 'tcp'}
    its('protocols') { should include 'tcp6'}
    its('processes') { should include 'beam.smp' }
  end

  describe port(5672) do
    it { should be_listening }
    # its('protocols') { should include 'tcp'}
    its('protocols') { should include 'tcp6'}
    its('processes') { should include 'beam.smp' }
  end
end
