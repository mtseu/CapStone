-- ID Generation 
--  CONCAT("00", SUBSTR(CONCAT('0000000000000000',
--      TRIM(ID)
--  ), -16)) AS SYNTEIC__ID
-- 11 - Harris Property
-- 21 - Travis Property
-- 12 - Harris Jurisdiction
-- 22 - Travis Jurisdiction
-- 13 - Harris Owner
-- 23 - Travis Owner

-- Supplimental 
-- DROP TABLE IF EXISTS D_TARVIS_JURISDICTION_DICT;
-- CREATE EXTERNAL TABLE D_TARVIS_JURISDICTION_DICT (
--     id                        STRING
--     , code                    STRING
--     , jurisdiction_name       STRING
--     , tax_rate                STRING
-- ) 
-- ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
-- STORED AS TEXTFILE
-- LOCATION 'hdfs://nameservice1/data/Stage/lsia/supplemental/D_TARVIS_JURISDICTION'
-- TBLPROPERTIES("separatorChar" = ",", "skip.header.line.count"="0")
-- ;

-- DROP TABLE IF EXISTS D_EXEMPTION_DICT;
-- CREATE EXTERNAL D_EXEMPTION_DICT (
--     exempt_code                STRING
--     , prop_ent_field           STRING
--     , exempt_description       STRING
-- ) 
-- ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
-- STORED AS TEXTFILE
-- LOCATION 'hdfs://nameservice1/data/Stage/lsia/supplemental/D_EXEMPTION'
-- TBLPROPERTIES("separatorChar" = ",", "skip.header.line.count"="0")
-- ;

-- DROP TABLE IF EXISTS D_HARIS_NEIGHBORHOOD_DICT;
-- CREATE EXTERNAL D_HARIS_NEIGHBORHOOD_DICT (
--     neighborhood STRING
--     , code STRING
--     , description STRING
-- ) 
-- ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
-- STORED AS TEXTFILE
-- LOCATION 'hdfs://nameservice1/data/Stage/lsia/supplemental/D_HARIS_NEIGHBORHOOD'
-- TBLPROPERTIES("separatorChar" = "\t", "skip.header.line.count"="1")
-- ;


DROP TABLE IF EXISTS D_JURISDICTION;
CREATE TABLE D_JURISDICTION
STORED AS AVRO
LOCATION '${hiveconf:prp_dir}/D_JURISDICTION'
AS
SELECT 
    CONCAT("12", SUBSTR(CONCAT('0000000000000000', 
        ROW_NUMBER() OVER (ORDER BY TAX_DIST)
    ), -16))                                    AS JURISDICTION_ID
    , TAX_DIST                                  AS JURISDICTION_CODE
    , TAX_DISTRICT_NAME                         AS JURISDICTION_NAME
    , CAST(CURRENT_YR_RATE AS DOUBLE)           AS TAX_RATE
    -- , SNAPSHOT_YEAR AS TAX_YEAR
    , '2017'                                    AS TAX_YEAR
    , 'Harris'                                  AS DATASET
FROM stg_hcad_jur_tax_dist_percent_rate
UNION ALL 
SELECT 
    CONCAT("22", SUBSTR(CONCAT('0000000000000000', 
        TRIM(ID)
    ), -16))                                    AS JURISDICTION_ID
    , CODE                                      AS JURISDICTION_CODE
    , JURISDICTION_NAME                         AS JURISDICTION_NAME
    , CAST(TAX_RATE AS DOUBLE)                  AS TAX_RATE 
    , '2017'                                    AS TAX_YEAR
    , 'Travis'                                  AS DATASET
FROM D_TARVIS_JURISDICTION_DICT
;

