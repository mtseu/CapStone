#!/bin/bash

export YEAR=$1
export CONTAINER=hcad-${YEAR}

export DIR=`mktemp -d`

echo "Loading year: ${YEAR}" 

# usage: upload-all <table_name>
function upload {
	tt=$1
	echo "uploading table ${tt}"
	az storage blob upload -c "hcad-all" --account-name "edapblob" -n ${YEAR}/${tt}.txt -f ${WDIR}/${tt}.txt
}

ff=Real_building_land
WDIR=$DIR/${ff}_unzipped
mkdir $WDIR; az storage blob download -c ${CONTAINER} --account-name "edapblob" -n ${ff}.zip -f $DIR/${ff}.zip; unzip $DIR/${ff}.zip -d $WDIR
upload building_other
upload building_res
upload exterior
upload extra_features
upload extra_features_detail1
upload extra_features_detail2
upload fixtures
upload land
upload land_ag
upload structural_elem1
upload structural_elem2

ff=Real_acct_owner
WDIR=$DIR/${ff}_unzipped
mkdir $WDIR; az storage blob download -c ${CONTAINER} --account-name "edapblob" -n ${ff}.zip -f $DIR/${ff}.zip; unzip $DIR/${ff}.zip -d $WDIR
upload deeds
upload owners
upload real_acct
upload parcel_tieback
upload permits
upload real_neighborhood_code

ff=PP_files
WDIR=$DIR/${ff}_unzipped
mkdir $WDIR; az storage blob download -c ${CONTAINER} --account-name "edapblob" -n ${ff}.zip -f $DIR/${ff}.zip; unzip $DIR/${ff}.zip -d $WDIR
upload t_business_acct
upload t_business_detail
upload t_jur_exempt
upload t_jur_tax_dist_exempt_value
upload t_jur_tax_dist_percent_rate
upload t_jur_value
upload t_pp_c
upload t_pp_e
upload t_pp_l

ff=Hearing_files
WDIR=$DIR/${ff}_unzipped
mkdir $WDIR; az storage blob download -c ${CONTAINER} --account-name "edapblob" -n ${ff}.zip -f $DIR/${ff}.zip; unzip $DIR/${ff}.zip -d $WDIR
upload arb_hearings_pp
upload arb_hearings_real
upload arb_protest_pp
upload arb_protest_real

ff=Real_jur_exempt
WDIR=$DIR/${ff}_unzipped
mkdir $WDIR; az storage blob download -c ${CONTAINER} --account-name "edapblob" -n ${ff}.zip -f $DIR/${ff}.zip; unzip $DIR/${ff}.zip -d $WDIR
upload jur_exempt
upload jur_exempt_cd
upload jur_exemption_dscr
upload jur_tax_dist_exempt_value
upload jur_tax_dist_percent_rate
upload jur_value

if [ $YEAR == "2017" ]
then
	ff=Real_acct_ownership_history
	WDIR=$DIR/${ff}_unzipped
	mkdir $WDIR; az storage blob download -c ${CONTAINER} --account-name "edapblob" -n ${ff}.zip -f $DIR/${ff}.zip; unzip $DIR/${ff}.zip -d $WDIR
	upload ownership_history
fi


rm -rf $DIR
