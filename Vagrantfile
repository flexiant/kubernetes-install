# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'.freeze

NUM_KUBERNETES_NODES = 2

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Master server
  config.vm.define 'master' do |server|
    server.vm.hostname = 'kubernetes-master-01'
    server.vm.box = 'ubuntu/wily64'
    server.vm.network :public_network
    server.vm.network :private_network, ip: '192.168.40.10'
    server.vm.provision :chef_solo do |chef|
      chef.json = {
        etcd: {
          addr: '0.0.0.0:4001',
          args: '-bind-addr=0.0.0.0:4001',
          url: 'https://github.com/coreos/etcd/releases/download/v0.4.6/etcd-v0.4.6-linux-amd64.tar.gz',
          sha256: 'b351d05f68d2a8f3fce2d4038f3ecf3408901ac2ec37240ff0043b4c989484f5'
        },
        kubernetes: {
          nodes: (1..NUM_KUBERNETES_NODES).map { |i| "192.168.40.1#{i}" }
        }
      }
      chef.run_list = [
        'recipe[etcd]',
        'recipe[kubernetes-install::master]'
      ]
      # chef.log_level = :debug
    end
  end

  # Node servers
  (1..NUM_KUBERNETES_NODES).each do |i|
    config.vm.define "node-#{i}" do |server|
      server.vm.hostname = "kubernetes-node-#{'%02d' % i}"
      server.vm.box = 'ubuntu/wily64'
      server.vm.network :private_network, ip: "192.168.40.1#{i}"
      server.vm.provision :chef_solo do |chef|
        chef.json = {
          etcd: {
            addr: '0.0.0.0:4001',
            args: '-bind-addr=0.0.0.0:4001',
            url: 'https://github.com/coreos/etcd/releases/download/v0.4.6/etcd-v0.4.6-linux-amd64.tar.gz',
            sha256: 'b351d05f68d2a8f3fce2d4038f3ecf3408901ac2ec37240ff0043b4c989484f5'
          },
          kubernetes: {
            masters: ['192.168.40.10']
          }
        }
        chef.run_list = [
          'recipe[etcd]',
          'recipe[kubernetes-install::node]'
        ]
        # chef.log_level = :debug
      end
    end
  end

  # Set the version of chef to install using the vagrant-omnibus plugin
  # NOTE: You will need to install the vagrant-omnibus plugin:
  #
  #   $ vagrant plugin install vagrant-omnibus
  #
  if Vagrant.has_plugin?('vagrant-omnibus')
    config.omnibus.chef_version = 'latest'
  end

  # The path to the Berksfile to use with Vagrant Berkshelf
  # config.berkshelf.berksfile_path = "./Berksfile"

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = true

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []
end
