#!/bin/bash

sqlcmd -S azt-sql.eastus.cloudapp.azure.com -U azt -P $PASS -i tcad-create.sql

