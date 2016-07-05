require_relative '../../spec_helper'

describe 'kubernetes-install::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    before do
      stub_command("grep source /etc/network/interfaces ").and_return(0)
      stub_command("ip link show docker0 | grep UP").and_return(0)
      stub_command("systemctl  | grep docker.service | grep running").and_return(0)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
