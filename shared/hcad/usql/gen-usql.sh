function gen_usql {
echo " " > $1.usql
echo " @data = " >> $1.usql
echo " EXTRACT the_row string, year string " >> $1.usql
echo " FROM \"wasb://hcad-all@edapblob/{year}/${1}.txt\" " >> $1.usql
echo " USING Extractors.Text(delimiter: '\\u0001', encoding: Encoding.[UTF8]); " >> $1.usql
echo "  " >> $1.usql
echo " @yeared = SELECT String.Concat(the_row, \"\\t\", year) AS yeared_row FROM @data; " >> $1.usql
echo "  " >> $1.usql
echo " OUTPUT @yeared " >> $1.usql
echo "     TO \"adl://edapadls.azuredatalake.net/data/stage/mtseu/hcad/${1}.txt\" " >> $1.usql
echo "     USING Outputters.Text(quoting: false, delimiter: '\u0001'); " >> $1.usql
}

list=`cat << EOF
arb_hearings_pp
arb_hearings_real
arb_protest_pp
arb_protest_real
building_other
building_res
deeds
exterior
extra_features
extra_features_detail1
extra_features_detail2
fixtures
jur_exempt
jur_exempt_cd
jur_exemption_dscr
jur_tax_dist_exempt_value
jur_tax_dist_percent_rate
jur_value
land
land_ag
owners
ownership_history
parcel_tieback
permits
real_acct
real_neighborhood_code
structural_elem1
structural_elem2
t_business_acct
t_business_detail
t_jur_exempt
t_jur_tax_dist_exempt_value
t_jur_tax_dist_percent_rate
t_jur_value
t_pp_c
t_pp_e
t_pp_l
EOF`

echo $list

for l in $list; do gen_usql $l; done
