include_recipe 'kubernetes-cluster::default'

etcd_service 'etcd' do
  service_manager 'systemd'
  action [:create, :start]
end

include_recipe 'kubernetes-install::master'
include_recipe 'export-node::default'
