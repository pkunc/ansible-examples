#! /bin/bash

export NAMESPACE=longhorn-system

for crd in $(kubectl get crd -o jsonpath={.items[*].metadata.name} | tr ' ' '\n' | grep longhorn.io); do
  kubectl -n ${NAMESPACE} get $crd -o yaml | sed "s/\- longhorn.rancher.io//g" | kubectl apply -f -
  kubectl -n ${NAMESPACE} delete $crd --all
  kubectl delete crd/$crd
done
