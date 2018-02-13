#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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
    --file "${DIR}/../add-snapshot_year.hql"

az group deployment create \
    --verbose \
    --resource-group "azure-training-shared" \
    --template-file "${DIR}/hcad-template.json" \
    --parameters "@${DIR}/hcad-params.json"