-- 
-- this script copies all hcad data from raw to stage 
--

DROP TABLE IF EXISTS raw_hcad_jur_value;
DROP TABLE IF EXISTS stg_hcad_jur_value;

CREATE EXTERNAL TABLE raw_hcad_jur_value
STORED AS AVRO
LOCATION '${hiveconf:raw_dir}/jur_value'
TBLPROPERTIES ('avro.schema.url'='${hiveconf:raw_dir}/jur_value.avsc');

CREATE TABLE stg_hcad_jur_value
STORED AS AVRO
LOCATION '${hiveconf:stg_dir}/jur_value'
TBLPROPERTIES ('avro.schema.url'='${hiveconf:stg_dir}/jur_value.avsc');

INSERT OVERWRITE TABLE stg_hcad_jur_value SELECT * FROM raw_hcad_jur_value;