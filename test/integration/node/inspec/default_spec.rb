describe port(10_250) do
  it { should be_listening }
end

describe port(4194) do
  it { should be_listening }
end

%w(docker-kubernetes-install kubelet).each do |svc|
  describe service(svc) do
    it { should be_running }
  end
end
