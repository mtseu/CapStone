#!/bin/bash

if [ -z $1 ]; then
    echo "Say v1 or v2"
    exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

VDIR=${DIR}/${1}

key=`az keyvault secret show --vault-name edap-keys --name edap-blob-key1 --output tsv | awk '{ print $6 }'`
az storage container create \
    --account-name "edapblob" \
    --account-key ${key} \
    --name "scripts" \

az storage blob upload \
    --account-name "edapblob" \
    --account-key ${key} \
    --container-name "scripts" \
    --name "hive/add-snapshot_year.hql" \
    --file "${DIR}/add-snapshot_year.hql"

az group deployment create \
    --verbose \
    --resource-group "azure-training-shared" \
    --template-file "${VDIR}/hcad-template.json" \
    --parameters "@${VDIR}/hcad-params.json"