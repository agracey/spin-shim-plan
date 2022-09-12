#!/bin/bash

set -x

mkdir -p /var/lib/rancher/k3s/agent/etc/containerd/
cp config.toml.tmpl /var/lib/rancher/k3s/agent/etc/containerd/config.toml.tmpl

cp containerd-shim-spin-v1 /usr/local/bin/containerd-shim-spin-v1
chmod a+x /usr/local/bin/containerd-shim-spin-v1
