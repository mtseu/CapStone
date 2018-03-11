-- 
-- this script copies all hcad data from raw to stage 
--

-- jur_value

DROP TABLE IF EXISTS raw_hcad_jur_value;
DROP TABLE IF EXISTS stg_hcad_jur_value;

CREATE EXTERNAL TABLE raw_hcad_jur_value
STORED AS AVRO
LOCATION '${hiveconf:raw_dir}/jur_value'
TBLPROPERTIES ('avro.schema.url'='${hiveconf:raw_dir}/jur_value.avsc');

CREATE TABLE stg_hcad_jur_value
STORED AS AVRO
LOCATION '${hiveconf:stg_dir}/jur_value'
AS SELECT * FROM raw_hcad_jur_value;

-- real_acct

DROP TABLE IF EXISTS raw_hcad_real_acct;
DROP TABLE IF EXISTS stg_hcad_real_acct;

CREATE EXTERNAL TABLE raw_hcad_real_acct
STORED AS AVRO
LOCATION '${hiveconf:raw_dir}/real_acct'
TBLPROPERTIES ('avro.schema.url'='${hiveconf:raw_dir}/real_acct.avsc');

CREATE TABLE stg_hcad_real_acct
STORED AS AVRO
LOCATION '${hiveconf:stg_dir}/real_acct'
AS SELECT * FROM raw_hcad_real_acct;

-- jur_tax_dist_percent_rate

DROP TABLE IF EXISTS raw_hcad_jur_tax_dist_percent_rate;
DROP TABLE IF EXISTS stg_hcad_jur_tax_dist_percent_rate;

CREATE EXTERNAL TABLE raw_hcad_jur_tax_dist_percent_rate
STORED AS AVRO
LOCATION '${hiveconf:raw_dir}/jur_tax_dist_percent_rate'
TBLPROPERTIES ('avro.schema.url'='${hiveconf:raw_dir}/jur_tax_dist_percent_rate.avsc');

CREATE TABLE stg_hcad_jur_tax_dist_percent_rate
STORED AS AVRO
LOCATION '${hiveconf:stg_dir}/jur_tax_dist_percent_rate'
AS SELECT * FROM raw_hcad_jur_tax_dist_percent_rate;

-- jur_exempt

DROP TABLE IF EXISTS raw_hcad_jur_exempt;
DROP TABLE IF EXISTS stg_hcad_jur_exempt;

CREATE EXTERNAL TABLE raw_hcad_jur_exempt
STORED AS AVRO
LOCATION '${hiveconf:raw_dir}/jur_tax_jur_exempt'
TBLPROPERTIES ('avro.schema.url'='${hiveconf:raw_dir}/jur_exempt.avsc');

CREATE TABLE stg_hcad_jur_exempt
STORED AS AVRO
LOCATION '${hiveconf:stg_dir}/jur_exempt'
AS SELECT * FROM raw_hcad_jur_exempt;

-- INSERT OVERWRITE TABLE stg_hcad_jur_value SELECT * FROM raw_hcad_jur_value;

