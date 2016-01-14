# kubernetes-install cookbook
The Kubernetes Cookbook install `kubernetes`at master and slaves using `kubernetes-install::master`and `kubernetes-install::slave`

## Supported Platforms
This cookbook is intended to be used with Linux using systemd. SysV, Init.d and Upstart are not supported.

This cookbook expose no resources, all configuration is done through attributes.

## Attributes
All attributes referring to parameters of kubernetes binaries can be informed by adding your own arguments to the root attribute.

i.e.:

```
node.kubernetes.kubelet.params['newparam']='value'
```

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['kubernetes']['package']</tt></td>
    <td>String</td>
    <td>URL to compressed package</td>
    <td><tt>"https://github.com/kubernetes/kubernetes/releases/download/v1.1.1/kubernetes.tar.gz"</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['nodes']</tt></td>
    <td>Array</td>
    <td>Array of nodes</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['internal_protocol']</tt></td>
    <td>String</td>
    <td>http or https</td>
    <td><tt>'http'</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['address']</tt></td>
    <td>String</td>
    <td><a href='http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html'>See apiserver params</a></td>
    <td><tt>'0.0.0.0'</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['cloud-provider']</tt></td>
    <td>String</td>
    <td>[See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html)</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['cloud-config']</tt></td>
    <td>String</td>
    <td>[See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html)</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['insecure_port']</tt></td>
    <td>Integer</td>
    <td>[See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html)</td>
    <td><tt>8080</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['secure_port']</tt></td>
    <td>Integer</td>
    <td>[See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html)</td>
    <td><tt>6443</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['etcd_servers']</tt></td>
    <td>String</td>
    <td>[See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html)</td>
    <td><tt>'http://127.0.0.1:4001'</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['logtostderr']</tt></td>
    <td>Boolean</td>
    <td>[See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html)</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['allow_privileged']</tt></td>
    <td>Boolean</td>
    <td>[See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html)</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['kubelet_port']</tt></td>
    <td>Integer</td>
    <td>[See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html)</td>
    <td><tt>10250</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['v']</tt></td>
    <td>Integer</td>
    <td>[See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html)</td>
    <td><tt>100</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['kubelet_https']</tt></td>
    <td>Boolean</td>
    <td>[See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html)</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['service-cluster-ip-range']</tt></td>
    <td>String</td>
    <td>[See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html)</td>
    <td><tt>'172.30.0.0/16'</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['tls_cert_file']</tt></td>
    <td>String</td>
    <td>[See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html)</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['tls_private_key_file']</tt></td>
    <td>String</td>
    <td>[See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html)</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['client_ca_file']</tt></td>
    <td>String</td>
    <td>[See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html)</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['insecure_port']</tt></td>
    <td>Integer</td>
    <td>[See apiserver params](http://kubernetes.io/v1.1/docs/admin/kube-apiserver.html)</td>
    <td><tt>depends on internal protocol</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['master_list']</tt></td>
    <td>String</td>
    <td>Comma separated list of masters</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['kubelet']['params']['address']</tt></td>
    <td>String</td>
    <td>[See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html)</td>
    <td><tt>'0.0.0.0'</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['kubelet']['params']['port']</tt></td>
    <td>Integer</td>
    <td>[See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html)</td>
    <td><tt>10250</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['kubelet']['params']['v']</tt></td>
<td>Integer</td>
<td>[See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html)</td>
<td><tt>100</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['kubelet']['params']['cadvisor-port']</tt></td>
<td>Integer</td>
<td>[See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html)</td>
<td><tt>4194</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['kubelet']['params']['cluster-dns']</tt></td>
<td>String</td>
<td>[See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html)</td>
<td><tt>'172.30.3.1'</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['kubelet']['params']['cluster-domain']</tt></td>
<td>String</td>
<td>[See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html)</td>
<td><tt>'cluster.local'</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['kubelet']['params']['hostname-override']</tt></td>
<td>String</td>
<td>[See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html)</td>
<td><tt>node["fqdn"]</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['kubelet']['params']['docker_endpoint']</tt></td>
<td>String</td>
<td>[See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html)</td>
<td><tt>'unix:///var/run/docker.sock'</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['kubelet']['params']['logtostderr']</tt></td>
<td>Boolean</td>
<td>[See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html)</td>
<td><tt>true</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['kubelet']['params']['api_servers']</tt></td>
<td>String</td>
<td>[See kubelet params](http://kubernetes.io/v1.1/docs/admin/kubelet.html)</td>
<td><tt>node['kubernetes']['master_list']</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['controller']['params']['master']</tt></td>
<td>String</td>
<td>[See rc params](http://kubernetes.io/v1.1/docs/user-guide/replication-controller.html)</td>
<td><tt> '127.0.0.1:8080'</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['controller']['params']['cloud-provider']</tt></td>
<td>String</td>
<td>[See rc params](http://kubernetes.io/v1.1/docs/user-guide/replication-controller.html)</td>
<td><tt></tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['controller']['params']['cloud-config']</tt></td>
<td>String</td>
<td>[See rc params](http://kubernetes.io/v1.1/docs/user-guide/replication-controller.html)</td>
<td><tt></tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['controller']['params']['v']</tt></td>
<td>Integer</td>
<td>[See rc params](http://kubernetes.io/v1.1/docs/user-guide/replication-controller.html)</td>
<td><tt>100</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['controller']['params']['logtostderr']</tt></td>
<td>Boolean</td>
<td>[See rc params](http://kubernetes.io/v1.1/docs/user-guide/replication-controller.html)</td>
<td><tt>true</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['scheduler']['params']['master']</tt></td>
<td>String</td>
<td>[See scheduler params](http://kubernetes.io/v1.1/docs/devel/scheduler.html)</td>
<td><tt> '127.0.0.1:8080'</tt></td>
</tr>
<tr>
    <td><tt>['kubernetes']['scheduler']['params']['v']</tt></td>
<td>Integer</td>
<td>[See scheduler params](http://kubernetes.io/v1.1/docs/devel/scheduler.html)</td>
<td><tt>100</tt></td>
</tr>
<tr>
    <td><tt>['kubernetes']['scheduler']['params']['logtostderr']</tt></td>
<td>Boolean</td>
<td>[See scheduler params](http://kubernetes.io/v1.1/docs/devel/scheduler.html)</td>
<td><tt>true</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['proxy']['params']['master']</tt></td>
    <td>String</td>
    <td>[See kube-proxy params](http://kubernetes.io/v1.1/docs/admin/kube-proxy.html)</td>
    <td><tt>'127.0.0.1:8080'</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['proxy']['params']['v']</tt></td>
    <td>Integer</td>
    <td>[See kube-proxy params](http://kubernetes.io/v1.1/docs/admin/kube-proxy.html)</td>
    <td><tt>100</tt></td>
  </tr>
  <tr>

    <td><tt>['kubernetes']['proxy']['params']['logtostderr']</tt></td>
    <td>Boolean</td>
    <td>[See kube-proxy params](http://kubernetes.io/v1.1/docs/admin/kube-proxy.html)</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>

    <td><tt>['kubernetes']['proxy']['params']['master']</tt></td>
    <td>String</td>
    <td>[See kube-proxy params](http://kubernetes.io/v1.1/docs/admin/kube-proxy.html)</td>
    <td><tt>node['kubernetes']['master_list']</tt></td>
  </tr>
  <tr>

    </table>

## Pre-requisites

All nodes must be running docker daemon with a configured overlay network.

* This cookbook has only been tested with `docker` containers.
* This cookbook has only been tested with `weave` overlay network.

## Usage

To create a kubernetes cluster you need one master and at least one slave.
Although several masters are supported only clusters with a master node has been tested.


The run-list for the master must include 'kubernetes-install::master', with an override of the parameters that configure the environment.
The attribute `['kubernetes']['nodes']` holds the array of operational slaves. At boot time this attribute should be empty.

The slave nodes must include 'kubernetes-install:node' in their run-list. Once the node is operational, update the `['kubernetes']['nodes']` attribute for the master node at the Chef server, so that the node can be registered.

When removing a slave node, be sure to also remove the node from the attribute, so the master doesn't try to reconfigure the missing member.

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
