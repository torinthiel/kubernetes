Kuberentes experiments
======================

Some experiments with running kubernetes, etcd and the like.

Probably I'll try to run stuff in 3 distinct ways:

1) Standalone
2) As docker containers
3) Kubelet as 1) or 2) and control plane as static pods

All components configured directly, withoug things like `kubeadm`, with commands mostly taken from
[Kubernetes the hard way](https://github.com/kelseyhightower/kubernetes-the-hard-way).


Prerequisites
-------------

* GNU Make
* OpenSSL

Certificates
------------

Step one is to generated the needed X.509 certificates for all the tools. Go to `certs` subfolder
and type `make`. This should generate X.509 keys and certificates for next steps, namely:

* ca-etcd: The CA for the etcd key hierarchy
* etcd1: key for first etcd node


All the above come with `*.key` and `*.crt` having key and certificate respectively,
as well as some intermediate files.


Downloading binaries
--------------------

Run the supplied `./setup.sh` to download and uncompress the needed binary files.

* etcd and etcdctl

[//]: # ( vim: set tw=100: )