DROP TABLE IF EXISTS D_JURISDICTION_EXEMPT;
CREATE TABLE D_JURISDICTION_EXEMPT 
STORED AS AVRO
LOCATION '${hiveconf:prp_dir}/D_JURISDICTION_EXEMPT'
AS
WITH 
HARIS_EXEMPTS AS (
    SELECT
        CONCAT("11", SUBSTR(CONCAT('0000000000000000', 
            TRIM(e.ACCOUNT)
        ), -16))                                   AS ACCOUNT_ID
        , j.JURISDICTION_ID                        AS JURISDICTION_ID
        , e.EXEMPT_CAT                             AS EXEMPT_CODE
        , CAST(e.EXEMPT_VAL AS DECIMAL)            AS EXEMPT_VALUE
    FROM stg_HCAD_JUR_EXEMPT e
    LEFT JOIN D_JURISDICTION j
        ON e.TAX_DISTRICT = j.JURISDICTION_CODE AND j.DATASET = 'Harris'
),

TRAVIS_EXEMPTS_TRANSPOSED AS (
    SELECT 
        PROP_ID                                  AS ACCOUNT_ID
        , ENTITY_ID                              AS JURISDICTION_ID
        ,'ABT'                                   AS EXEMPT_CODE
        , AB_AMT                                 AS EXEMPT_VALUE
    FROM stg_TCAD_PROP_ENT
        WHERE AB_AMT IS NOT NULL AND CAST(AB_AMT AS INT) <> 0
    UNION ALL
    SELECT 
        PROP_ID                                  AS ACCOUNT_ID
        , ENTITY_ID                              AS JURISDICTION_ID
        ,'DIS'                                   AS EXEMPT_CODE
        , DP_AMT                                 AS EXEMPT_VALUE
    FROM stg_TCAD_PROP_ENT
        WHERE DP_AMT IS NOT NULL AND CAST(DP_AMT AS INT) <> 0
    UNION ALL
    SELECT 
        PROP_ID                                  AS ACCOUNT_ID
        , ENTITY_ID                              AS JURISDICTION_ID
        ,'HIS'                                   AS EXEMPT_CODE
        , HT_AMT                                 AS EXEMPT_VALUE
    FROM stg_TCAD_PROP_ENT
        WHERE HT_AMT IS NOT NULL AND CAST(HT_AMT AS INT) <> 0
    UNION ALL
    SELECT 
        PROP_ID                                  AS ACCOUNT_ID
        , ENTITY_ID                              AS JURISDICTION_ID
        ,'LIH'                                   AS EXEMPT_CODE
        , PRO_AMT                                AS EXEMPT_VALUE
    FROM stg_TCAD_PROP_ENT
        WHERE PRO_AMT IS NOT NULL AND CAST(PRO_AMT AS INT) <> 0
    UNION ALL
    SELECT 
        PROP_ID                                  AS ACCOUNT_ID
        , ENTITY_ID                              AS JURISDICTION_ID
        ,'OVR'                                   AS EXEMPT_CODE
        , PRO_AMT                                AS EXEMPT_VALUE
    FROM stg_TCAD_PROP_ENT
        WHERE PRO_AMT IS NOT NULL AND CAST(PRO_AMT AS INT) <> 0
    UNION ALL
    SELECT 
        PROP_ID                                  AS ACCOUNT_ID
        , ENTITY_ID                              AS JURISDICTION_ID
        ,'LIH'                                   AS EXEMPT_CODE
        , OV65_AMT                               AS EXEMPT_VALUE
    FROM stg_TCAD_PROP_ENT
        WHERE OV65_AMT IS NOT NULL AND CAST(OV65_AMT AS INT) <> 0
    UNION ALL
    SELECT 
        PROP_ID                                  AS ACCOUNT_ID
        , ENTITY_ID                              AS JURISDICTION_ID
        ,'POL'                                   AS EXEMPT_CODE
        , PC_AMT                                 AS EXEMPT_VALUE
    FROM stg_TCAD_PROP_ENT
        WHERE PC_AMT IS NOT NULL AND CAST(PC_AMT AS INT) <> 0
    UNION ALL
    SELECT 
        PROP_ID                                  AS ACCOUNT_ID
        , ENTITY_ID                              AS JURISDICTION_ID
        ,'RES'                                   AS EXEMPT_CODE
        , HS_AMT                                 AS EXEMPT_VALUE
    FROM stg_TCAD_PROP_ENT
        WHERE HS_AMT IS NOT NULL AND CAST(HS_AMT AS INT) <> 0
    UNION ALL
    SELECT 
        PROP_ID                                  AS ACCOUNT_ID
        , ENTITY_ID                              AS JURISDICTION_ID
        ,'SOL'                                   AS EXEMPT_CODE
        , SO_AMT                                 AS EXEMPT_VALUE
    FROM stg_TCAD_PROP_ENT
        WHERE SO_AMT IS NOT NULL AND CAST(SO_AMT AS INT) <> 0
    UNION ALL
    SELECT 
        PROP_ID                                  AS ACCOUNT_ID
        , ENTITY_ID                              AS JURISDICTION_ID
        ,'VTX'                                   AS EXEMPT_CODE
        , DV_AMT                                 AS EXEMPT_VALUE
    FROM stg_TCAD_PROP_ENT
        WHERE DV_AMT IS NOT NULL AND CAST(DV_AMT AS INT) <> 0 
    UNION ALL
    SELECT 
        PROP_ID                                  AS ACCOUNT_ID
        , ENTITY_ID                              AS JURISDICTION_ID
        ,'RES'                                   AS EXEMPT_CODE
        , HS_AMT                                 AS EXEMPT_VALUE
    FROM stg_TCAD_PROP_ENT
        WHERE HS_AMT IS NOT NULL AND CAST(HS_AMT AS INT) <> 0 
    UNION ALL
    SELECT 
        PROP_ID                                  AS ACCOUNT_ID
        , ENTITY_ID                              AS JURISDICTION_ID
        ,'EN'                                    AS EXEMPT_CODE
        , EN_AMT                                 AS EXEMPT_VALUE
    FROM stg_TCAD_PROP_ENT
        WHERE EN_AMT IS NOT NULL AND CAST(EN_AMT AS INT) <> 0 
    UNION ALL
    SELECT 
        PROP_ID                                  AS ACCOUNT_ID
        , ENTITY_ID                              AS JURISDICTION_ID
        ,'FR'                                    AS EXEMPT_CODE
        , FR_AMT                                 AS EXEMPT_VALUE
    FROM stg_TCAD_PROP_ENT
        WHERE FR_AMT IS NOT NULL AND CAST(FR_AMT AS INT) <> 0 
        UNION ALL
    SELECT 
        PROP_ID                                  AS ACCOUNT_ID
        , ENTITY_ID                              AS JURISDICTION_ID
        ,'EX366'                                 AS EXEMPT_CODE
        , EX366_AMT                              AS EXEMPT_VALUE
    FROM stg_TCAD_PROP_ENT
        WHERE EX366_AMT IS NOT NULL AND CAST(EX366_AMT AS INT) <> 0 
        UNION ALL
    SELECT 
        PROP_ID                                  AS ACCOUNT_ID
        , ENTITY_ID                              AS JURISDICTION_ID
        ,'LVE'                                   AS EXEMPT_CODE
        , LVE_AMT                                AS EXEMPT_VALUE
    FROM stg_TCAD_PROP_ENT
        WHERE LVE_AMT IS NOT NULL AND CAST(LVE_AMT AS INT) <> 0
        UNION ALL
    SELECT 
        PROP_ID                                  AS ACCOUNT_ID
        , ENTITY_ID                              AS JURISDICTION_ID
        ,'ECO'                                   AS EXEMPT_CODE
        , LVE_AMT                                AS EXEMPT_VALUE
    FROM stg_TCAD_PROP_ENT
        WHERE ECO_AMT IS NOT NULL AND CAST(ECO_AMT AS INT) <> 0
),

