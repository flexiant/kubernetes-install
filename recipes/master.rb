#
# Cookbook Name:: kubernetes-install
# Recipe:: master
#
# Copyright:: Copyright (c) 2015 Chef Software, Inc.
# License:: Apache License, Version 2.0
# Authors:  Flexiant Ltd. (contact@flexiant.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe 'kubernetes-install::default'

# define kubernetes master services
%w(kube-apiserver kube-controller-manager kube-scheduler kube-proxy).each do |file|
  template "/etc/default/#{file}" do
    source "etc/default/#{file}.erb"
    owner 'root'
    group 'root'
    mode '0644'
    variables (lazy do
      { iterator: node['kubernetes'] }
    end)
  end

  template "/etc/systemd/system/#{file}.service" do
    source "etc/systemd/system/#{file}.service.erb"
    notifies :run, 'execute[systemd_reload_units]', :immediate
    variables (lazy do
                 { etcd_name: node['kubernetes']['etcd_service_name'] }
               end)
    mode '0644'
  end

  service file do
    action [:enable, :start]
    subscribes :restart, "template[/etc/default/#{file}]"
    subscribes :restart, "template[/etc/systemd/system/#{file}.service]"
  end
end
