#!/bin/bash

tdir=`mktemp -d`

function process {
	echo "Importing ${1} to ${2}"
#	az storage blob download --container tcad --account-name edapblob --name ${1}.TXT --file ${tdir}/${1}.TXT
	echo "bcp \"dbo.${2}\" IN ${tdir}/${1}.TXT -S azt-sql.eastus.cloudapp.azure.com -U azt -P $PASS -d tcadb -f ${2}.fmt"
	bcp "dbo.${2}" IN /tmp/tmp.JWFQQklRHX/PROP_ENT.TXT -S azt-sql.eastus.cloudapp.azure.com -U azt -P $PASS -d tcadb -f ${2}.fmt -e ${1}.err
#	bcp "dbo.${2}" IN ${tdir}/${1}.TXT -S azt-sql.eastus.cloudapp.azure.com -U azt -P $PASS -d tcadb -f ${2}.fmt -e ${1}.err
}

#process APPR_HDR APPR_HDR

process ABS_SUBD ABS_SUBD
process AGENT AGENT
process ARB ARB
process ARBITRATION ARBITRATION
process COUNTRY COUNTRY
process ENTITY ENTITY
process IMP_ATR IMP_ATR
process IMP_DET IMP_DET
process IMP_INFO IMP_INFO
process LAND_DET LAND_DET
process LAWSUIT LAWSUIT
process PROP PROP
process PROP_ENT PROP_ENT
process STATE_CD STATE_CD
process TOTALS TOTALS
process UDI UDI_7_8

#bcp "dbo.real_neighborhood_code" IN $WDIR/real_neighborhood_code.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log >> 2>&1

