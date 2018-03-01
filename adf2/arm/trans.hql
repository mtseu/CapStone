
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS trans;

CREATE EXTERNAL TABLE transactions (
    `dt` VARCHAR(100),
    `amount` DECIMAL(10,2)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE LOCATION 'wasbs://data@mtseublob.blob.core.windows.net/transactions'
tblproperties ("skip.header.line.count"="1");

CREATE EXTERNAL TABLE trans (
    `dt` VARCHAR(100),
    `amount` DECIMAL(10,2)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE LOCATION 'adl://edapadls.azuredatalakestore.net/data/stage/mtseu/hive/trans';

INSERT OVERWRITE TABLE trans 
SELECT dt,
       amount
FROM transactions;
