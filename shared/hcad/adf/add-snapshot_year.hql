
CREATE EXTERNAL TABLE IF NOT EXIST arb_hearings_pp (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/arb_hearings_pp';

CREATE EXTERNAL TABLE arb_hearings_pp_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/arb_hearings_pp';
INSERT OVERWITE TABLE arb_hearings_pp_all SELECT concat(the_row,'\t',year) FROM arb_hearings_pp;


CREATE EXTERNAL TABLE IF NOT EXIST arb_hearings_real (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/arb_hearings_real';

CREATE EXTERNAL TABLE arb_hearings_real_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/arb_hearings_real';
INSERT OVERWITE TABLE arb_hearings_real_all SELECT concat(the_row,'\t',year) FROM arb_hearings_real;



CREATE EXTERNAL TABLE IF NOT EXIST arb_protest_pp (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/arb_protest_pp';

CREATE EXTERNAL TABLE arb_protest_pp_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/arb_protest_pp';
INSERT OVERWITE TABLE arb_protest_pp_all SELECT concat(the_row,'\t',year) FROM arb_protest_pp;



CREATE EXTERNAL TABLE IF NOT EXIST arb_protest_real (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/arb_protest_real';

CREATE EXTERNAL TABLE arb_protest_real_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/arb_protest_real';
INSERT OVERWITE TABLE arb_protest_real_all SELECT concat(the_row,'\t',year) FROM arb_protest_real;



CREATE EXTERNAL TABLE IF NOT EXIST building_other (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/building_other';

CREATE EXTERNAL TABLE building_other_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/building_other';
INSERT OVERWITE TABLE building_other_all SELECT concat(the_row,'\t',year) FROM building_other;



CREATE EXTERNAL TABLE IF NOT EXIST building_res (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/building_res';

CREATE EXTERNAL TABLE building_res_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/building_res';
INSERT OVERWITE TABLE building_res_all SELECT concat(the_row,'\t',year) FROM building_res;



CREATE EXTERNAL TABLE IF NOT EXIST deeds (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/deeds';

CREATE EXTERNAL TABLE deeds_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/deeds';
INSERT OVERWITE TABLE deeds_all SELECT concat(the_row,'\t',year) FROM deeds;



CREATE EXTERNAL TABLE IF NOT EXIST exterior (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/exterior';

CREATE EXTERNAL TABLE exterior_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/exterior';
INSERT OVERWITE TABLE exterior_all SELECT concat(the_row,'\t',year) FROM exterior;



CREATE EXTERNAL TABLE IF NOT EXIST extra_features (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/extra_features';

CREATE EXTERNAL TABLE extra_features_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/extra_features';
INSERT OVERWITE TABLE extra_features_all SELECT concat(the_row,'\t',year) FROM extra_features;



CREATE EXTERNAL TABLE IF NOT EXIST extra_features_detail1 (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/extra_features_detail1';

CREATE EXTERNAL TABLE extra_features_detail1_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/extra_features_detail1';
INSERT OVERWITE TABLE extra_features_detail1_all SELECT concat(the_row,'\t',year) FROM extra_features_detail1;



CREATE EXTERNAL TABLE IF NOT EXIST extra_features_detail2 (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/extra_features_detail2';

CREATE EXTERNAL TABLE extra_features_detail2_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/extra_features_detail2';
INSERT OVERWITE TABLE extra_features_detail2_all SELECT concat(the_row,'\t',year) FROM extra_features_detail2;



CREATE EXTERNAL TABLE IF NOT EXIST fixtures (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/fixtures';

CREATE EXTERNAL TABLE fixtures_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/fixtures';
INSERT OVERWITE TABLE fixtures_all SELECT concat(the_row,'\t',year) FROM fixtures;



CREATE EXTERNAL TABLE IF NOT EXIST jur_exempt (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/jur_exempt';

CREATE EXTERNAL TABLE jur_exempt_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/jur_exempt';
INSERT OVERWITE TABLE jur_exempt_all SELECT concat(the_row,'\t',year) FROM jur_exempt;



CREATE EXTERNAL TABLE IF NOT EXIST jur_exempt_cd (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/jur_exempt_cd';

CREATE EXTERNAL TABLE jur_exempt_cd_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/jur_exempt_cd';
INSERT OVERWITE TABLE jur_exempt_cd_all SELECT concat(the_row,'\t',year) FROM jur_exempt_cd;



CREATE EXTERNAL TABLE IF NOT EXIST jur_exemption_dscr (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/jur_exemption_dscr';

CREATE EXTERNAL TABLE jur_exemption_dscr_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/jur_exemption_dscr';
INSERT OVERWITE TABLE jur_exemption_dscr_all SELECT concat(the_row,'\t',year) FROM jur_exemption_dscr;



CREATE EXTERNAL TABLE IF NOT EXIST jur_tax_dist_exempt_value (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/jur_tax_dist_exempt_value';

CREATE EXTERNAL TABLE jur_tax_dist_exempt_value_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/jur_tax_dist_exempt_value';
INSERT OVERWITE TABLE jur_tax_dist_exempt_value_all SELECT concat(the_row,'\t',year) FROM jur_tax_dist_exempt_value;



CREATE EXTERNAL TABLE IF NOT EXIST jur_tax_dist_percent_rate (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/jur_tax_dist_percent_rate';

CREATE EXTERNAL TABLE jur_tax_dist_percent_rate_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/jur_tax_dist_percent_rate';
INSERT OVERWITE TABLE jur_tax_dist_percent_rate_all SELECT concat(the_row,'\t',year) FROM jur_tax_dist_percent_rate;



CREATE EXTERNAL TABLE IF NOT EXIST jur_value (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/jur_value';

CREATE EXTERNAL TABLE jur_value_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/jur_value';
INSERT OVERWITE TABLE jur_value_all SELECT concat(the_row,'\t',year) FROM jur_value;



CREATE EXTERNAL TABLE IF NOT EXIST land (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/land';

CREATE EXTERNAL TABLE land_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/land';
INSERT OVERWITE TABLE land_all SELECT concat(the_row,'\t',year) FROM land;



CREATE EXTERNAL TABLE IF NOT EXIST land_ag (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/land_ag';

CREATE EXTERNAL TABLE land_ag_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/land_ag';
INSERT OVERWITE TABLE land_ag_all SELECT concat(the_row,'\t',year) FROM land_ag;



CREATE EXTERNAL TABLE IF NOT EXIST owners (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/owners';

CREATE EXTERNAL TABLE owners_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/owners';
INSERT OVERWITE TABLE owners_all SELECT concat(the_row,'\t',year) FROM owners;



CREATE EXTERNAL TABLE IF NOT EXIST ownership_history (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/ownership_history';

CREATE EXTERNAL TABLE ownership_history_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/ownership_history';
INSERT OVERWITE TABLE ownership_history_all SELECT concat(the_row,'\t',year) FROM ownership_history;



CREATE EXTERNAL TABLE IF NOT EXIST parcel_tieback (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/parcel_tieback';

CREATE EXTERNAL TABLE parcel_tieback_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/parcel_tieback';
INSERT OVERWITE TABLE parcel_tieback_all SELECT concat(the_row,'\t',year) FROM parcel_tieback;



CREATE EXTERNAL TABLE IF NOT EXIST permits (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/permits';

CREATE EXTERNAL TABLE permits_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/permits';
INSERT OVERWITE TABLE permits_all SELECT concat(the_row,'\t',year) FROM permits;



CREATE EXTERNAL TABLE IF NOT EXIST real_acct (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/real_acct';

CREATE EXTERNAL TABLE real_acct_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/real_acct';
INSERT OVERWITE TABLE real_acct_all SELECT concat(the_row,'\t',year) FROM real_acct;



CREATE EXTERNAL TABLE IF NOT EXIST real_neighborhood_code (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/real_neighborhood_code';

CREATE EXTERNAL TABLE real_neighborhood_code_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/real_neighborhood_code';
INSERT OVERWITE TABLE real_neighborhood_code_all SELECT concat(the_row,'\t',year) FROM real_neighborhood_code;



CREATE EXTERNAL TABLE IF NOT EXIST structural_elem1 (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/structural_elem1';

CREATE EXTERNAL TABLE structural_elem1_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/structural_elem1';
INSERT OVERWITE TABLE structural_elem1_all SELECT concat(the_row,'\t',year) FROM structural_elem1;



CREATE EXTERNAL TABLE IF NOT EXIST structural_elem2 (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/structural_elem2';

CREATE EXTERNAL TABLE structural_elem2_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/structural_elem2';
INSERT OVERWITE TABLE structural_elem2_all SELECT concat(the_row,'\t',year) FROM structural_elem2;



CREATE EXTERNAL TABLE IF NOT EXIST t_business_acct (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/t_business_acct';

CREATE EXTERNAL TABLE t_business_acct_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/t_business_acct';
INSERT OVERWITE TABLE t_business_acct_all SELECT concat(the_row,'\t',year) FROM t_business_acct;



CREATE EXTERNAL TABLE IF NOT EXIST t_business_detail (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/t_business_detail';

CREATE EXTERNAL TABLE t_business_detail_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/t_business_detail';
INSERT OVERWITE TABLE t_business_detail_all SELECT concat(the_row,'\t',year) FROM t_business_detail;



CREATE EXTERNAL TABLE IF NOT EXIST t_jur_exempt (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/t_jur_exempt';

CREATE EXTERNAL TABLE t_jur_exempt_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/t_jur_exempt';
INSERT OVERWITE TABLE t_jur_exempt_all SELECT concat(the_row,'\t',year) FROM t_jur_exempt;



CREATE EXTERNAL TABLE IF NOT EXIST t_jur_tax_dist_exempt_value (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/t_jur_tax_dist_exempt_value';

CREATE EXTERNAL TABLE t_jur_tax_dist_exempt_value_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/t_jur_tax_dist_exempt_value';
INSERT OVERWITE TABLE t_jur_tax_dist_exempt_value_all SELECT concat(the_row,'\t',year) FROM t_jur_tax_dist_exempt_value;



CREATE EXTERNAL TABLE IF NOT EXIST t_jur_tax_dist_percent_rate (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/t_jur_tax_dist_percent_rate';

CREATE EXTERNAL TABLE t_jur_tax_dist_percent_rate_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/t_jur_tax_dist_percent_rate';
INSERT OVERWITE TABLE t_jur_tax_dist_percent_rate_all SELECT concat(the_row,'\t',year) FROM t_jur_tax_dist_percent_rate;



CREATE EXTERNAL TABLE IF NOT EXIST t_jur_value (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/t_jur_value';

CREATE EXTERNAL TABLE t_jur_value_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/t_jur_value';
INSERT OVERWITE TABLE t_jur_value_all SELECT concat(the_row,'\t',year) FROM t_jur_value;



CREATE EXTERNAL TABLE IF NOT EXIST t_pp_c (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/t_pp_c';

CREATE EXTERNAL TABLE t_pp_c_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/t_pp_c';
INSERT OVERWITE TABLE t_pp_c_all SELECT concat(the_row,'\t',year) FROM t_pp_c;



CREATE EXTERNAL TABLE IF NOT EXIST t_pp_e (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/t_pp_e';

CREATE EXTERNAL TABLE t_pp_e_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/t_pp_e';
INSERT OVERWITE TABLE t_pp_e_all SELECT concat(the_row,'\t',year) FROM t_pp_e;



CREATE EXTERNAL TABLE IF NOT EXIST t_pp_l (
    the_row STRING
)
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\001'
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/t_pp_l';

CREATE EXTERNAL TABLE t_pp_l_all ( the_row STRING )
STORED AS TEXTFILE
LOCATION '${hiveconf:src_tab_location}/yeared/t_pp_l';
INSERT OVERWITE TABLE t_pp_l_all SELECT concat(the_row,'\t',year) FROM t_pp_l;



