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

tar_extract node['kubernetes']['package'] do
  target_dir '/opt'
end

tar_extract '/opt/kubernetes/server/kubernetes-server-linux-amd64.tar.gz' do
  action :extract_local
  retries 3
  target_dir '/opt'
  creates '/opt/kubernetes/server/bin/'
end

cookbook_file '/etc/profile.d/K99-kubernetes.sh' do
  source 'profile.d/kubernetes.sh'
  mode 00755
  action :create
  only_if do
    ::File.directory?('/etc/profile.d/')
  end
end

include_recipe 'kubernetes-install::docker'