TRAVIS_EXEMPTS AS (
    SELECT 
        CONCAT("12", SUBSTR(CONCAT('0000000000000000', 
            ACCOUNT_ID
        ), -16))                                 AS ACCOUNT_ID
        , CONCAT("22", SUBSTR(CONCAT('0000000000000000', 
            JURISDICTION_ID
        ), -16))                                 AS JURISDICTION_ID
        , EXEMPT_CODE                            AS EXEMPT_CODE
        , EXEMPT_VALUE                           AS EXEMPT_VALUE
    FROM TRAVIS_EXEMPTS_TRANSPOSED
),

EXEMPTS AS (
    SELECT 
        ACCOUNT_ID
        , JURISDICTION_ID
        , EXEMPT_CODE
        , CAST(EXEMPT_VALUE AS DOUBLE)           AS EXEMPT_VALUE
        , '2017'                                 AS TAX_YEAR
        , 'Harris'                               AS DATASET
    FROM HARIS_EXEMPTS
    UNION ALL
    SELECT 
        ACCOUNT_ID
        , JURISDICTION_ID
        , EXEMPT_CODE
        , CAST(EXEMPT_VALUE AS DOUBLE)           AS EXEMPT_VALUE
        , '2017'                                 AS TAX_YEAR
        , 'Travis'                               AS DATASET
    FROM TRAVIS_EXEMPTS
)

