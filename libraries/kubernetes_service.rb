module KubernetesInstall
  class Kubernetes < ChefCompat::Resource
    resource_name :kubernetes
    provides :kubernetes
    default_action :create

    property :version, String, default: lazy { default_version }, desired_state: false
    property :source, String, default: lazy { default_source }, desired_state: false
    property :install_path, String, default: lazy { default_install_path }, desired_state: false
    property :node_array, Array, default: lazy { default_install_path }, desired_state: false


    def default_version
      "v1.1.1"
    end

    def default_source
      "https://github.com/kubernetes/kubernetes/releases/download/#{version}/kubernetes.tar.gz"
    end

    def default_install_path
      "/opt"
    end

    action :download do
      tar_extract new_resource.source do
        target_dir '/opt'
      end

      tar_extract "/#{new_resource.install_path}/kubernetes/server/kubernetes-server-linux-amd64.tar.gz" do
        action :extract_local
        retries 3
        target_dir new_resource.install_path
        creates "/#{new_resource.install_path}/kubernetes/server/bin/"
      end

      cookbook_file "/etc/profile.d/K99-kubernetes.sh" do
        source "profile.d/kubernetes.sh"
        mode 00755
        action :create
        only_if {
          ::File.directory?("/etc/profile.d/")
        }
      end
    end

    def :update_nodes do
        #
        # Nodes automatically register into kubernetes cluster if appropriately are configure
        # while removal of nodes does not usually occurr
        #
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

    action :delete do
      directory  new_resource.install_path do
        recursive true
        action :delete
      end
    end
  end
