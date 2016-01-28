#
# Cookbook Name:: kubernetes
# Recipe:: service_discovery
#
# Copyright 2015, Flexiant Ltd.
#
# All rights reserved - Do Not Redistribute
#

::Chef::Resource.send(:include, Kubernetes::Helper)


if node['hostname'].match("master-01$")
  directory "/opt/kubernetes/addons/skydns/" do
    recursive true
    action :create
  end

  template "/opt/kubernetes/addons/skydns/skydns.rc.yaml" do
    source "addons/skydns.rc.yaml.erb"
    mode '0644'
    action :create
  end

  template "/opt/kubernetes/addons/skydns/skydns.svc.yaml" do
    source "addons/skydns.svc.yaml.erb"
    mode '0644'
    action :create
  end

  ruby_block 'Wait for Kubernetes API server' do
    block do
      true until is_port_open?("127.0.0.1","8080",1, 5)
    end
    not_if "/opt/kubernetes/server/bin/kubectl get services --namespace=kube-system kube-dns"
  end

  execute "/opt/kubernetes/server/bin/kubectl create -f /opt/kubernetes/addons/skydns/" do
    sensitive true
    not_if "/opt/kubernetes/server/bin/kubectl get services --namespace=kube-system kube-dns"
  end
end
