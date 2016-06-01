#
# Cookbook Name:: kubernetes-install
# Recipe:: docker
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

template '/etc/network/interfaces.d/docker.cfg' do
  mode '0644'
  source 'etc/network/interfaces.d/docker.cfg.erb'
end

bash 'Allowing for intefaces.d to work correctly' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  echo "source /etc/network/interfaces.d/*.cfg" >> /etc/network/interfaces
  EOH
  not_if 'grep source /etc/network/interfaces '
end

package 'bridge-utils' do
  action :install
end

bash 'Creating temporary Docker bridge' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  if [ -z "$(brctl show | grep docker0)" ]; then
    brctl addbr docker0
  fi
  ip addr add 172.17.42.1/24 dev docker0
  ip link set dev docker0 up
  EOH
  not_if 'ip link show docker0 | grep UP'
end

docker_service 'kubernetes-install' do
  storage_driver 'overlay'
  version '1.8.3'
  action :create
  not_if 'systemctl  | grep docker.service | grep running'
end

docker_service 'kubernetes-install' do
  action :start
  not_if 'systemctl  | grep docker.service | grep running'
end
