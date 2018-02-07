#!/bin/bash

# this shell script will download appraisal data for Harris county
# and save it to the MS SQL Server database on Azure Cloud

DEF_SERVER=azt-sql.eastus.cloudapp.azure.com
DEF_USER=azt

SERVER=$DEF_SERVER
USER=$DEF_USER

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

if [ -z $PASS ]; then
	echo "Password has to bw specified"
	exit 1
fi

echo "Reinitializing the database schema"
echo "sqlcmd -S $SERVER -U $USER -P $PASS -i create.sql"
export DBNAME=$DATABASE 
sqlcmd -S $SERVER -U $USER -P $PASS -i hcad-db-create.sql

echo "Downloading files from HCAD"

