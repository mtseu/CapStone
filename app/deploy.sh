#!/bin/bash

STORAGE_ACC="hdibloba"
SCRIPTS_CONTAINER="scripts"
SCHEMAS_CONTAINER="schemas"
SUPPLEM_CONTAINER="supplem"
RESOURCE_GROUP="msq-hdinsight-team-a"
DEPLOYMENT=CapStoneTeamADeployment

# uploads blob to Azure Blob Storage
# 1 - account
# 2 - container
# 3 - blob
# 4 - local file
function upload-blob {
    echo "Uploading ${4} to ${1}:${2}:${3} ..." 1>&2
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
    echo "Deploying the following template: ${1}" 1>&2
    pars=$(mktemp)

    az group deployment create \
    --resource-group "$RESOURCE_GROUP" \
    --template-file "$1" \
    --name "$DEPLOYMENT" \
    --output tsv \
    --parameters "@$(parameters $1 $2 $pars)"

    rm $pars
}

if [ "$1" == "deploy" ] && [ ! -z "$2" ] && [ "$2" != "all" ]; then
    echo "Performing specific deployment..." 1>&2
    deploy "$2" "./cap-stone-adf2-params.json"
    exit 0;
fi

if [ -z "$1" ] || [ "$1" == "all" ] || ( [ "$1" == "deploy" ] && [ "$2" == "all" ] ); then
    echo "Performing total deployment..." 1>&2
    # deploy the data factory itslef 
    deploy "./cap-stone-adf2.json"                       "./cap-stone-adf2-params.json"

    # deploy common stuff 
    deploy "./common/adls-conn.json"                     "./cap-stone-adf2-params.json"
    deploy "./common/hdi-blob-conn.json"                 "./cap-stone-adf2-params.json"
    deploy "./common/hdi-stnd-conn.json"                 "./cap-stone-adf2-params.json"
    deploy "./common/hdi-dmnd-conn.json"                 "./cap-stone-adf2-params.json"
    deploy "./common/hdi-meta-conn.json"                 "./cap-stone-adf2-params.json"
    deploy "./common/datasets/hdi-aux-dataset.json"      "./cap-stone-adf2-params.json"
    deploy "./common/datasets/adls-file-dataset.json"    "./cap-stone-adf2-params.json"

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
    deploy "./select/pipelines/select-hcad-data.json"    "./cap-stone-adf2-params.json"
    deploy "./select/pipelines/select-supp-data.json"    "./cap-stone-adf2-params.json"

    # deploy producer
    deploy "./produce/pipelines/produce-cap-stone.json"    "./cap-stone-adf2-params.json"

    # deploy launcher pipeline
    deploy "./run-all.json"    "./cap-stone-adf2-params.json"
fi

if [ "$1" == "scripts" ] || [ "$1" == "all" ] || [ -z "$1" ]; then
    echo "Performing scripts upload..." 1>&2
    az storage container create \
    --account-name "$STORAGE_ACC" \
    --name "$SCRIPTS_CONTAINER"

    upload-blob $STORAGE_ACC $SCRIPTS_CONTAINER "select/PROP.hql"               "./select/hql/PROP.hql"
    upload-blob $STORAGE_ACC $SCRIPTS_CONTAINER "select/PROP_ENT.hql"           "./select/hql/PROP_ENT.hql"
    upload-blob $STORAGE_ACC $SCRIPTS_CONTAINER "select/TOTALS.hql"             "./select/hql/TOTALS.hql"
    upload-blob $STORAGE_ACC $SCRIPTS_CONTAINER "select/hcad-all.hql"           "./select/hql/hcad-all.hql"
    upload-blob $STORAGE_ACC $SCRIPTS_CONTAINER "select/supplemental.hql"       "./select/hql/supplemental.hql"

    upload-blob $STORAGE_ACC $SCRIPTS_CONTAINER "produce/calculate-dataset.hql" "./produce/hql/calculate-dataset.hql"
fi

if [ "$1" == "schemas" ] || [ "$1" == "all" ] || [ -z "$1" ]; then
    echo "Performing schemas upload..." 1>&2
    az storage container create \
    --account-name "$STORAGE_ACC" \
    --name "$SCHEMAS_CONTAINER"

    upload-blob $STORAGE_ACC $SCHEMAS_CONTAINER "hcad/jur_exempt.avsc"                "./common/schemas/hcad/jur_exempt.avsc"
    upload-blob $STORAGE_ACC $SCHEMAS_CONTAINER "hcad/jur_value.avsc"                 "./common/schemas/hcad/jur_value.avsc"
    upload-blob $STORAGE_ACC $SCHEMAS_CONTAINER "hcad/jur_tax_dist_percent_rate.avsc" "./common/schemas/hcad/jur_tax_dist_percent_rate.avsc"
    upload-blob $STORAGE_ACC $SCHEMAS_CONTAINER "hcad/real_acct.avsc"                 "./common/schemas/hcad/real_acct.avsc"
    upload-blob $STORAGE_ACC $SCHEMAS_CONTAINER "tcad/prop.avsc"                      "./common/schemas/tcad/prop.avsc"
    upload-blob $STORAGE_ACC $SCHEMAS_CONTAINER "tcad/prop_ent.avsc"                  "./common/schemas/tcad/prop_ent.avsc"
    upload-blob $STORAGE_ACC $SCHEMAS_CONTAINER "tcad/totals.avsc"                    "./common/schemas/tcad/totals.avsc"
fi

if [ "$1" == "supp" ] || [ "$1" == "all" ] || [ -z "$1" ]; then
    echo "Performing supplemental files upload..." 1>&2
    az storage container create \
    --account-name "$STORAGE_ACC" \
    --name "$SUPPLEM_CONTAINER"

    upload-blob $STORAGE_ACC $SUPPLEM_CONTAINER "D_EXEMPTION_DICT.csv"           "./supplemental/D_EXEMPTION_DICT.csv"
    upload-blob $STORAGE_ACC $SUPPLEM_CONTAINER "D_HARIS_NEIGHBORHOOD_DICT.tsv"  "./supplemental/D_HARIS_NEIGHBORHOOD_DICT.tsv"
    upload-blob $STORAGE_ACC $SUPPLEM_CONTAINER "D_TARVIS_JURISDICTION_DICT.csv" "./supplemental/D_TARVIS_JURISDICTION_DICT.csv"
fi

exit 0
