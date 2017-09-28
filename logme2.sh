#! /bin/bash
kubectl logs -n kube-system $(kubectl get pods --all-namespaces=true | awk '/controller-manager/ {print $2}')
