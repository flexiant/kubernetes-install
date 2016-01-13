# kubernetes-install cookbook
The Kubernetes Cookbook install `kubernetes`at master and slaves using `kubernetes-install::master`and `kubernetes-install::slave`

## Supported Platforms
This cookbook is intended to be used with Linux using systemd. SysV, Init.d and Upstart are not supported.

This cookbook expose no resources, all configuration is done through attributes.

## Attributes
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['kubernetes']['package']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>"https://github.com/kubernetes/kubernetes/releases/download/v1.1.1/kubernetes.tar.gz"</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['nodes']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['internal_protocol']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>'http'</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['address']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>'0.0.0.0'</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['cloud-provider']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['cloud-config']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['insecure_port']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>8080</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['secure_port']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>6443</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['etcd_servers']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>'http://127.0.0.1:4001'</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['logtostderr']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['allow_privileged']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['kubelet_port']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>10250</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['v']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>100</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['kubelet_https']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['service-cluster-ip-range']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>'172.30.0.0/16'</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['tls_cert_file']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['tls_private_key_file']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['client_ca_file']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['apiserver']['params']['insecure_port']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>depends on internal protocol</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['master_list']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>Comma separated list of masters</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['kubelet']['params']['address']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>'0.0.0.0'</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['kubelet']['params']['port']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>10250</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['kubelet']['params']['v']</tt></td>
<td>type</td>
<td>description</td>
<td><tt>100</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['kubelet']['params']['cadvisor-port']</tt></td>
<td>type</td>
<td>description</td>
<td><tt>4194</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['kubelet']['params']['cluster-dns']</tt></td>
<td>type</td>
<td>description</td>
<td><tt>'172.30.3.1'</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['kubelet']['params']['cluster-domain']</tt></td>
<td>type</td>
<td>description</td>
<td><tt>'cluster.local'</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['kubelet']['params']['hostname-override']</tt></td>
<td>type</td>
<td>description</td>
<td><tt>node["fqdn"]</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['kubelet']['params']['docker_endpoint']</tt></td>
<td>type</td>
<td>description</td>
<td><tt>'unix:///var/run/docker.sock'</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['kubelet']['params']['logtostderr']</tt></td>
<td>type</td>
<td>description</td>
<td><tt>true</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['kubelet']['params']['api_servers']</tt></td>
<td>type</td>
<td>description</td>
<td><tt>node['kubernetes']['master_list']</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['controller']['params']['master']</tt></td>
<td>type</td>
<td>description</td>
<td><tt> '127.0.0.1:8080'</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['controller']['params']['cloud-provider']</tt></td>
<td>type</td>
<td>description</td>
<td><tt>nil</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['controller']['params']['cloud-config']</tt></td>
<td>type</td>
<td>description</td>
<td><tt>nil</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['controller']['params']['v']</tt></td>
<td>type</td>
<td>description</td>
<td><tt>100</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['controller']['params']['logtostderr']</tt></td>
<td>type</td>
<td>description</td>
<td><tt>true</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['scheduler']['params']['master']</tt></td>
<td>type</td>
<td>description</td>
<td><tt> '127.0.0.1:8080'</tt></td>
</tr>
<tr>
    <td><tt>['kubernetes']['scheduler']['params']['v']</tt></td>
<td>type</td>
<td>description</td>
<td><tt>100</tt></td>
</tr>
<tr>
    <td><tt>['kubernetes']['scheduler']['params']['logtostderr']</tt></td>
<td>type</td>
<td>description</td>
<td><tt>true</tt></td>
</tr>
<tr>

    <td><tt>['kubernetes']['proxy']['params']['master']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>'127.0.0.1:8080'</tt></td>
  </tr>
  <tr>
    <td><tt>['kubernetes']['proxy']['params']['v']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>100</tt></td>
  </tr>
  <tr>

    <td><tt>['kubernetes']['proxy']['params']['logtostderr']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>

    <td><tt>['kubernetes']['proxy']['params']['master']</tt></td>
    <td>type</td>
    <td>description</td>
    <td><tt>node['kubernetes']['master_list']</tt></td>
  </tr>
  <tr>

    </table>

## Usage

### kubernetes-install::master

Include `kubernetes-install::master` in your kubernetes master run list and make sure you boot it before the nodes.

### kubernetes-install::node

Include `['kubernetes']['master']`  attribute in your kubernetes nodes run list.
