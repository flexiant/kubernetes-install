require 'serverspec'
require 'json'

# Required by serverspec
set :backend, :exec

node = JSON.parse(File.read('/tmp/kitchen/chef_node.json'))
if node['run_list'].include? 'recipe[kubernetes-cluster::master]'
  describe "Kubernetes master components" do

    it "is listening on insecure kube-apiserver port 8080" do
      expect(port(8080)).to be_listening
    end

    it "is listening on secure kube-apiserver port 6443" do
      expect(port(6443)).to be_listening
    end

    it "service etcd is running" do
      expect(service("etcd")).to be_running
    end

    it "service docker is running" do
      expect(service("docker")).to be_running
    end

    it "service kube-apiserver is running" do
      expect(service("kube-apiserver")).to be_running
    end

    it "service kube-controller-manager is running" do
      expect(service("kube-controller-manager")).to be_running
    end

    it "service kube-scheduler is running" do
      expect(service("kube-scheduler")).to be_running
    end

    it "service kube-proxy is running" do
      expect(service("kube-proxy")).to be_running
    end
  end
end
