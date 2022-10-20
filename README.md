# Run Spin applications on Elemental

This plan allows you to run Spin application as pods on Elemental by using the (containerd shim built by the runwasi team)[https://github.com/deislabs/containerd-wasm-shims/tree/main/containerd-shim-spin-v1]. 


## Installing

To install, add the following into your target MachineRegistration object. (can be done any time before the first boot of the node)

```
spec:
  config:
    cloud-config:
      write_files:
      - content: |
          {"instructions":[{"name":"spin-shim","image":"ghcr.io/agracey/spin-shim-plan:main"}]}
        path: /var/lib/elemental/agent/plans/spin.plan
        permissions: "0600"
```

Once booted, this will trigger the shim to be installed into the right place. 

You will then need to add the correct runtime configuration to allow pods to be scheduled to it. This yaml can be found at: https://github.com/deislabs/containerd-wasm-shims/blob/main/deployments/workloads/runtime.yaml

## Running workload

A sample workload can be found at: https://github.com/deislabs/containerd-wasm-shims/blob/main/deployments/workloads/workload.yaml 