SELECT 
    e.ACCOUNT_ID
    , e.JURISDICTION_ID
    , e.EXEMPT_CODE
    , e.EXEMPT_VALUE
    , e.TAX_YEAR
    , e.DATASET
    , c.EXEMPT_DESCRIPTION                      AS EXEMPT_NAME
FROM EXEMPTS e
LEFT JOIN D_EXEMPTION_DICT c
    ON e.EXEMPT_CODE = c.EXEMPT_CODE
WHERE e.EXEMPT_VALUE IS NOT NULL
;

DROP TABLE IF EXISTS D_JURISDICTION_TAX_VALUES;
CREATE TABLE D_JURISDICTION_TAX_VALUES
STORED AS AVRO
LOCATION '${hiveconf:prp_dir}/D_JURISDICTION_TAX_VALUES'
AS
WITH 
HARIS_TAXES AS (
    SELECT 
        CONCAT("11", SUBSTR(CONCAT('0000000000000000', 
            TRIM(v.ACCOUNT)
        ), -16))                                                                                    AS ACCOUNT_ID
        , j.JURISDICTION_ID                                                                         AS JURISDICTION_ID
        , CAST(v.APPRAISED_VALUE AS DECIMAL)                                                        AS APPRAISED_VALUE
        , CAST(v.APPRAISED_VALUE AS DECIMAL)  - IF(e.EXEMPT_VALUE IS NOT NULL, e.EXEMPT_VALUE, 0)   AS TAXABLE_VALUE
        , (CAST(v.APPRAISED_VALUE AS DECIMAL) - IF(e.EXEMPT_VALUE IS NOT NULL, e.EXEMPT_VALUE, 0)) 
            * IF(j.TAX_RATE IS NOT NULL, j.TAX_RATE, 0) / 100                                       AS TAXES
    FROM stg_HCAD_JUR_VALUE v
    LEFT JOIN D_JURISDICTION j
        ON v.TAX_DISTRICT = j.JURISDICTION_CODE AND j.DATASET = 'Harris'
    LEFT JOIN D_JURISDICTION_EXEMPT e
        ON CONCAT("11", SUBSTR(CONCAT('0000000000000000',
            TRIM(v.ACCOUNT)
        ), -16)) = e.ACCOUNT_ID AND j.JURISDICTION_ID = e.JURISDICTION_ID 
        -- AND v.SNAPSHOT_YEAR = e.TAX_YEAR
),

TRAVIS_TAXES AS (
    SELECT
        CONCAT("21", SUBSTR(CONCAT('0000000000000000', 
            e.PROP_ID
        ), -16))                                                                                    AS ACCOUNT_ID
        , CONCAT("22", SUBSTR(CONCAT('0000000000000000', 
            e.ENTITY_ID
        ), -16))                                                                                    AS JURISDICTION_ID
        , e.ASSESSED_VAL                                                                            AS APPRAISED_VALUE
        , e.TAXABLE_VAL                                                                             AS TAXABLE_VALUE
        , IF(e.TAXABLE_VAL IS NOT NULL, e.TAXABLE_VAL, 0)
            * IF(j.TAX_RATE IS NOT NULL, j.TAX_RATE, 0) / 100                                       AS TAXES
    FROM stg_TCAD_PROP_ENT e
    LEFT JOIN D_JURISDICTION j
        -- Should you do code here? 
        ON CONCAT("22", SUBSTR(CONCAT('0000000000000000',
            e.ENTITY_ID
        ), -16)) = j.JURISDICTION_ID
)

