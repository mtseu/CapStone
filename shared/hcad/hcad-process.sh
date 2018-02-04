#!/bin/bash

export YEAR=$1
export CONTAINER=hcad-${YEAR}

export DIR=`mktemp -d`

SERVER=azt-sql.eastus.cloudapp.azure.com
USER=azt
DB=hcad_db

echo "Loading year: ${YEAR}" >> bcp.log

function load {
	ff=$1
	tt=$2
	ll=bcp-${ff}-${YEAR}.log

	echo "Loading $tt" >> $ll
	bcp "dbo.${tt}" IN $WDIR/${tt}.txt  -S $SERVER -U $USER -P $PASS -d $DB -r "\r\n" -t "\t" -c -e ${ff}-${tt}-${YEAR}.err -k >> $ll 2>&1	
}

ff=Real_building_land
WDIR=$DIR/${ff}_unzipped
mkdir $WDIR; az storage blob download -c ${CONTAINER} --account-name "edapblob" -n ${ff}.zip -f $DIR/${ff}.zip; unzip $DIR/${ff}.zip -d $WDIR
load $ff building_other
load $ff building_res
load $ff exterior
load $ff extra_features
load $ff extra_features_detail1
load $ff extra_features_detail2
load $ff fixtures
load $ff land
load $ff land_ag
load $ff structural_elem1
load $ff structural_elem2

ff=Real_acct_owner
WDIR=$DIR/${ff}_unzipped
mkdir $WDIR; az storage blob download -c ${CONTAINER} --account-name "edapblob" -n ${ff}.zip -f $DIR/${ff}.zip; unzip $DIR/${ff}.zip -d $WDIR
load $ff deeds
load $ff owners
load $ff real_acct
load $ff parcel_tieback
load $ff permits
load $ff real_neighborhood_code

ff=PP_files
WDIR=$DIR/${ff}_unzipped
mkdir $WDIR; az storage blob download -c ${CONTAINER} --account-name "edapblob" -n ${ff}.zip -f $DIR/${ff}.zip; unzip $DIR/${ff}.zip -d $WDIR
load $ff t_business_acct
load $ff t_business_detail
load $ff t_jur_exempt
load $ff t_jur_tax_dist_exempt_value
load $ff t_jur_tax_dist_percent_rate
load $ff t_jur_value
load $ff t_pp_c
load $ff t_pp_e
load $ff t_pp_l

ff=Hearing_files
WDIR=$DIR/${ff}_unzipped
mkdir $WDIR; az storage blob download -c ${CONTAINER} --account-name "edapblob" -n ${ff}.zip -f $DIR/${ff}.zip; unzip $DIR/${ff}.zip -d $WDIR
load $ff arb_hearings_pp
load $ff arb_hearings_real
load $ff arb_protest_pp
load $ff arb_protest_real

ff=Real_jur_exempt
WDIR=$DIR/${ff}_unzipped
mkdir $WDIR; az storage blob download -c ${CONTAINER} --account-name "edapblob" -n ${ff}.zip -f $DIR/${ff}.zip; unzip $DIR/${ff}.zip -d $WDIR
load $ff jur_exempt
load $ff jur_exempt_cd
load $ff jur_exemption_dscr
load $ff jur_tax_district_exempt_value
load $ff jur_tax_district_percent_rate
load $ff jur_value

if [ $YEAR == "2017" ]
then
	ff=Real_acct_ownership_history
	WDIR=$DIR/${ff}_unzipped
	mkdir $WDIR; az storage blob download -c ${CONTAINER} --account-name "edapblob" -n ${ff}.zip -f $DIR/${ff}.zip; unzip $DIR/${ff}.zip -d $WDIR
	load $ff ownership_history
fi

#echo "Loading building_other" >> bcp.log
#bcp "dbo.building_other" IN $WDIR/building_other.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c -e building_other.err -k >> bcp.log 2>&1
#echo "Loading building_res" >> bcp.log
#bcp "dbo.building_res" IN $WDIR/building_res.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c -e building_res.err -k >> bcp.log 2>&1
#echo "Loading exterior" >> bcp.log
#bcp "dbo.exterior" IN $WDIR/exterior.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c -e exterior.err -k >> bcp.log 2>&1
#echo "Loading extra_features" >> bcp.log
#bcp "dbo.extra_features" IN $WDIR/extra_features.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c -e extra_features.err -k >> bcp.log 2>&1
#echo "Loading extra_features_detail1" >> bcp.log
#bcp "dbo.extra_features_detail1" IN $WDIR/extra_features_detail1.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c -e extra_features_detail1.err -k >> bcp.log 2>&1
#echo "Loading extra_features_detail2" >> bcp.log
#bcp "dbo.extra_features_detail2" IN $WDIR/extra_features_detail2.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c -e extra_features_detail2.err -k >> bcp.log 2>&1
#echo "Loading fixtures" >> bcp.log
#bcp "dbo.fixtures" IN $WDIR/fixtures.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c -e fixtures.err -k >> bcp.log 2>&1
#echo "Loading land" >> bcp.log
#bcp "dbo.land" IN $WDIR/land.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c -e land.err -k >> bcp.log 2>&1
#echo "Loading land_ag" >> bcp.log
#bcp "dbo.land_ag" IN $WDIR/land_ag.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c -e land_ag.err -k >> bcp.log 2>&1
#echo "Loading structural_elem1" >> bcp.log
#bcp "dbo.structural_elem1" IN $WDIR/structural_elem1.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c -e structural_elem1.err -k >> bcp.log 2>&1
#echo "Loading structural_elem2" >> bcp.log
#bcp "dbo.structural_elem2" IN $WDIR/structural_elem2.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c -e structural_elem2.err -k >> bcp.log 2>&1

