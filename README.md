# kubernetes-install cookbook
The Kubernetes Cookbook install `kubernetes`at master and nodes using `kubernetes-install::master`and `kubernetes-install::node`

## Supported Platforms
This cookbook is intended to be used with Linux using systemd. SysV, Init.d and Upstart are not supported.

This cookbook expose no resources, all configuration is done through attributes.

## Attributes
All attributes referring to parameters of kubernetes binaries can be informed by adding your own arguments to the root attribute.

i.e.:

```
node.kubernetes.kubelet.params['newparam']='value'
```

| Key | Type | Description | Default |
| <tt>['kubernetes']['package']</tt> | String | URL to compressed package | <tt>"https://github.com/kubernetes/kubernetes/releases/download/v1.1.1/kubernetes.tar.gz"</tt> |
| <tt>['kubernetes']['nodes']</tt> | Array | Array of nodes | <tt>[]</tt> |
| <tt>['kubernetes']['internal_protocol']</tt> | String | http or https | <tt>'http'</tt> |
| <tt>['kubernetes']['apiserver']['params']['address']</tt> | String | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | <tt>'0.0.0.0'</tt> |
| <tt>['kubernetes']['apiserver']['params']['cloud-provider']</tt> | String | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) |
| <tt>['kubernetes']['apiserver']['params']['cloud-config']</tt> | String | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) |
| <tt>['kubernetes']['apiserver']['params']['insecure_port']</tt> | Integer | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | <tt>8080</tt> |
| <tt>['kubernetes']['apiserver']['params']['secure_port']</tt> | Integer | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | <tt>6443</tt> |
| <tt>['kubernetes']['apiserver']['params']['etcd_servers']</tt> | String | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | <tt>'http://127.0.0.1:4001'</tt> |
| <tt>['kubernetes']['apiserver']['params']['logtostderr']</tt> | Boolean | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | <tt>true</tt> |
| <tt>['kubernetes']['apiserver']['params']['allow_privileged']</tt> | Boolean | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | <tt>true</tt> |
| <tt>['kubernetes']['apiserver']['params']['kubelet_port']</tt> | Integer | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | <tt>10250</tt> |
| <tt>['kubernetes']['apiserver']['params']['v']</tt> | Integer | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | <tt>100</tt> |
| <tt>['kubernetes']['apiserver']['params']['kubelet_https']</tt> | Boolean | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | <tt>true</tt> |
| <tt>['kubernetes']['apiserver']['params']['service-cluster-ip-range']</tt> | String | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | <tt>'172.30.0.0/16'</tt> |
| <tt>['kubernetes']['apiserver']['params']['tls_cert_file']</tt> | String | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) |
| <tt>['kubernetes']['apiserver']['params']['tls_private_key_file']</tt> | String | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) |
| <tt>['kubernetes']['apiserver']['params']['client_ca_file']</tt> | String | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) |
| <tt>['kubernetes']['apiserver']['params']['insecure_port']</tt> | Integer | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | <tt>depends on internal protocol</tt> |
| <tt>['kubernetes']['master_list']</tt> | String | Comma separated list of masters |
| <tt>['kubernetes']['kubelet']['params']['address']</tt> | String | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | <tt>'0.0.0.0'</tt> |
| <tt>['kubernetes']['kubelet']['params']['port']</tt> | Integer | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | <tt>10250</tt> |
| <tt>['kubernetes']['kubelet']['params']['v']</tt> | Integer | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | <tt>100</tt> |
| <tt>['kubernetes']['kubelet']['params']['cadvisor-port']</tt> | Integer | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | <tt>4194</tt> |
| <tt>['kubernetes']['kubelet']['params']['cluster-dns']</tt> | String | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | <tt>'172.30.3.1'</tt> |
| <tt>['kubernetes']['kubelet']['params']['cluster-domain']</tt> | String | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | <tt>'cluster.local'</tt> |
| <tt>['kubernetes']['kubelet']['params']['hostname-override']</tt> | String | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | <tt>node["fqdn"]</tt> |
| <tt>['kubernetes']['kubelet']['params']['docker_endpoint']</tt> | String | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | <tt>'unix:///var/run/docker.sock'</tt> |
| <tt>['kubernetes']['kubelet']['params']['logtostderr']</tt> | Boolean | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | <tt>true</tt> |
| <tt>['kubernetes']['kubelet']['params']['api_servers']</tt> | String | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | <tt>node['kubernetes']['master_list']</tt> |
| <tt>['kubernetes']['controller']['params']['master']</tt> | String | [See rc params](http://kubernetes.io/v1.1/docs/user-guide/replication-controller.html) | <tt>'127.0.0.1:8080'</tt> |
| <tt>['kubernetes']['controller']['params']['cloud-provider']</tt> | String | [See rc params](http://kubernetes.io/v1.1/docs/user-guide/replication-controller.html) |
| <tt>['kubernetes']['controller']['params']['cloud-config']</tt> | String | [See rc params](http://kubernetes.io/v1.1/docs/user-guide/replication-controller.html) |
| <tt>['kubernetes']['controller']['params']['v']</tt> | Integer | [See rc params](http://kubernetes.io/v1.1/docs/user-guide/replication-controller.html) | <tt>100</tt> |
| <tt>['kubernetes']['controller']['params']['logtostderr']</tt> | Boolean | [See rc params](http://kubernetes.io/v1.1/docs/user-guide/replication-controller.html) | <tt>true</tt> |
| <tt>['kubernetes']['scheduler']['params']['master']</tt> | String | [See scheduler params](http://kubernetes.io/v1.1/docs/devel/scheduler.html) | <tt>'127.0.0.1:8080'</tt> |
| <tt>['kubernetes']['scheduler']['params']['v']</tt> | Integer | [See scheduler params](http://kubernetes.io/v1.1/docs/devel/scheduler.html) | <tt>100</tt> |
| <tt>['kubernetes']['scheduler']['params']['logtostderr']</tt> | Boolean | [See scheduler params](http://kubernetes.io/v1.1/docs/devel/scheduler.html) | <tt>true</tt> |
| <tt>['kubernetes']['proxy']['params']['master']</tt> | String | [See kube-proxy params](http://kubernetes.io/v1.1/docs/admin/kube-proxy.html) | <tt>'127.0.0.1:8080'</tt> |
| <tt>['kubernetes']['proxy']['params']['v']</tt> | Integer | [See kube-proxy params](http://kubernetes.io/v1.1/docs/admin/kube-proxy.html) | <tt>100</tt> |
| <tt>['kubernetes']['proxy']['params']['logtostderr']</tt> | Boolean | [See kube-proxy params](http://kubernetes.io/v1.1/docs/admin/kube-proxy.html) | <tt>true</tt> |
| <tt>['kubernetes']['proxy']['params']['master']</tt> | String | [See kube-proxy params](http://kubernetes.io/v1.1/docs/admin/kube-proxy.html) | <tt>node['kubernetes']['master_list']</tt> |

## Pre-requisites

All nodes must be running docker daemon with a configured overlay network.

* This cookbook has only been tested with `docker` containers.
* This cookbook has only been tested with `weave` overlay network.

## Usage

To create a kubernetes cluster you need one master and at least one node.
Although several masters are supported only clusters with a master node has been tested.


The run-list for the master must include 'kubernetes-install::master', with an override of the parameters that configure the environment.
The attribute `['kubernetes']['nodes']` holds the array of operational nodes. At boot time this attribute should be empty.

The node nodes must include 'kubernetes-install:node' in their run-list. Once the node is operational, update the `['kubernetes']['nodes']` attribute for the master node at the Chef server, so that the node can be registered.

When removing a node node, be sure to also remove the node from the attribute, so the master doesn't try to reconfigure the missing member.

### Cluster management

The kubernetes cluster can be managed using `kubectl` with the only limitation of managing nodes. Although we discourage using `kubectl` to add or remove nodes, if you need to use it you should also update the `['kubernetes']['nodes']` with the array of active nodes.

## Recipes

### kubernetes-install::master
Include `kubernetes-install::master` in your kubernetes master run list and make sure you boot it before the nodes.

* The kubernetes version is determined by the compressed bundle package in `['kubernetes']['package']` attribute.
* Binaries are located at `/opt/kubernetes/server/bin/`.
* Services are created and started for every master binary (`kube-apiserver`, `kube-controller-manager`, `kube-scheduler`, `kube-proxy`).
* Service discovery is managed through a SkyDNS pod.

### kubernetes-install::node
Include `kubernetes-install::node` in your kubernetes nodes run list.

* The kubernetes version is determined by the compressed bundle package in `['kubernetes']['package']` attribute
* Binaries are located at `/opt/kubernetes/server/bin/`
* Services are created and started for every master binary (`kubelet`, `kube-proxy`).