SELECT
    ACCOUNT_ID
    , JURISDICTION_ID
    , CAST(APPRAISED_VALUE AS DOUBLE)           AS APPRAISED_VALUE
    , CAST(TAXABLE_VALUE AS DOUBLE)             AS TAXABLE_VALUE
    , CAST(TAXES AS DOUBLE)                     AS TAXES    
    , '2017'    AS TAX_YEAR
    , 'Harris'   AS DATASET
FROM HARIS_TAXES 
UNION ALL
SELECT
    ACCOUNT_ID
    , JURISDICTION_ID
    , CAST(APPRAISED_VALUE AS DOUBLE)           AS APPRAISED_VALUE
    , CAST(TAXABLE_VALUE AS DOUBLE)             AS TAXABLE_VALUE
    , CAST(TAXES AS DOUBLE)                     AS TAXES    
    , '2017'    AS TAX_YEAR
    , 'Travis'  AS DATASET
FROM TRAVIS_TAXES
;

DROP TABLE IF EXISTS D_OWNER;
CREATE TABLE D_OWNER 
STORED AS AVRO
LOCATION '${hiveconf:prp_dir}/D_OWNER'
AS 
SELECT
    CONCAT("13", SUBSTR(CONCAT('0000000000000000', 
        CAST(ROW_NUMBER() OVER(ORDER BY MAILTO) AS STRING)
    ), -16))                                                AS OWNER_ID
    , MAILTO                                                AS NAME
    , MAIL_COUNTRY                                          AS COUNTRY
    , MAIL_STATE                                            AS STATE
    , MAIL_CITY                                             AS CITY
    , MAIL_ZIP                                              AS ZIP
    , CONCAT_WS(' ', MAIL_ADDR_1, MAIL_ADDR_2)              AS ADDRESS
    , '2017'                                                AS TAX_YEAR
    , 'Harris'                                              AS DATASET
FROM stg_HCAD_REAL_ACCT
GROUP BY
    MAILTO
    , MAIL_COUNTRY
    , MAIL_STATE
    , MAIL_CITY
    , MAIL_ZIP
    , CONCAT_WS(' ', MAIL_ADDR_1, MAIL_ADDR_2)
UNION ALL 
SELECT DISTINCT 
    CONCAT("23", SUBSTR(CONCAT('0000000000000000', 
        CAST(PY_OWNER_ID AS STRING)
    ), -16))                                                        AS OWNER_ID
    , PY_OWNER_NAME                                                 AS NAME
    , PY_ADDR_COUNTRY                                               AS COUNTRY
    , PY_ADDR_STATE                                                 AS STATE
    , PY_ADDR_CITY                                                  AS CITY
    , PY_ADDR_ZIP                                                   AS ZIP
    , CONCAT_WS(' ', PY_ADDR_LINE1, PY_ADDR_LINE2, PY_ADDR_LINE3)   AS ADDRESS
    , '2017'                                                        AS TAX_YEAR
    , 'Travis'                                                      AS DATASET
FROM stg_TCAD_PROP
;

DROP TABLE IF EXISTS D_PROPERTY;
CREATE TABLE D_PROPERTY 
STORED AS AVRO
LOCATION '${hiveconf:prp_dir}/D_PROPERTY'
AS
WITH TAXES AS (
    SELECT 
        ACCOUNT_ID
        , SUM(TAXES) AS TOTAL_TAXES
    FROM D_JURISDICTION_TAX_VALUES 
    GROUP BY ACCOUNT_ID
)