#ff=Real_acct_owner.zip
#WDIR=$DIR/${ff}_unzipped
#mkdir $WDIR; az storage blob download -c ${CONTAINER} --account-name "edapblob" -n $ff -f $DIR/$ff; unzip $DIR/$ff -d $WDIR
#echo "Loading deeds" >> bcp.log
#bcp "dbo.deeds" IN $WDIR/deeds.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log -e deeds.err -k 2>&1
#echo "Loading owners" >> bcp.log
#bcp "dbo.owners" IN $WDIR/owners.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log -e owners.err -k 2>&1
#echo "Loading real_acct" >> bcp.log
#bcp "dbo.real_acct" IN $WDIR/real_acct.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c -e real_acct.err -k >> bcp.log 2>&1
#echo "Loading parcel_tieback" >> bcp.log
#bcp "dbo.parcel_tieback" IN $WDIR/parcel_tieback.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c -e parcel_tieback.err -k >> bcp.log 2>&1
#echo "Loading permits" >> bcp.log
#bcp "dbo.permits" IN $WDIR/permits.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c -e permits.err -k >> bcp.log 2>&1
#echo "Loading real_neighborhood_code" >> bcp.log
#bcp "dbo.real_neighborhood_code" IN $WDIR/real_neighborhood_code.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c -e real_neighborhood_code.err -k >> bcp.log 2>&1
#
#exit 0


# ff=Real_jur_exempt.zip 
# WDIR=$DIR/${ff}_unzipped
# mkdir $WDIR; az storage blob download -c ${CONTAINER} --account-name "edapblob" -n $ff -f $DIR/$ff; unzip $DIR/$ff -d $WDIR
# bcp "dbo.real_neighborhood_code" IN $WDIR/real_neighborhood_code.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log >> 2>&1
# bcp "dbo.real_neighborhood_code" IN $WDIR/real_neighborhood_code.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log >> 2>&1
# bcp "dbo.real_neighborhood_code" IN $WDIR/real_neighborhood_code.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log >> 2>&1

#ff=PP_files.zip 
#WDIR=$DIR/${ff}_unzipped
#mkdir $WDIR; az storage blob download -c ${CONTAINER} --account-name "edapblob" -n $ff -f $DIR/$ff; unzip $DIR/$ff -d $WDIR
#bcp "dbo.t_business_acct" IN $WDIR/t_business_acct.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log 2>&1
#bcp "dbo.t_business_detail" IN $WDIR/t_business_detail.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log 2>&1
#bcp "dbo.t_jur_exempt" IN $WDIR/t_jur_exempt.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log 2>&1
#bcp "dbo.t_jur_tax_dist_exempt_value" IN $WDIR/t_jur_tax_dist_exempt_value.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log 2>&1
#bcp "dbo.t_jur_tax_dist_percent_rate" IN $WDIR/t_jur_tax_dist_percent_rate.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log 2>&1
#bcp "dbo.t_jur_value" IN $WDIR/t_jur_value.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log 2>&1
#bcp "dbo.t_pp_c" IN $WDIR/t_pp_c.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log 2>&1
#bcp "dbo.t_pp_e" IN $WDIR/t_pp_e.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log 2>&1
#bcp "dbo.t_pp_l" IN $WDIR/t_pp_l.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log 2>&1

#ff=Hearing_files.zip 
#WDIR=$DIR/${ff}_unzipped
#mkdir $WDIR; az storage blob download -c ${CONTAINER} --account-name "edapblob" -n $ff -f $DIR/$ff; unzip $DIR/$ff -d $WDIR
#bcp "dbo.arb_hearings_pp" IN $WDIR/arb_hearings_pp.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log 2>&1
#bcp "dbo.arb_hearings_real" IN $WDIR/arb_hearings_real.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log 2>&1
#bcp "dbo.arb_protest_pp" IN $WDIR/arb_protest_pp.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log 2>&1
#bcp "dbo.arb_protest_real" IN $WDIR/arb_protest_real.txt  -S $SERVER -U $USER -P $PASS -d "hcad_db" -r "\r\n" -t "\t" -c >> bcp.log 2>&1

#if [ $YEAR == "2017" ]
#then
#	ff=Real_acct_ownership_history
#	WDIR=$DIR/${ff}_unzipped
#	mkdir $WDIR; az storage blob download -c ${CONTAINER} --account-name "edapblob" -n ${ff}.zip -f $DIR/${ff}.zip; unzip $DIR/${ff}.zip -d $WDIR
#	load $ff ownership_history
#fi


rm -rf $DIR
