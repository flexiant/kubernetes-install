default['etcd']['addr'] = '0.0.0.0:4001'
default['etcd']['args'] = '-bind-addr=0.0.0.0:4001'
default['etcd']['url'] = 'https://github.com/coreos/etcd/releases/download/v0.4.6/etcd-v0.4.6-linux-amd64.tar.gz'
default['etcd']['sha256'] = 'b351d05f68d2a8f3fce2d4038f3ecf3408901ac2ec37240ff0043b4c989484f5'

default['kubernetes']['package'] = 'https://github.com/kubernetes/kubernetes/releases/download/v1.1.8/kubernetes.tar.gz'
default['kubernetes']['master_list'] = 'http://192.168.40.10:8080'
default['kubernetes']['nodes'] = ['192.168.40.11']
