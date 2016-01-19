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
|-----|------|-------------|---------|
| ['kubernetes']['package'] | String | URL to compressed package | "https://github.com/kubernetes/kubernetes/releases/download/v1.1.1/kubernetes.tar.gz" |
| ['kubernetes']['nodes'] | Array | Array of nodes | [] |
| ['kubernetes']['internal_protocol'] | String | http or https | 'http' |
| ['kubernetes']['apiserver']['params']['address'] | String | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | '0.0.0.0' |
| ['kubernetes']['apiserver']['params']['cloud-provider'] | String | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) |
| ['kubernetes']['apiserver']['params']['cloud-config'] | String | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) |
| ['kubernetes']['apiserver']['params']['insecure_port'] | Integer | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | 8080 |
| ['kubernetes']['apiserver']['params']['secure_port'] | Integer | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | 6443 |
| ['kubernetes']['apiserver']['params']['etcd_servers'] | String | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | 'http://127.0.0.1:4001' |
| ['kubernetes']['apiserver']['params']['logtostderr'] | Boolean | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | true |
| ['kubernetes']['apiserver']['params']['allow_privileged'] | Boolean | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | true |
| ['kubernetes']['apiserver']['params']['kubelet_port'] | Integer | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | 10250 |
| ['kubernetes']['apiserver']['params']['v'] | Integer | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | 100 |
| ['kubernetes']['apiserver']['params']['kubelet_https'] | Boolean | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | true |
| ['kubernetes']['apiserver']['params']['service-cluster-ip-range'] | String | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | '172.30.0.0/16' |
| ['kubernetes']['apiserver']['params']['tls_cert_file'] | String | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) |
| ['kubernetes']['apiserver']['params']['tls_private_key_file'] | String | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) |
| ['kubernetes']['apiserver']['params']['client_ca_file'] | String | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) |
| ['kubernetes']['apiserver']['params']['insecure_port'] | Integer | [See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html) | depends on internal protocol |
| ['kubernetes']['master_list'] | String | Comma separated list of masters |
| ['kubernetes']['kubelet']['params']['address'] | String | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | '0.0.0.0' |
| ['kubernetes']['kubelet']['params']['port'] | Integer | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | 10250 |
| ['kubernetes']['kubelet']['params']['v'] | Integer | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | 100 |
| ['kubernetes']['kubelet']['params']['cadvisor-port'] | Integer | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | 4194 |
| ['kubernetes']['kubelet']['params']['cluster-dns'] | String | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | '172.30.3.1' |
| ['kubernetes']['kubelet']['params']['cluster-domain'] | String | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | 'cluster.local' |
| ['kubernetes']['kubelet']['params']['hostname-override'] | String | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | node["fqdn"] |
| ['kubernetes']['kubelet']['params']['docker_endpoint'] | String | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | 'unix:///var/run/docker.sock' |
| ['kubernetes']['kubelet']['params']['logtostderr'] | Boolean | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | true |
| ['kubernetes']['kubelet']['params']['api_servers'] | String | [See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html) | node['kubernetes']['master_list'] |
| ['kubernetes']['controller']['params']['master'] | String | [See rc params](http://kubernetes.io/v1.1/docs/user-guide/replication-controller.html) | '127.0.0.1:8080' |
| ['kubernetes']['controller']['params']['cloud-provider'] | String | [See rc params](http://kubernetes.io/v1.1/docs/user-guide/replication-controller.html) |
| ['kubernetes']['controller']['params']['cloud-config'] | String | [See rc params](http://kubernetes.io/v1.1/docs/user-guide/replication-controller.html) |
| ['kubernetes']['controller']['params']['v'] | Integer | [See rc params](http://kubernetes.io/v1.1/docs/user-guide/replication-controller.html) | 100 |
| ['kubernetes']['controller']['params']['logtostderr'] | Boolean | [See rc params](http://kubernetes.io/v1.1/docs/user-guide/replication-controller.html) | true |
| ['kubernetes']['scheduler']['params']['master'] | String | [See scheduler params](http://kubernetes.io/v1.1/docs/devel/scheduler.html) | '127.0.0.1:8080' |
| ['kubernetes']['scheduler']['params']['v'] | Integer | [See scheduler params](http://kubernetes.io/v1.1/docs/devel/scheduler.html) | 100 |
| ['kubernetes']['scheduler']['params']['logtostderr'] | Boolean | [See scheduler params](http://kubernetes.io/v1.1/docs/devel/scheduler.html) | true |
| ['kubernetes']['proxy']['params']['master'] | String | [See kube-proxy params](http://kubernetes.io/v1.1/docs/admin/kube-proxy.html) | '127.0.0.1:8080' |
| ['kubernetes']['proxy']['params']['v'] | Integer | [See kube-proxy params](http://kubernetes.io/v1.1/docs/admin/kube-proxy.html) | 100 |
| ['kubernetes']['proxy']['params']['logtostderr'] | Boolean | [See kube-proxy params](http://kubernetes.io/v1.1/docs/admin/kube-proxy.html) | true |
| ['kubernetes']['proxy']['params']['master'] | String | [See kube-proxy params](http://kubernetes.io/v1.1/docs/admin/kube-proxy.html) | node['kubernetes']['master_list'] |


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