SELECT
    CONCAT("11", SUBSTR(CONCAT('0000000000000000', 
            TRIM(a.ACCOUNT)
        ), -16))                                                                        AS ACCOUNT_ID
    , o.OWNER_ID                                                                        AS OWNER_ID
    , CONCAT_WS(' ', a.LEGAL_DSCR_1, a.LEGAL_DSCR_2, a.LEGAL_DSCR_3, a.LEGAL_DSCR_4)    AS PROPERTY_DESCRIPTION
    , a.SITE_ADDR_2                                                                     AS CITY
    , a.SITE_ADDR_3                                                                     AS ZIP
    , a.SITE_ADDR_1                                                                     AS ADDRESS
    , a.YR_IMPR                                                                         AS YEAR_BUILT
    , CAST(a.TOTAL_LAND_AREA AS DOUBLE)                                                 AS TOTAL_LAND_AREA
    , CAST(a.TOTAL_BUILDING_AREA AS DOUBLE)                                             AS TOTAL_BUILDING_AREA
    , CAST(a.LAND_VALUE AS DOUBLE)                                                      AS LAND_VALUE
    , CAST(a.IMPROVEMENT_VALUE AS DOUBLE)                                               AS IMPROVEMENT_VALUE
    , CAST(a.EXTRA_FEATURES_VALUE AS DOUBLE)                                            AS EXTRA_FEATURES_VALUE
    , CAST(a.ASSESSED_VALUE AS DOUBLE)                                                  AS ASSESSED_VALUE
    , CAST(a.TOTAL_APPRAISED_VALUE AS DOUBLE)                                           AS APPRAISED_VALUE
    , '2017'                                                                            AS TAX_YEAR
    , 'Harris'                                                                          AS DATASET
    , t.TOTAL_TAXES                                                                     AS TOTAL_TAXES
FROM stg_HCAD_REAL_ACCT a
LEFT JOIN D_OWNER o
    ON a.MAILTO = o.NAME
    AND a.MAIL_COUNTRY = o.COUNTRY
    AND a.MAIL_STATE = o.STATE
    AND a.MAIL_CITY = o.CITY 
    AND a.MAIL_ZIP = o.ZIP
    AND CONCAT_WS(' ', a.MAIL_ADDR_1, a.MAIL_ADDR_2) = o.ADDRESS
LEFT JOIN TAXES t
    ON CONCAT("11", SUBSTR(CONCAT('0000000000000000', 
            TRIM(a.ACCOUNT)
        ), -16)) = TRIM(t.ACCOUNT_ID)
UNION ALL
SELECT
    CONCAT("21", SUBSTR(CONCAT('0000000000000000', 
        CAST(p.PROP_ID AS STRING)
    ), -16))                                                                            AS ACCOUNT_ID
    , CONCAT("23", SUBSTR(CONCAT('0000000000000000', 
        CAST(p.PY_OWNER_ID AS STRING)
    ), -16))                                                                            AS OWNER_ID
    , CONCAT_WS(' ', p.LEGAL_DESC, p.LEGAL_DESC2)                                       AS PROPERTY_DESCRIPTION
    , p.SITUS_CITY                                                                      AS CITY
    , p.SITUS_ZIP                                                                       AS ZIP
    , CONCAT_WS(' ', p.SITUS_NUM, p.SITUS_UNIT, p.SITUS_STREET_PREFX, 
        p.SITUS_STREET, p.SITUS_STREET_SUFFIX)                                          AS ADDRESS
    , NULL                                                                              AS YEAR_BUILT
    , CAST(p.LAND_ACRES AS DOUBLE)                                                      AS TOTAL_LAND_AREA
    , CAST(NULL AS DOUBLE)                                                              AS TOTAL_BUILDING_AREA
    , CAST(p.LAND_HSTD_VAL + p.LAND_NON_HSTD_VAL AS DOUBLE)                             AS LAND_VALUE
    , CAST(p.IMPRV_HSTD_VAL + p.IMPRV_NON_HSTD_VAL AS DOUBLE)                           AS IMPROVEMENT_VALUE
    , CAST(NULL AS DOUBLE)                                                              AS EXTRA_FEATURES_VALUE
    , CAST(p.ASSESSED_VAL AS DOUBLE)                                                    AS ASSESSED_VALUE
    , CAST(p.APPRAISED_VAL AS DOUBLE)                                                   AS APPRAISED_VALUE
    , CAST(p.PROP_VAL_YR AS STRING)                                                     AS TAX_YEAR
    , 'Travis'                                                                          AS DATASET
    , t.TOTAL_TAXES                                                                     AS TOTAL_TAXES
