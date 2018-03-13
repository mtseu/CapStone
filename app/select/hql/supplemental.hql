--
-- this script creates a number of supplemental tables
--

-- Supplimental 
DROP TABLE IF EXISTS D_TARVIS_JURISDICTION_DICT;
CREATE EXTERNAL TABLE D_TARVIS_JURISDICTION_DICT (
    id                        STRING
    , code                    STRING
    , jurisdiction_name       STRING
    , tax_rate                STRING
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION '${hiveconf:stg_dir}/D_TARVIS_JURISDICTION_DICT'
TBLPROPERTIES("separatorChar" = ",", "skip.header.line.count"="0")
;

DROP TABLE IF EXISTS D_EXEMPTION_DICT;
CREATE EXTERNAL TABLE D_EXEMPTION_DICT (
    exempt_code                STRING
    , prop_ent_field           STRING
    , exempt_description       STRING
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION '${hiveconf:stg_dir}/D_EXEMPTION_DICT'
TBLPROPERTIES("separatorChar" = ",", "skip.header.line.count"="0")
;

DROP TABLE IF EXISTS D_HARIS_NEIGHBORHOOD_DICT;
CREATE EXTERNAL TABLE D_HARIS_NEIGHBORHOOD_DICT (
    neighborhood STRING
    , code STRING
    , description STRING
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION '${hiveconf:stg_dir}/D_HARIS_NEIGHBORHOOD_DICT'
TBLPROPERTIES("separatorChar" = "\t", "skip.header.line.count"="1")
;