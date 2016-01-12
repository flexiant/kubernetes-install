
module KubernetesInstall
  class Kubernetes < ChefCompat::Resource

    property :node_array, Array, default: lazy { default_install_path }, desired_state: false


    def :update_nodes do
        if Dir.exists?('/#{new_resource.install_path}/kubernetes/tmp/hosts/')
          # remove old kubernetes nodes from master
          configured_hosts = ::Dir.entries("/#{new_resource.install_path}/kubernetes/hosts/").reject{|entry| entry == "." || entry == ".."}
          removable_hosts = configured_hosts - new_resource.node_array
          removable_hosts.each do |slave|
            bash "Node #{slave} removal from Kubernetes Cluster" do
              code <<-EOF
              /#{new_resource.install_path}/kubernetes/server/bin/kubectl delete node #{slave}
              /#{new_resource.install_path}/kubernetes/server/bin/kubectl get pods | grep #{slave} | awk \'{ print \"/#{new_resource.install_path}/kubernetes/server/bin/kubectl delete pods \"\$1 }\' | sh
              EOF
            end
            file "/#{new_resource.install_path}/kubernetes/tmp/hosts/#{slave}" do
              action :delete
            end
          end
        end
      end
    end