FROM stg_TCAD_PROP p
LEFT JOIN TAXES t
    ON CONCAT("21", SUBSTR(CONCAT('0000000000000000', 
        CAST(p.PROP_ID AS STRING)
    ), -16)) = t.ACCOUNT_ID
;

-- X4 - Zip
-- X5 - Street
-- X6 - Neighborhood
-- X7 - School 
DROP TABLE IF EXISTS D_PROPERTY_GROUPS;
CREATE TABLE D_PROPERTY_GROUPS
STORED AS AVRO
LOCATION '${hiveconf:prp_dir}/D_PROPERTY_GROUPS'
AS 
-- Zip
SELECT
    CONCAT("14", SUBSTR(CONCAT('0000000000000000', 
        CAST(ROW_NUMBER() OVER(ORDER BY SITE_ADDR_3) AS STRING)
    ), -16))                                                AS GROUP_ID
    , SITE_ADDR_3                                           AS GROUP_NAME
    , 'By ZIP'                                              AS GROUP_TYPE
    , '2017'                                                AS TAX_YEAR
    , 'Harris'                                              AS DATASET
FROM stg_HCAD_REAL_ACCT
GROUP BY
    SITE_ADDR_3
UNION ALL
SELECT
    CONCAT("24", SUBSTR(CONCAT('0000000000000000', 
        CAST(ROW_NUMBER() OVER(ORDER BY SITUS_ZIP) AS STRING)
    ), -16))                                                AS GROUP_ID
    , SITUS_ZIP                                             AS GROUP_NAME
    , 'By ZIP'                                              AS GROUP_TYPE
    , '2017'                                                AS TAX_YEAR
    , 'Travis'                                              AS DATASET
FROM stg_TCAD_PROP
GROUP BY
    SITUS_ZIP
-- Street
UNION ALL
SELECT
    CONCAT("15", SUBSTR(CONCAT('0000000000000000', 
        CAST(ROW_NUMBER() OVER(ORDER BY STR_NAME) AS STRING)
    ), -16))                                                AS GROUP_ID
    , STR_NAME                                              AS GROUP_NAME
    , 'By Street'                                           AS GROUP_TYPE
    , '2017'                                                AS TAX_YEAR
    , 'Harris'                                              AS DATASET
FROM stg_HCAD_REAL_ACCT
GROUP BY
    STR_NAME
UNION ALL
SELECT
    CONCAT("25", SUBSTR(CONCAT('0000000000000000', 
        CAST(ROW_NUMBER() OVER(ORDER BY SITUS_STREET) AS STRING)
    ), -16))                                               AS GROUP_ID
    , SITUS_STREET                                         AS GROUP_NAME
    , 'By Street'                                          AS GROUP_TYPE
    , '2017'                                               AS TAX_YEAR
    , 'Travis'                                             AS DATASET
FROM stg_TCAD_PROP
GROUP BY
    SITUS_STREET
-- Neighborhood
UNION ALL
SELECT
    CONCAT("16", SUBSTR(CONCAT('0000000000000000', 
        CAST(ROW_NUMBER() OVER(ORDER BY NEIGHBORHOOD, CODE) AS STRING)
    ), -16))                                                AS GROUP_ID
    , TRIM(CONCAT_WS(' ', collect_list(DESCRIPTION)))       AS GROUP_NAME
    , 'By Neighborhood'                                     AS GROUP_TYPE
    , '2017'                                                AS TAX_YEAR
    , 'Harris'                                              AS DATASET
FROM D_HARIS_NEIGHBORHOOD_DICT
GROUP BY NEIGHBORHOOD, CODE
UNION ALL
SELECT
    CONCAT("26", SUBSTR(CONCAT('0000000000000000', 
        CAST(ROW_NUMBER() OVER(ORDER BY HOOD_CD) AS STRING)
    ), -16))                                               AS GROUP_ID
    , HOOD_CD                                              AS GROUP_NAME
    , 'By Neighborhood'                                    AS GROUP_TYPE
    , '2017'                                               AS TAX_YEAR
    , 'Travis'                                             AS DATASET
