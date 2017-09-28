#! /bin/bash

if [ $# -ne 1 ]; then
  echo "needs version suffix"
  exit 1
fi

vsuffix=$1

bash build/run.sh make cross KUBE_FASTBUILD=true ARCH=amd64
cd cluster/images/hyperkube/
make VERSION=itowlson-${vsuffix}
docker tag gcr.io/google-containers/hyperkube-amd64:itowlson-${vsuffix} itowlson/hyperkube-amd64:itowlson-${vsuffix}
docker push itowlson/hyperkube-amd64:itowlson-${vsuffix}
cd ../../..
