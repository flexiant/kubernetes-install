require 'serverspec'
require 'json'

# Required by serverspec
set :backend, :exec

node = JSON.parse(File.read('/tmp/kitchen/chef_node.json'))
if node['run_list'].include? 'recipe[kubernetes-install::node]'
  describe "Kubernetes node components" do

    it "is listening on kubelet port 10250" do
      expect(port(10250)).to be_listening
    end

    it "is listening on cadvisor port 4194" do
      expect(port(4194)).to be_listening
    end

    it "service etcd is running" do
      expect(service("etcd")).to be_running
    end

    it "service docker is running" do
      expect(service("docker")).to be_running
    end

    it "service kubelet is running" do
      expect(service("kubelet")).to be_running
    end

    it "service kube-proxy is running" do
      expect(service("kube-proxy")).to be_running
    end
  end
end
