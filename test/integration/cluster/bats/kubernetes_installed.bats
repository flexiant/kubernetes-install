#!/usr/bin/env bats

@test "creates kubernetes directory" {
  [ -d "/opt/kubernetes" ]
}

@test "extracts kubernetes package" {
  [ -f "/opt/kubernetes/server/kubernetes-server-linux-amd64.tar.gz" ]
}

@test "kubernetes binaries are installed" {
  [ -f "/opt/kubernetes/server/bin/kube-apiserver" ]
  [ -f "/opt/kubernetes/server/bin/kube-controller-manager" ]
  [ -f "/opt/kubernetes/server/bin/kube-proxy" ]
  [ -f "/opt/kubernetes/server/bin/kube-scheduler" ]
  [ -f "/opt/kubernetes/server/bin/kubectl" ]
  [ -f "/opt/kubernetes/server/bin/kubelet" ]
}

@test "docker binary is found in path" {
  run which docker
  [ "$status" -eq 0 ]
}
