#!/bin/bash

STORAGE_ACC="hdibloba"
SCRIPTS_CONTAINER="scripts"
RESOURCE_GROUP="msq-hdinsight-team-a"
DEPLOYMENT=CapStoneTeamADeployment

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

# extracts parameters from file which are used by the template
# 1 - template file
# 2 - global params file
# 3 - result params file
function parameters {
    tparams=$(jq '.parameters | to_entries[] | .key ' "$1")
    echo '{' > "$3"
    echo "\"\$schema\":$(jq '."$schema"' "$2")," >> "$3"
    echo "\"contentVersion\":$(jq '.contentVersion' "$2")," >> "$3"
    echo '"parameters":{' >> "$3"
    comma=""
    for p in $tparams; do 
        echo $comma >> "$3"
        query=".parameters.$p";
        v=`jq "$query" "$2"`;
        echo "${p}:${v}" >> "$3";
        comma=","
    done
    echo '}' >> "$3"
    echo '}' >> "$3"
    echo "$3"
}

# deploy a particular component
# 1 - template file
# 2 - global params file
function deploy {
    pars=$(mktemp)
    echo "Deploying the following template: ${1}" 1>&2

    az group deployment create \
    --resource-group "$RESOURCE_GROUP" \
    --template-file "$1" \
    --name "$DEPLOYMENT" \
    --output tsv \
    --parameters "@$(parameters $1 $2 $pars)"

    rm $pars
}

if [ ! -z $1 ]; then
    deploy $1 "./cap-stone-adf2-params.json"
    exit 0;
fi

# deploy the data factory itslef 
deploy "./cap-stone-adf2.json"                       "./cap-stone-adf2-params.json"

# deploy common stuff 
deploy "./common/adls-conn.json"                     "./cap-stone-adf2-params.json"
deploy "./common/hdi-blob-conn.json"                 "./cap-stone-adf2-params.json"
deploy "./common/hdi-stnd-conn.json"                 "./cap-stone-adf2-params.json"
deploy "./common/hdi-dmnd-conn.json"                 "./cap-stone-adf2-params.json"

# deploy ingestion pipelines with prerequisites``
# connections:
deploy "./fetch/connections/hcad-sql-conn.json"      "./cap-stone-adf2-params.json"
deploy "./fetch/connections/tcad-blob-conn.json"     "./cap-stone-adf2-params.json"
# datasets:
deploy "./fetch/datasets/tcad/tcad-ext-dataset.json" "./cap-stone-adf2-params.json"
deploy "./fetch/datasets/hcad/hcad-ext-dataset.json" "./cap-stone-adf2-params.json"
deploy "./fetch/datasets/raw-avro-dataset.json"      "./cap-stone-adf2-params.json"
deploy "./fetch/datasets/raw-bin-dataset.json"       "./cap-stone-adf2-params.json"
# pipelines:
deploy "./fetch/pipelines/fetch-hcad-data.json"      "./cap-stone-adf2-params.json"
deploy "./fetch/pipelines/fetch-tcad-data.json"      "./cap-stone-adf2-params.json"

# deploy selector
deploy "./select/pipelines/select-tcad-data.json"    "./cap-stone-adf2-params.json"

#upload-blob $STORAGE_ACC $SCRIPTS_CONTAINER "select/PROP.hql" "./scripts/select/PROP.hql"
#upload-blob $STORAGE_ACC $SCRIPTS_CONTAINER "select/PROP_ENT.hql" "./scripts/select/PROP_ENT.hql"
#upload-blob $STORAGE_ACC $SCRIPTS_CONTAINER "select/TOTALS.hql" "./scripts/select/TOTALS.hql"



# az group deployment create  
# --resource-group "msq-hdinsight-team-a" 
# --template-file "./fetch/arm_template.json" 
# --parameters "@./fetch/arm_template_parameters.json"

exit 0
