#!/bin/sh

set -e

echo start ENTRYPOINT
# Handle auth with service account
if [ -n "${GOOGLE_SERVICE_ACCOUNT}" ]; then
  #echo ${GOOGLE_SERVICE_ACCOUNT} > /service_account.json
  gcloud auth activate-service-account --key-file=/service_account.json
else
  echo "No service account found."
  exit 10
fi

# Prepare kubectl credentials
#if [ -n "${K8S_CLUSTER}" ]; then
#  gcloud container clusters get-credentials ${K8S_CLUSTER}
#else
#  echo "No K8s cluster specified."
#  exit 30
#fi

exec "$@"