FROM stg_TCAD_PROP
GROUP BY
    HOOD_CD
-- School
UNION ALL
SELECT
    CONCAT("17", SUBSTR(CONCAT('0000000000000000', 
        CAST(ROW_NUMBER() OVER(ORDER BY SCHOOL_DIST) AS STRING)
    ), -16))                                               AS GROUP_ID
    , SCHOOL_DIST                                          AS GROUP_NAME
    , 'By School'                                          AS GROUP_TYPE
    , '2017'                                               AS TAX_YEAR
    , 'Harris'                                             AS DATASET
FROM stg_HCAD_REAL_ACCT
GROUP BY
    SCHOOL_DIST
;

DROP TABLE IF EXISTS B_PROPERTY_GROUPS_MAPPING;
CREATE TABLE B_PROPERTY_GROUPS_MAPPING
STORED AS AVRO
LOCATION '${hiveconf:prp_dir}/B_PROPERTY_GROUPS_MAPPING'
AS 
SELECT 
    p.ACCOUNT_ID
    , g.GROUP_ID
FROM D_PROPERTY p
JOIN D_PROPERTY_GROUPS g
    ON p.ZIP = g.GROUP_NAME AND g.GROUP_TYPE = 'By ZIP'
UNION ALL
SELECT 
    CONCAT("11", SUBSTR(CONCAT('0000000000000000', 
            TRIM(a.ACCOUNT)
        ), -16))                                                                        AS ACCOUNT_ID
    , g.GROUP_ID
FROM stg_HCAD_REAL_ACCT a
JOIN D_PROPERTY_GROUPS g
    ON a.STR_NAME = g.GROUP_NAME AND g.GROUP_TYPE = 'By Street' AND g.DATASET = 'Harris'
UNION ALL
SELECT 
    CONCAT("21", SUBSTR(CONCAT('0000000000000000', 
        CAST(p.PROP_ID AS STRING)
    ), -16))                                                                            AS ACCOUNT_ID
    , g.GROUP_ID
FROM stg_TCAD_PROP p
JOIN D_PROPERTY_GROUPS g
    ON p.SITUS_STREET = g.GROUP_NAME AND g.GROUP_TYPE = 'By Street' AND g.DATASET = 'Travis'
UNION ALL
SELECT
    CONCAT("11", SUBSTR(CONCAT('0000000000000000', 
            TRIM(a.ACCOUNT)
        ), -16))                                                                        AS ACCOUNT_ID
    , CONCAT("16", SUBSTR(CONCAT('0000000000000000', 
        CAST(ROW_NUMBER() OVER(ORDER BY NEIGHBORHOOD, CODE) AS STRING)
    ), -16))                                                                            AS GROUP_ID
FROM stg_HCAD_REAL_ACCT a
JOIN D_HARIS_NEIGHBORHOOD_DICT g
    ON a.NEIGHBORHOOD_CODE = g.NEIGHBORHOOD AND a.NEIGHBORHOOD_GROUP = g.CODE
UNION ALL
SELECT 
    CONCAT("21", SUBSTR(CONCAT('0000000000000000', 
        CAST(p.PROP_ID AS STRING)
    ), -16))                                                                           AS ACCOUNT_ID
    , g.GROUP_ID
FROM stg_TCAD_PROP p
JOIN D_PROPERTY_GROUPS g
    ON p.HOOD_CD = g.GROUP_NAME AND g.GROUP_TYPE = 'By Neighborhood' AND g.DATASET = 'Travis'
UNION ALL
SELECT
    CONCAT("11", SUBSTR(CONCAT('0000000000000000', 
            TRIM(a.ACCOUNT)
        ), -16))                                                                       AS ACCOUNT_ID
    , g.GROUP_ID
FROM stg_HCAD_REAL_ACCT a
JOIN D_PROPERTY_GROUPS g
    ON a.SCHOOL_DIST = g.GROUP_NAME AND g.GROUP_TYPE = 'By School' AND g.DATASET = 'Harris'
;