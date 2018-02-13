#!/bin/bash

export YEAR=$1
export CONTAINER=hcad-${YEAR}

export DIR=`mktemp -d`

echo "Loading year: ${YEAR}" 

# usage: upload-all <table_name>
function deep {
	tt=$1
	echo "uploading table ${tt}"
	az storage blob download -c "hcad-all" --account-name "edapblob" -n ${YEAR}/${tt}.txt -f ${WDIR}/${tt}.txt
	az storage blob upload -c "hcad-all" --account-name "edapblob" -n ${tt}/year=${YEAR}/${tt}.txt -f ${WDIR}/${tt}.txt
#	az storage blob delete -c "hcad-all" --account-name "edapblob" -n ${YEAR}/${tt}.txt 
}

ff=Real_building_land
WDIR=$DIR/${ff}_unzipped; mkdir $WDIR
deep building_other
deep building_res
deep exterior
deep extra_features
deep extra_features_detail1
deep extra_features_detail2
deep fixtures
deep land
deep land_ag
deep structural_elem1
deep structural_elem2

ff=Real_acct_owner
WDIR=$DIR/${ff}_unzipped; mkdir $WDIR
deep deeds
deep owners
deep real_acct
deep parcel_tieback
deep permits
deep real_neighborhood_code

ff=PP_files
WDIR=$DIR/${ff}_unzipped; mkdir $WDIR
deep t_business_acct
deep t_business_detail
deep t_jur_exempt
deep t_jur_tax_dist_exempt_value
deep t_jur_tax_dist_percent_rate
deep t_jur_value
deep t_pp_c
deep t_pp_e
deep t_pp_l

ff=Hearing_files
WDIR=$DIR/${ff}_unzipped; mkdir $WDIR
deep arb_hearings_pp
deep arb_hearings_real
deep arb_protest_pp
deep arb_protest_real

ff=Real_jur_exempt
WDIR=$DIR/${ff}_unzipped; mkdir $WDIR
deep jur_exempt
deep jur_exempt_cd
deep jur_exemption_dscr
deep jur_tax_dist_exempt_value
deep jur_tax_dist_percent_rate
deep jur_value

if [ $YEAR == "2017" ]
then
	ff=Real_acct_ownership_history
	WDIR=$DIR/${ff}_unzipped; mkdir $WDIR
	deep ownership_history
fi


rm -rf $DIR
