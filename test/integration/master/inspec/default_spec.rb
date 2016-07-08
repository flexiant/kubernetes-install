file('/usr/local/bin/hyperkube') do
  it { should exist }
end

describe command('/usr/local/bin/hyperkube kubectl get no -s 192.168.40.10:8080') do
  its('stdout') { should match /node-ubuntu-1510.*Ready/ }
end

describe command('/usr/local/bin/hyperkube kubectl get cs -s 192.168.40.10:8080') do
  its('stdout') { should match /controller-manager\s+Healthy\s+ok/ }
  its('stdout') { should match /scheduler\s+Healthy\s+ok/ }
  its('stdout') { should match /etcd-0\s+Healthy\s+{"health": "true"}/ }
end

describe port(6443) do
 it { should be_listening }
 its('protocols') { should eq ['tcp6'] }
end

describe port(8080) do
 it { should be_listening }
 its('protocols') { should eq ['tcp6'] }
end

%w(etcd-etcd docker-kubernetes-install kube-apiserver kube-controller-manager kube-scheduler kube-proxy).each do |svc|
  describe service(svc) do
    it { should be_running }
  end
end
  
