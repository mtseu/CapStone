-- the script copies PROP_ENT TCAD table from raw fixed field width ASCII file
-- to staging

DROP TABLE IF EXISTS raw_tcad_prop_ent;
DROP TABLE IF EXISTS stg_tcad_prop_ent;

CREATE EXTERNAL TABLE raw_tcad_prop_ent (
    prop_id	BIGINT,
    prop_val_yr	DECIMAL(5),
    sup_num	BIGINT,
    owner_id	BIGINT,
    entity_id	BIGINT,
    entity_cd	VARCHAR(10),
    entity_name	VARCHAR(50),
    entity_xref_id	VARCHAR(20),
    filler	VARCHAR(15),
    assessed_val	DECIMAL(15),
    taxable_val	DECIMAL(15),
    ab_amt	DECIMAL(15),
    en_amt	DECIMAL(15),
    fr_amt	DECIMAL(15),
    ht_amt	DECIMAL(15),
    pro_amt	DECIMAL(15),
    pc_amt	DECIMAL(15),
    so_amt	DECIMAL(15),
    ex366_amt	DECIMAL(15),
    hs_amt	DECIMAL(15),
    ov65_amt	DECIMAL(15),
    dp_amt	DECIMAL(15),
    dv_amt	DECIMAL(15),
    ex_amt	DECIMAL(15),
    ch_amt	DECIMAL(15),
    market_value	DECIMAL(15),
    appraised_value	DECIMAL(15),
    hs_cap	DECIMAL(15),
    ag_late_loss	DECIMAL(15),
    freeport_late_loss	DECIMAL(15),
    hs_state_amt	DECIMAL(15),
    hs_local_amt	DECIMAL(15),
    land_hstd_val	DECIMAL(15),
    land_non_hstd_val	DECIMAL(15),
    imprv_hstd_val	DECIMAL(15),
    imprv_non_hstd_val	DECIMAL(15),
    ag_use_val	DECIMAL(15),
    ag_market_val	DECIMAL(15),
    tim_use_val	DECIMAL(15),
    tim_market_val	DECIMAL(15),
    partial_entity	VARCHAR(1),
    freeze_yr	DECIMAL(4),
    freeze_ceiling	DECIMAL(15),
    freeze_transfer_flag	VARCHAR(1),
    freeze_transfer_date	VARCHAR(25),
    freeze_previous_tax	DECIMAL(15),
    freeze_previous_tax_unfrozen	DECIMAL(15),
    freeze_transfer_percentage	DECIMAL(37,18),
    lve_amt	DECIMAL(15),
    eco_amt	DECIMAL(15),
    ag_use_val_ne	DECIMAL(15),
    ag_use_val_ex	DECIMAL(15),
    ag_market_ne	DECIMAL(15),
    ag_market_ex	DECIMAL(15),
    timber_use_ne	DECIMAL(15),
    timber_use_ex	DECIMAL(15),
    timber_market_ne	DECIMAL(15),
    timber_market_ex	DECIMAL(15),
    new_val_hs	DECIMAL(15),
    new_val_nhs	DECIMAL(15),
    new_val_p	DECIMAL(15),
    new_val_taxable	DECIMAL(15),
    dataset_id	DECIMAL(15),
    chodo_amt	DECIMAL(15),
    ent_pct_land_hs	DECIMAL(15),
    ent_pct_land_nonhs	DECIMAL(15),
    ent_pct_imprv_hs	DECIMAL(15),
    ent_pct_imprv_nonhs	DECIMAL(15),
    ent_pct_ag_use	DECIMAL(15),
    ent_pct_ag_mkt	DECIMAL(15),
    ent_pct_tim_use	DECIMAL(15),
    ent_pct_tim_mkt	DECIMAL(15),
    ent_pct_pers	DECIMAL(15),
    ent_pct_min	DECIMAL(15),
    ent_pct_auto	DECIMAL(15),
    lih_amt	DECIMAL(15),
    git_amt	DECIMAL(15),
    dvhs_amt	DECIMAL(15),
    tax_increment_flag	VARCHAR(1),
    tax_increment_imprv_val	DECIMAL(15),
    tax_increment_land_val	DECIMAL(15),
    weed_taxable_acres	DECIMAL(15),
    hs_allocation_factor	DECIMAL(15),
    ov65_allocation_factor	DECIMAL(15),
    ov65s_allocation_factor	DECIMAL(15),
    dp_allocation_factor	DECIMAL(15),
    dps_allocation_factor	DECIMAL(15),
    dv1_allocation_factor	DECIMAL(15),
    dv1s_allocation_factor	DECIMAL(15),
    dv2_allocation_factor	DECIMAL(15),
    dv2s_allocation_factor	DECIMAL(15),
    dv3_allocation_factor	DECIMAL(15),
    dv3s_allocation_factor	DECIMAL(15),
    dv4_allocation_factor	DECIMAL(15),
    dv4s_allocation_factor	DECIMAL(15),
    dvhs_allocation_factor	DECIMAL(15),
    ex_allocation_factor	DECIMAL(15),
    ab_allocation_factor	DECIMAL(15),
    en_allocation_factor	DECIMAL(15),
    fr_allocation_factor	DECIMAL(15),
    ht_allocation_factor	DECIMAL(15),
    pro_allocation_factor	DECIMAL(15),
    pc_allocation_factor	DECIMAL(15),
    so_allocation_factor	DECIMAL(15),
    ex366_allocation_factor	DECIMAL(15),
    ch_allocation_factor	DECIMAL(15),
    eco_allocation_factor	DECIMAL(15),
    chodo_allocation_factor	DECIMAL(15),
    lih_allocation_factor	DECIMAL(15),
    git_allocation_factor	DECIMAL(15),
    freeze_exmpt_type_cd	VARCHAR(5),
    freeze_transfer_exmpt_type_cd	VARCHAR(5),
    tax_increment_zone_cd	VARCHAR(10),
    tax_increment_zone_desc	VARCHAR(50),
    omitted_imprv_hstd_val	DECIMAL(15),
    omitted_imprv_non_hstd_val	DECIMAL(15),
    clt_amt	DECIMAL(15),
    clt_allocation_factor	DECIMAL(15),
    dvhss_amt	DECIMAL(15),
    dvhss_allocation_factor	DECIMAL(15),
    homestead_group_exemption_factor	DECIMAL(15),
    ex_xd_amt	DECIMAL(15),
    ex_xd_allocation_factor	DECIMAL(15),
    ex_xf_amt	DECIMAL(15),
    ex_xf_allocation_factor	DECIMAL(15),
    ex_xg_amt	DECIMAL(15),
    ex_xg_allocation_factor	DECIMAL(15),
    ex_xh_amt	DECIMAL(15),
    ex_xh_allocation_factor	DECIMAL(15),
    ex_xi_amt	DECIMAL(15),
    ex_xi_allocation_factor	DECIMAL(15),
    ex_xj_amt	DECIMAL(15),
    ex_xj_allocation_factor	DECIMAL(15),
    ex_xl_amt	DECIMAL(15),
    ex_xl_allocation_factor	DECIMAL(15),
    ex_xm_amt	DECIMAL(15),
    ex_xm_allocation_factor	DECIMAL(15),
    ex_xn_amt	DECIMAL(15),
    ex_xn_allocation_factor	DECIMAL(15),
    ex_xo_amt	DECIMAL(15),
    ex_xo_allocation_factor	DECIMAL(15),
    ex_xp_amt	DECIMAL(15),
    ex_xp_allocation_factor	DECIMAL(15),
    ex_xq_amt	DECIMAL(15),
    ex_xq_allocation_factor	DECIMAL(15),
    ex_xr_amt	DECIMAL(15),
    ex_xr_allocation_factor	DECIMAL(15),
    ex_xs_amt	DECIMAL(15),
    ex_xs_allocation_factor	DECIMAL(15),
    ex_xt_amt	DECIMAL(15),
    ex_xt_allocation_factor	DECIMAL(15),
    ex_xu_amt	DECIMAL(15),
    ex_xu_allocation_factor	DECIMAL(15),
    ex_xv_amt	DECIMAL(15),
    ex_xv_allocation_factor	DECIMAL(15),
    ex_xa_amt	DECIMAL(15),
    ex_xa_allocation_factor	DECIMAL(15),
    lve_allocation_factor	DECIMAL(15),
    ppv_amt	DECIMAL(15),
    ppv_allocation_factor	DECIMAL(15),
    dvch_amt	DECIMAL(15),
    dvch_allocation_factor	DECIMAL(15),
    dvchs_amt	DECIMAL(15),
    dvchs_allocation_factor	DECIMAL(15),
    masss_amt	DECIMAL(15),
    masss_allocation_factor	DECIMAL(15),
    pp_late_interstate_allocation_val	DECIMAL(15)    
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.RegexSerDe'
WITH SERDEPROPERTIES (
    "input.regex" = "(.{12})(.{5})(.{12})(.{12})(.{12})(.{10})(.{50})(.{20})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{1})(.{4})(.{15})(.{1})(.{25})(.{15})(.{15})(.{9})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{1})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{5})(.{5})(.{10})(.{50})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})(.{15})"
)
STORED AS TEXTFILE
LOCATION '${hiveconf:raw_dir}/PROP_ENT';

CREATE EXTERNAL TABLE stg_tcad_prop_ent (
    prop_id	BIGINT,
    prop_val_yr	DECIMAL(5),
    sup_num	BIGINT,
    owner_id	BIGINT,
    entity_id	BIGINT,
    entity_cd	VARCHAR(10),
    entity_name	VARCHAR(50),
    entity_xref_id	VARCHAR(20),
    filler	VARCHAR(15),
    assessed_val	DECIMAL(15),
    taxable_val	DECIMAL(15),
    ab_amt	DECIMAL(15),
    en_amt	DECIMAL(15),
    fr_amt	DECIMAL(15),
    ht_amt	DECIMAL(15),
    pro_amt	DECIMAL(15),
    pc_amt	DECIMAL(15),
    so_amt	DECIMAL(15),
    ex366_amt	DECIMAL(15),
    hs_amt	DECIMAL(15),
    ov65_amt	DECIMAL(15),
    dp_amt	DECIMAL(15),
    dv_amt	DECIMAL(15),
    ex_amt	DECIMAL(15),
    ch_amt	DECIMAL(15),
    market_value	DECIMAL(15),
    appraised_value	DECIMAL(15),
    hs_cap	DECIMAL(15),
    ag_late_loss	DECIMAL(15),
    freeport_late_loss	DECIMAL(15),
    hs_state_amt	DECIMAL(15),
    hs_local_amt	DECIMAL(15),
    land_hstd_val	DECIMAL(15),
    land_non_hstd_val	DECIMAL(15),
    imprv_hstd_val	DECIMAL(15),
    imprv_non_hstd_val	DECIMAL(15),
    ag_use_val	DECIMAL(15),
    ag_market_val	DECIMAL(15),
    tim_use_val	DECIMAL(15),
    tim_market_val	DECIMAL(15),
    partial_entity	VARCHAR(1),
    freeze_yr	DECIMAL(4),
    freeze_ceiling	DECIMAL(15),
    freeze_transfer_flag	VARCHAR(1),
    freeze_transfer_date	VARCHAR(25),
    freeze_previous_tax	DECIMAL(15),
    freeze_previous_tax_unfrozen	DECIMAL(15),
    freeze_transfer_percentage	DECIMAL(37,18),
    lve_amt	DECIMAL(15),
    eco_amt	DECIMAL(15),
    ag_use_val_ne	DECIMAL(15),
    ag_use_val_ex	DECIMAL(15),
    ag_market_ne	DECIMAL(15),
    ag_market_ex	DECIMAL(15),
    timber_use_ne	DECIMAL(15),
    timber_use_ex	DECIMAL(15),
    timber_market_ne	DECIMAL(15),
    timber_market_ex	DECIMAL(15),
    new_val_hs	DECIMAL(15),
    new_val_nhs	DECIMAL(15),
    new_val_p	DECIMAL(15),
    new_val_taxable	DECIMAL(15),
    dataset_id	DECIMAL(15),
    chodo_amt	DECIMAL(15),
    ent_pct_land_hs	DECIMAL(15),
    ent_pct_land_nonhs	DECIMAL(15),
    ent_pct_imprv_hs	DECIMAL(15),
    ent_pct_imprv_nonhs	DECIMAL(15),
    ent_pct_ag_use	DECIMAL(15),
    ent_pct_ag_mkt	DECIMAL(15),
    ent_pct_tim_use	DECIMAL(15),
    ent_pct_tim_mkt	DECIMAL(15),
    ent_pct_pers	DECIMAL(15),
    ent_pct_min	DECIMAL(15),
    ent_pct_auto	DECIMAL(15),
    lih_amt	DECIMAL(15),
    git_amt	DECIMAL(15),
    dvhs_amt	DECIMAL(15),
    tax_increment_flag	VARCHAR(1),
    tax_increment_imprv_val	DECIMAL(15),
    tax_increment_land_val	DECIMAL(15),
    weed_taxable_acres	DECIMAL(15),
    hs_allocation_factor	DECIMAL(15),
    ov65_allocation_factor	DECIMAL(15),
    ov65s_allocation_factor	DECIMAL(15),
    dp_allocation_factor	DECIMAL(15),
    dps_allocation_factor	DECIMAL(15),
    dv1_allocation_factor	DECIMAL(15),
    dv1s_allocation_factor	DECIMAL(15),
    dv2_allocation_factor	DECIMAL(15),
    dv2s_allocation_factor	DECIMAL(15),
    dv3_allocation_factor	DECIMAL(15),
    dv3s_allocation_factor	DECIMAL(15),
    dv4_allocation_factor	DECIMAL(15),
    dv4s_allocation_factor	DECIMAL(15),
    dvhs_allocation_factor	DECIMAL(15),
    ex_allocation_factor	DECIMAL(15),
    ab_allocation_factor	DECIMAL(15),
    en_allocation_factor	DECIMAL(15),
    fr_allocation_factor	DECIMAL(15),
    ht_allocation_factor	DECIMAL(15),
    pro_allocation_factor	DECIMAL(15),
    pc_allocation_factor	DECIMAL(15),
    so_allocation_factor	DECIMAL(15),
    ex366_allocation_factor	DECIMAL(15),
    ch_allocation_factor	DECIMAL(15),
    eco_allocation_factor	DECIMAL(15),
    chodo_allocation_factor	DECIMAL(15),
    lih_allocation_factor	DECIMAL(15),
    git_allocation_factor	DECIMAL(15),
    freeze_exmpt_type_cd	VARCHAR(5),
    freeze_transfer_exmpt_type_cd	VARCHAR(5),
    tax_increment_zone_cd	VARCHAR(10),
    tax_increment_zone_desc	VARCHAR(50),
    omitted_imprv_hstd_val	DECIMAL(15),
    omitted_imprv_non_hstd_val	DECIMAL(15),
    clt_amt	DECIMAL(15),
    clt_allocation_factor	DECIMAL(15),
    dvhss_amt	DECIMAL(15),
    dvhss_allocation_factor	DECIMAL(15),
    homestead_group_exemption_factor	DECIMAL(15),
    ex_xd_amt	DECIMAL(15),
    ex_xd_allocation_factor	DECIMAL(15),
    ex_xf_amt	DECIMAL(15),
    ex_xf_allocation_factor	DECIMAL(15),
    ex_xg_amt	DECIMAL(15),
    ex_xg_allocation_factor	DECIMAL(15),
    ex_xh_amt	DECIMAL(15),
    ex_xh_allocation_factor	DECIMAL(15),
    ex_xi_amt	DECIMAL(15),
    ex_xi_allocation_factor	DECIMAL(15),
    ex_xj_amt	DECIMAL(15),
    ex_xj_allocation_factor	DECIMAL(15),
    ex_xl_amt	DECIMAL(15),
    ex_xl_allocation_factor	DECIMAL(15),
    ex_xm_amt	DECIMAL(15),
    ex_xm_allocation_factor	DECIMAL(15),
    ex_xn_amt	DECIMAL(15),
    ex_xn_allocation_factor	DECIMAL(15),
    ex_xo_amt	DECIMAL(15),
    ex_xo_allocation_factor	DECIMAL(15),
    ex_xp_amt	DECIMAL(15),
    ex_xp_allocation_factor	DECIMAL(15),
    ex_xq_amt	DECIMAL(15),
    ex_xq_allocation_factor	DECIMAL(15),
    ex_xr_amt	DECIMAL(15),
    ex_xr_allocation_factor	DECIMAL(15),
    ex_xs_amt	DECIMAL(15),
    ex_xs_allocation_factor	DECIMAL(15),
    ex_xt_amt	DECIMAL(15),
    ex_xt_allocation_factor	DECIMAL(15),
    ex_xu_amt	DECIMAL(15),
    ex_xu_allocation_factor	DECIMAL(15),
    ex_xv_amt	DECIMAL(15),
    ex_xv_allocation_factor	DECIMAL(15),
    ex_xa_amt	DECIMAL(15),
    ex_xa_allocation_factor	DECIMAL(15),
    lve_allocation_factor	DECIMAL(15),
    ppv_amt	DECIMAL(15),
    ppv_allocation_factor	DECIMAL(15),
    dvch_amt	DECIMAL(15),
    dvch_allocation_factor	DECIMAL(15),
    dvchs_amt	DECIMAL(15),
    dvchs_allocation_factor	DECIMAL(15),
    masss_amt	DECIMAL(15),
    masss_allocation_factor	DECIMAL(15),
    pp_late_interstate_allocation_val	DECIMAL(15)    
)
STORED AS AVRO
LOCATION '${hiveconf:stg_dir}/PROP_ENT';

INSERT OVERWRITE TABLE  stg_tcad_prop_ent 
SELECT e.* FROM raw_tcad_prop_ent e
LEFT SEMI JOIN stg_tcad_prop p 
ON e.prop_id = p.prop_id
;
