#!/bin/bash

# this shell script will download appraisal data for Harris county
# and save it to the MS SQL Server database on Azure Cloud

DEF_SERVER=azt-sql.eastus.cloudapp.azure.com
DEF_DATABASE=default
DEF_USER=azt
DEF_PASS=AzureAdmin17

function err {
	echo $* >&2
}

SERVER=$DEF_SERVER
DATABASE=$DEF_DATABASE
USER=$DEF_USER
PASS=$DEF_PASS

while getopts "s:d:u:p:" ARG ; do
	case $ARG in
		s)
			SERVER=$OPTARG
		;;
		d)
			DATABASE=$OPTARG
		;;
		u)
			USER=$OPTARG
		;;
		p)
			PASS=$OPTARG
		;;
	esac
done

echo SERVER=$SERVER
echo DATABASE=$DATABASE
echo USER=$USER
echo PASS=$PASS

echo "Reinitializing the database schema"
echo "sqlcmd -S $SERVER -U $USER -P $PASS -i create.sql"
sqlcmd -S $SERVER -U $USER -P $PASS -i create.sql

echo "Downloading files from HCAD"

