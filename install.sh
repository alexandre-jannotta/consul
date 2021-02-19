#!/usr/bin/env sh

kubectl apply -f namespaces.yaml

kubectl -n paris-consul create configmap scripts --from-file=./config/scripts
kubectl -n paris-consul create configmap certs --from-file=./config/certs

kubectl apply -f paris-consul-servers.yaml
