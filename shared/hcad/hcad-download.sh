#!/bin/bash

export YEAR=$1
export CONTAINER=hcad-${YEAR}

az storage container create --account-name "edapblob" --name ${CONTAINER}

export DIR=`mktemp -d`


ff=Real_acct_owner.zip
wget http://pdata.hcad.org/download/$YEAR/$ff -P $DIR; az storage blob upload -c ${CONTAINER} --account-name "edapblob" -n $ff -f $DIR/$ff
ff=Real_building_land.zip 
wget http://pdata.hcad.org/download/$YEAR/$ff -P $DIR; az storage blob upload -c ${CONTAINER} --account-name "edapblob" -n $ff -f $DIR/$ff
ff=Real_jur_exempt.zip 
wget http://pdata.hcad.org/download/$YEAR/$ff -P $DIR; az storage blob upload -c ${CONTAINER} --account-name "edapblob" -n $ff -f $DIR/$ff
ff=PP_files.zip 
wget http://pdata.hcad.org/download/$YEAR/$ff -P $DIR; az storage blob upload -c ${CONTAINER} --account-name "edapblob" -n $ff -f $DIR/$ff
ff=Hearing_files.zip 
wget http://pdata.hcad.org/download/$YEAR/$ff -P $DIR; az storage blob upload -c ${CONTAINER} --account-name "edapblob" -n $ff -f $DIR/$ff

if [ $YEAR == "2017" ]
then
	ff=Real_acct_ownership_history.zip
	wget http://pdata.hcad.org/download/$YEAR/$ff -P $DIR; az storage blob upload -c ${CONTAINER} --account-name "edapblob" -n $ff -f $DIR/$ff
fi

ff=code_desc_real.txt 
wget http://pdata.hcad.org/Desc/$YEAR/$ff -P $DIR; az storage blob upload -c ${CONTAINER} --account-name "edapblob" -n $ff -f $DIR/$ff
ff=code_nh_numbers.txt 
wget http://pdata.hcad.org/Desc/$YEAR/$ff -P $DIR; az storage blob upload -c ${CONTAINER} --account-name "edapblob" -n $ff -f $DIR/$ff
ff=code_nh_numbers_adj.txt 
wget http://pdata.hcad.org/Desc/$YEAR/$ff -P $DIR; az storage blob upload -c ${CONTAINER} --account-name "edapblob" -n $ff -f $DIR/$ff
ff=code_desc_personal.txt 
wget http://pdata.hcad.org/Desc/$YEAR/$ff -P $DIR; az storage blob upload -c ${CONTAINER} --account-name "edapblob" -n $ff -f $DIR/$ff
ff=code_jur_list.txt 
wget http://pdata.hcad.org/Desc/$YEAR/$ff -P $DIR; az storage blob upload -c ${CONTAINER} --account-name "edapblob" -n $ff -f $DIR/$ff


rm -rf $DIR
