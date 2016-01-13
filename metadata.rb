name             'kubernetes-install'
maintainer       'Flexiant Ltd.'
maintainer_email 'contact@flexiant.com'
license          'apache2'
description      'Installs/Configures kubernetes'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          IO.read(File.join(File.dirname(__FILE__), 'VERSION')).chomp

supports 'ubuntu', '>= 15.04'

depends "tar"
depends "docker" , '= 1.1.49'

recipe "kubernetes-install::default", "Install and configure Kubernetes"
recipe "kubernetes-install::load_balancer", "Install and configure Load Balancer for Kubernetes"
recipe "kubernetes-install::master", "Install and Configures Kubernetes Master"
recipe "kubernetes-install::node", "Install and Configure Kuberntes Node"
recipe "kubernetes-install::service_discovery", "Install and configure Kubernetes Service Discovery"


# Flexiant Concerto Defaults
attribute "kubernetes/package",
  :display_name => "Url of Kubernetes Package"

attribute "kubernetes/nodes",
  :display_name => "Array of Nodes of Kubernetes",
  :default => []

attribute "kubernetes/cloud-provider",
  :display_name => "Cloud provider. Empty if no provider is used"

attribute "kubernetes/cloud-config",
  :display_name => "Cloud provider configuration file"

attribute 'kubernetes/kubelet/params/cluster_dns',
  :display_name => "Service Discovery Ip Address",
  :default => "172.30.3.1"

attribute "kubernetes/apiserver/params/service-cluster-ip-range",
  :display_name => "Service Cluster Ip Range",
  :default => "172.30.0.0/16"

attribute "kubernetes/kubelet/params/cluster-domain",
  :display_name => "Cluster domain",
  :default => "cluster.local"
