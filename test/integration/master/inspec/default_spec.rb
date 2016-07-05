describe directory('/opt/kubernetes') do
  it { should exist }
end

describe file('/opt/kubernetes/server/kubernetes-server-linux-amd64.tar.gz') do
  it { should exist }
end

describe command('/opt/kubernetes/server/bin/kubectl get no -s 192.168.40.10:8080') do
  its('stdout') { should match /node-ubuntu-1510   kubernetes.io\/hostname=node-ubuntu-1510   Ready/ }
end

describe command('/opt/kubernetes/server/bin/kubectl get cs -s 192.168.40.10:8080') do
  its('stdout') { should match /controller-manager   Healthy   ok                   nil/ }
  its('stdout') { should match /scheduler            Healthy   ok                   nil/ }
  its('stdout') { should match /etcd-0               Healthy   {"health": "true"}   nil/ }
end

[ 
  "/opt/kubernetes/server/bin/kube-apiserver",
  "/opt/kubernetes/server/bin/kube-controller-manager",
  "/opt/kubernetes/server/bin/kube-proxy",
  "/opt/kubernetes/server/bin/kube-scheduler",
  "/opt/kubernetes/server/bin/kubectl",
  "/opt/kubernetes/server/bin/kubelet"
].each do |bin|
	describe file(bin) do
	  it { should exist }
	end
end


describe port(6443) do
 it { should be_listening }
 its('protocols') { should eq ['tcp6'] }
end

describe port(8080) do
 it { should be_listening }
 its('protocols') { should eq ['tcp6'] }
end

%w(etcd-etcd docker kube-apiserver kube-controller-manager kube-scheduler kube-proxy).each do |svc|
  describe service(svc) do
    it { should be_running }
  end
end
  
