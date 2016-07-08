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

default['kubernetes']['hyperkube']['url'] = 'https://storage.googleapis.com/kubernetes-release/release/v1.3.0/bin/linux/amd64/hyperkube'
default['kubernetes']['hyperkube']['checksum'] = '12fc7efe414f09e105ccf2abcc94d9a7ebfb5aca3f140d57a28ca37cee0a7fa8'
default['kubernetes']['internal_protocol'] = 'http'
default['kubernetes']['install_docker'] = true

default['kubernetes']['etcd']['service_name'] = 'etcd-etcd'

# API SERVER DEFAULT PARAMS
default['kubernetes']['apiserver']['params']['address'] = '0.0.0.0'
default['kubernetes']['apiserver']['params']['cloud-provider'] = nil
default['kubernetes']['apiserver']['params']['cloud-config'] = nil
default['kubernetes']['apiserver']['params']['insecure_port'] = 8080
default['kubernetes']['apiserver']['params']['secure_port'] = 6443
default['kubernetes']['apiserver']['params']['etcd_servers'] = 'http://127.0.0.1:4001'
default['kubernetes']['apiserver']['params']['logtostderr'] = true
default['kubernetes']['apiserver']['params']['allow_privileged'] = true
default['kubernetes']['apiserver']['params']['kubelet_port'] = 10_250
default['kubernetes']['apiserver']['params']['v'] = 100
default['kubernetes']['apiserver']['params']['kubelet_https'] = true
default['kubernetes']['apiserver']['params']['service-cluster-ip-range'] = '172.30.0.0/16'
default['kubernetes']['apiserver']['params']['tls_cert_file'] = nil
default['kubernetes']['apiserver']['params']['tls_private_key_file'] = nil
default['kubernetes']['apiserver']['params']['client_ca_file'] = nil

# use appropiate port for internal communication based on protocol
internal_port = if default['kubernetes']['internal_protocol'] == 'http'
                  node['kubernetes']['apiserver']['params']['insecure_port']
                else
                  node['kubernetes']['apiserver']['params']['secure_port']
end

# configure masters lists (now that we have defined apisever's port)
if node['kubernetes']['masters']
  masters = node['kubernetes']['masters'].map { |master| "#{default['kubernetes']['internal_protocol']}://#{master}:#{internal_port}" }
  default['kubernetes']['master_list'] = masters.join(',')
else
  # fallback, supose master is our local node
  default['kubernetes']['master_list'] = "#{default['kubernetes']['internal_protocol']}://127.0.0.1:#{internal_port}"
end

# KUBELET DEFAULT PARAMS
default['kubernetes']['kubelet']['params']['address'] = '0.0.0.0'
default['kubernetes']['kubelet']['params']['port'] = 10_250
default['kubernetes']['kubelet']['params']['v'] = 100
default['kubernetes']['kubelet']['params']['cadvisor-port'] = 4194
default['kubernetes']['kubelet']['params']['cluster-dns'] = '172.30.3.1'
default['kubernetes']['kubelet']['params']['cluster-domain'] = 'cluster.local'
default['kubernetes']['kubelet']['params']['hostname-override'] = node['fqdn']
default['kubernetes']['kubelet']['params']['docker_endpoint'] = 'unix:///var/run/docker.sock'
default['kubernetes']['kubelet']['params']['logtostderr'] = true
default['kubernetes']['kubelet']['params']['api_servers'] = -> { node['kubernetes']['master_list'] }

# KUBE CONTROLLER PARAMS
default['kubernetes']['controller']['params']['master'] = '127.0.0.1:8080'
default['kubernetes']['controller']['params']['cloud-provider'] = nil
default['kubernetes']['controller']['params']['cloud-config'] = nil
default['kubernetes']['controller']['params']['v'] = 100
default['kubernetes']['controller']['params']['logtostderr'] = true

# KUBE SCHEDULER PARAMS
default['kubernetes']['scheduler']['params']['master'] = '127.0.0.1:8080'
default['kubernetes']['scheduler']['params']['v'] = 100
default['kubernetes']['scheduler']['params']['logtostderr'] = true

# KUBE PROXY
default['kubernetes']['proxy']['params']['master'] = '127.0.0.1:8080'
default['kubernetes']['proxy']['params']['v'] = 100
default['kubernetes']['proxy']['params']['logtostderr'] = true
default['kubernetes']['proxy']['params']['master'] = -> { node['kubernetes']['master_list'] }
