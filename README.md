kube-cleanup
===========

A simple example of a Kubernetes DaemonSet that cleans up old/unused images and containers in your cluster.

Old failed containers / unused images can quickly take up all of the space on cloud instances, sometimes consuming all available space and crashing the node.

A better implementation of this would take into consideration available space, pruning only the oldest unused resources when absolutely necessary, to preserve old container history and logs for sysadmins trying to debug tricky issues. This is **definitely not best practice**. A implementation of a cleanup manager in kubernetes would be ideal.

For now, though, this works on my cluster.

~ paralin

Usage
====

```
kubectl create -f cleanup-daemonset.yaml
```

DaemonSets are a very **very** beta feature and won't be enabled in your
cluster unless you use a very recent build with the feature enabled.
