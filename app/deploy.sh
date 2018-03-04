#!/bin/bash

az storage container create \
--account-name "hdibloba" \
--name "scripts"

az storage blob upload \
--account-name "hdibloba" \
--container-name "scripts" \
--name "select/PROP.hql" \
--file "./scripts/select/PROP.hql"

az group deployment create  \
--resource-group "msq-hdinsight-team-a" \
--template-file "./fetch/arm_template.json" \
--parameters "@./fetch/arm_template_parameters.json"

exit 0