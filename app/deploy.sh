#!/bin/bash

STORAGE_ACC="hdibloba"
SCRIPTS_CONTAINER="scripts"

az storage container create \
--account-name "hdibloba" \
--name "scripts"

# uploads blob to Azure Blob Storage
# 1 - account
# 2 - container
# 3 - blob
# 4 - local file

function upload-blob {
    az storage blob upload \
    --account-name "$1" \
    --container-name "$2" \
    --name "$3" \
    --file "$4"
}

upload-blob $STORAGE_ACC $SCRIPTS_CONTAINER "select/PROP.hql" "./scripts/select/PROP.hql"
upload-blob $STORAGE_ACC $SCRIPTS_CONTAINER "select/PROP_ENT.hql" "./scripts/select/PROP_ENT.hql"
upload-blob $STORAGE_ACC $SCRIPTS_CONTAINER "select/TOTALS.hql" "./scripts/select/TOTALS.hql"


az group deployment create  \
--resource-group "msq-hdinsight-team-a" \
--template-file "./fetch/arm_template.json" \
--parameters "@./fetch/arm_template_parameters.json"

exit 0