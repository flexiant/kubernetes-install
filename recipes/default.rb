#
# Cookbook Name:: kubernetes-install
# Recipe:: default
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

execute 'systemd_reload_units' do
  action :nothing
  command '/bin/systemctl daemon-reload'
end

remote_file '/usr/local/bin/hyperkube' do
   owner 'root'
   group 'root'
   mode '0744'
   source node['kubernetes']['hyperkube']['url']
   checksum node['kubernetes']['hyperkube']['sha256checksum']
end

docker_installation_binary 'kubernetes-install' do
  version '1.10.3'
  only_if { node['kubernetes']['install_docker'] }
end

docker_service_manager_systemd 'kubernetes-install' do
  storage_driver 'overlay'
  action :start
  only_if { node['kubernetes']['install_docker'] }
end


