USE [master]
GO
DROP DATABASE IF EXISTS [$(DBNAME)]
GO
/****** Object:  Database [hcad_db]    Script Date: 1/4/2018 7:40:30 AM ******/
CREATE DATABASE [$(DBNAME)]
GO
USE [$(DBNAME)]
GO
/****** Object:  Table [dbo].[arb_hearings_pp]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arb_hearings_pp](
	[ACCOUNT] [nvarchar](7) NULL,
	[TAX_YEAR] [nvarchar](4) NULL,
	[PERSONAL] [nvarchar](1) NULL,
	[HEARING_TYPE] [nvarchar](1) NULL,
	[STATE_CLASS] [nvarchar](2) NULL,
	[OWNER_NAME] [nvarchar](50) NULL,
	[SCHEDULED_FOR_DATE] [nvarchar](10) NULL,
	[ACTUAL_HEARING_DATE] [nvarchar](10) NULL,
	[ARB_RELEASE_DATE] [nvarchar](10) NULL,
	[CONCLUSION_CODE] [nvarchar](2) NULL,
	[AGENT_CODE] [nvarchar](6) NULL,
	[INITIAL_APPRAISED_VALUE] [nvarchar](12) NULL,
	[FINAL_APPRAISED_VALUE] [nvarchar](12) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[arb_hearings_real]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arb_hearings_real](
	[ACCOUNT] [nvarchar](13) NULL,
	[TAX_YEAR] [nvarchar](4) NULL,
	[REAL] [nvarchar](1) NULL,
	[HEARING_TYPE] [nvarchar](1) NULL,
	[STATE_CLASS] [nvarchar](4) NULL,
	[OWNER_NAME] [nvarchar](100) NULL,
	[SCHEDULED_FOR_DATE] [nvarchar](10) NULL,
	[ACTUAL_HEARING_DATE] [nvarchar](10) NULL,
	[ARB_RELEASE_DATE] [nvarchar](10) NULL,
	[CONCLUSION_CODE] [nvarchar](2) NULL,
	[AGENT_CODE] [nvarchar](6) NULL,
	[INITIAL_APPRAISED_VALUE] [nvarchar](12) NULL,
	[INITIAL_MARKET_VALUE] [nvarchar](12) NULL,
	[FINAL_APPRAISED_VALUE] [nvarchar](12) NULL,
	[FINAL_MARKET_VALUE] [nvarchar](12) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[arb_protest_pp]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arb_protest_pp](
	[ACCOUNT] [nvarchar](7) NULL,
	[PROTESTED_BY] [nvarchar](6) NULL,
	[PROTESTED_DT] [nvarchar](10) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[arb_protest_real]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arb_protest_real](
	[ACCOUNT] [nvarchar](13) NULL,
	[PROTESTED_BY] [nvarchar](6) NULL,
	[PROTESTED_DT] [nvarchar](10) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[building_other]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[building_other](
	[ACCOUNT] [nvarchar](13) NULL,
	[USE_CODE] [nvarchar](16) NULL,
	[BLD_NUM] [int] NULL,
	[IMPROV_TYPE] [nvarchar](4) NULL,
	[BUILDING_STYLE_CODE] [nvarchar](4) NULL,
	[CLASS_STRUCTURE] [nvarchar](3) NULL,
	[CLASS_STRUC_DESCRIPTION] [nvarchar](50) NULL,
	[NOTICED_DEPR_VALUE] [nvarchar](12) NULL,
	[DEPRECIATION_VALUE] [nvarchar](12) NULL,
	[MS_REPLACEMENT_COST] [nvarchar](12) NULL,
	[CAMA_REPLACEMENT_COST] [nvarchar](12) NULL,
	[ACCRUED_DEPR_PCT] [nvarchar](8) NULL,
	[QUALITY] [nvarchar](2) NULL,
	[QUALITY_DESCRIPTION] [nvarchar](50) NULL,
	[DATE_ERECTED] [nvarchar](4) NULL,
	[EFFECTIVE_DATE] [nvarchar](4) NULL,
	[YR_REMODEL] [nvarchar](4) NULL,
	[YR_ROLL] [nvarchar](4) NULL,
	[APPRAISED_BY] [nvarchar](5) NULL,
	[APPRAISED_DATE] [nvarchar](10) NULL,
	[NOTE] [nvarchar](150) NULL,
	[IMPR_SQ_FT] [nvarchar](12) NULL,
	[ACTUAL_AREA] [nvarchar](12) NULL,
	[HEAT_AREA] [nvarchar](12) NULL,
	[GROSS_AREA] [nvarchar](12) NULL,
	[EFFECTIVE_AREA] [nvarchar](12) NULL,
	[BASE_AREA] [nvarchar](12) NULL,
	[PERIMETER] [nvarchar](12) NULL,
	[PERCENT_COMPLETE] [nvarchar](4) NULL,
	[CATEGORY] [nvarchar](2) NULL,
	[CATEGORY_DSCR] [nvarchar](50) NULL,
	[PROPERTY_NAME] [nvarchar](50) NULL,
	[UNITS] [nvarchar](15) NULL,
	[NET_RENT_AREA] [nvarchar](10) NULL,
	[LEASE_RATE] [nvarchar](10) NULL,
	[OCCUPANCY_RATE] [nvarchar](10) NULL,
	[TOTAL_INCOME] [nvarchar](10) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[building_res]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[building_res](
	[ACCOUNT] [nvarchar](13) NULL,
	[USE_CODE] [nvarchar](16) NULL,
	[BUILDING_NUMBER] [int] NULL,
	[IMPRV_TYPE] [nvarchar](4) NULL,
	[BUILDING_STYLE_CODE] [nvarchar](4) NULL,
	[CLASS_STRUCTURE] [nvarchar](3) NULL,
	[CLASS_STRUC_DESCRIPTION] [nvarchar](50) NULL,
	[DEPRECIATION_VALUE] [nvarchar](12) NULL,
	[CAMA_REPLACEMENT_COST] [nvarchar](12) NULL,
	[ACCRUED_DEPR_PCT] [nvarchar](9) NULL,
	[QUALITY] [nvarchar](2) NULL,
	[QUALITY_DESCRIPTION] [nvarchar](50) NULL,
	[DATE_ERECTED] [nvarchar](4) NULL,
	[EFFECTIVE_DATE] [nvarchar](4) NULL,
	[YR_REMODEL] [nvarchar](4) NULL,
	[YR_ROLL] [nvarchar](4) NULL,
	[APPRAISED_BY] [nvarchar](5) NULL,
	[APPRAISED_DATE] [nvarchar](10) NULL,
	[NOTE] [nvarchar](150) NULL,
	[IMPR_SQ_FT] [nvarchar](12) NULL,
	[ACTUAL_AREA] [nvarchar](12) NULL,
	[HEAT_AREA] [nvarchar](12) NULL,
	[GROSS_AREA] [nvarchar](12) NULL,
	[EFFECTIVE_AREA] [nvarchar](12) NULL,
	[BASE_AREA] [nvarchar](12) NULL,
	[PERIMETER] [nvarchar](12) NULL,
	[PERCENT_COMPLETE] [nvarchar](4) NULL,
	[NBHD_FACTOR] [nvarchar](6) NULL,
	[RCNLD] [nvarchar](13) NULL,
	[SIZE_INDEX] [nvarchar](9) NULL,
	[LUMP_SUM_ADJ] [nvarchar](12) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[deeds]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deeds](
	[acct] [nvarchar](13) NULL,
	[dateOfSale] [nvarchar](10) NULL,
	[clerk_yr] [int] NULL,
	[clerk_id] [nvarchar](20) NULL,
	[deed_id] [int] NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exterior]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exterior](
	[ACCOUNT] [nvarchar](13) NULL,
	[BUILDING_NUMBER] [int] NULL,
	[EXTERIOR_TYPE] [nvarchar](3) NULL,
	[EXTERIOR_DESCRIPTION] [nvarchar](50) NULL,
	[AREA] [nvarchar](12) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[extra_features]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[extra_features](
	[ACCOUNT] [nvarchar](13) NULL,
	[BLD_NUM] [int] NULL,
	[COUNT] [int] NULL,
	[GRADE] [nvarchar](4) NULL,
	[CODE] [nvarchar](6) NULL,
	[S_DSCR] [nvarchar](10) NULL,
	[L_DESCR] [nvarchar](50) NULL,
	[CATEGORY] [nvarchar](2) NULL,
	[DSCR] [nvarchar](50) NULL,
	[NOTE] [nvarchar](50) NULL,
	[UTS] [nvarchar](12) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[extra_features_detail1]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[extra_features_detail1](
	[ACCOUNT] [nvarchar](13) NULL,
	[CD] [nvarchar](6) NULL,
	[DSCR] [nvarchar](50) NULL,
	[GRADE] [nvarchar](4) NULL,
	[COND_CD] [nvarchar](2) NULL,
	[BLD_NUM] [int] NULL,
	[LENGTH] [int] NULL,
	[WIDTH] [int] NULL,
	[UNITS] [nvarchar](12) NULL,
	[UNIT_PRICE] [nvarchar](13) NULL,
	[ADJ_UNIT_PRICE] [nvarchar](15) NULL,
	[PCT_COMP] [nvarchar](4) NULL,
	[ACT_YR] [nvarchar](4) NULL,
	[EFF_YR] [nvarchar](4) NULL,
	[ROLL_YR] [nvarchar](4) NULL,
	[DT] [nvarchar](6) NULL,
	[PCT_COND] [nvarchar](4) NULL,
	[DPR_VAL] [nvarchar](12) NULL,
	[NOTE] [nvarchar](50) NULL,
	[ASD_VAL] [nvarchar](12) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[extra_features_detail2]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[extra_features_detail2](
	[ACCOUNT] [nvarchar](13) NULL,
	[CD] [nvarchar](6) NULL,
	[DSCR] [nvarchar](50) NULL,
	[GRADE] [nvarchar](4) NULL,
	[COND_CD] [nvarchar](2) NULL,
	[BLD_NUM] [int] NULL,
	[LENGTH] [int] NULL,
	[WIDTH] [int] NULL,
	[UNITS] [nvarchar](12) NULL,
	[UNIT_PRICE] [nvarchar](13) NULL,
	[ADJ_UNIT_PRICE] [nvarchar](15) NULL,
	[PCT_COMP] [nvarchar](4) NULL,
	[ACT_YR] [int] NULL,
	[EFF_YR] [int] NULL,
	[ROLL_YR] [int] NULL,
	[DT] [nvarchar](6) NULL,
	[PCT_COND] [nvarchar](4) NULL,
	[DPR_VAL] [nvarchar](12) NULL,
	[NOTE] [nvarchar](50) NULL,
	[ASD_VAL] [nvarchar](12) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fixtures]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fixtures](
	[ACCOUNT] [nvarchar](13) NULL,
	[BUILDING_NUMBER] [int] NULL,
	[FIXTURE_TYPE] [nvarchar](4) NULL,
	[FIXTURE_DESCRIPTION] [nvarchar](50) NULL,
	[UNITS] [nvarchar](11) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL,
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jur_exempt]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jur_exempt](
	[ACCOUNT] [nvarchar](13) NULL,
	[TAX_DISTRICT] [nvarchar](6) NULL,
	[EXEMPT_CAT] [nvarchar](4) NULL,
	[EXEMPT_VAL] [nvarchar](12) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jur_exempt_cd]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jur_exempt_cd](
	[ACCOUNT] [nvarchar](13) NULL,
	[EXEMPT_CAT] [nvarchar](92) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jur_exemption_dscr]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jur_exemption_dscr](
	[EXEMPT_CAT] [nvarchar](6) NULL,
	[EXEMPTION_DSCR] [nvarchar](50) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jur_tax_dist_exempt_value]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jur_tax_dist_exempt_value](
	[RP_TYPE] [nvarchar](4) NULL,
	[TAX_DIST] [nvarchar](6) NULL,
	[TAX_DISTRICT_NAME] [nvarchar](100) NULL,
	[PRIOR_YR_RATE] [nvarchar](10) NULL,
	[CURRENT_YR_RATE] [nvarchar](10) NULL,
	[ABT] [int] NULL,
	[APD] [int] NULL,
	[APO] [int] NULL,
	[APR] [int] NULL,
	[DIS] [int] NULL,
	[HIS] [int] NULL,
	[LIH] [int] NULL,
	[MCL] [int] NULL,
	[OVR] [int] NULL,
	[PAR] [int] NULL,
	[PDS] [int] NULL,
	[PEX] [int] NULL,
	[POL] [int] NULL,
	[POV] [int] NULL,
	[PRO] [int] NULL,
	[RES] [int] NULL,
	[SOL] [int] NULL,
	[SSA] [int] NULL,
	[SSD] [int] NULL,
	[STT] [int] NULL,
	[STX] [int] NULL,
	[SUR] [int] NULL,
	[TOT] [int] NULL,
	[V11] [int] NULL,
	[V12] [int] NULL,
	[V13] [int] NULL,
	[V14] [int] NULL,
	[V21] [int] NULL,
	[V22] [int] NULL,
	[V23] [int] NULL,
	[V24] [int] NULL,
	[VCH] [int] NULL,
	[VS1] [int] NULL,
	[VS2] [int] NULL,
	[VS3] [int] NULL,
	[VS4] [int] NULL,
	[VTX] [int] NULL,
	[ESP] [int] NULL,
	[GCC] [int] NULL,
	[ODR] [int] NULL,
	[SPV] [int] NULL,
	[UND] [int] NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jur_tax_dist_percent_rate]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jur_tax_dist_percent_rate](
	[RP_TYPE] [nvarchar](4) NULL,
	[TAX_DIST] [nvarchar](6) NULL,
	[TAX_DISTRICT_NAME] [nvarchar](100) NULL,
	[PRIOR_YR_RATE] [nvarchar](10) NULL,
	[CURRENT_YR_RATE] [nvarchar](10) NULL,
	[ABT] [nvarchar](10) NULL,
	[APD] [nvarchar](10) NULL,
	[APO] [nvarchar](10) NULL,
	[APR] [nvarchar](10) NULL,
	[DIS] [nvarchar](10) NULL,
	[HIS] [nvarchar](10) NULL,
	[LIH] [nvarchar](10) NULL,
	[MCL] [nvarchar](10) NULL,
	[OVR] [nvarchar](10) NULL,
	[PAR] [nvarchar](10) NULL,
	[PDS] [nvarchar](10) NULL,
	[PEX] [nvarchar](10) NULL,
	[POL] [nvarchar](10) NULL,
	[POV] [nvarchar](10) NULL,
	[PRO] [nvarchar](10) NULL,
	[RES] [nvarchar](10) NULL,
	[SOL] [nvarchar](10) NULL,
	[SSA] [nvarchar](10) NULL,
	[SSD] [nvarchar](10) NULL,
	[STT] [nvarchar](10) NULL,
	[STX] [nvarchar](10) NULL,
	[SUR] [nvarchar](10) NULL,
	[TOT] [nvarchar](10) NULL,
	[V11] [nvarchar](10) NULL,
	[V12] [nvarchar](10) NULL,
	[V13] [nvarchar](10) NULL,
	[V14] [nvarchar](10) NULL,
	[V21] [nvarchar](10) NULL,
	[V22] [nvarchar](10) NULL,
	[V23] [nvarchar](10) NULL,
	[V24] [nvarchar](10) NULL,
	[VCH] [nvarchar](10) NULL,
	[VS1] [nvarchar](10) NULL,
	[VS2] [nvarchar](10) NULL,
	[VS3] [nvarchar](10) NULL,
	[VS4] [nvarchar](10) NULL,
	[VTX] [nvarchar](10) NULL,
	[ESP] [nvarchar](10) NULL,
	[GCC] [nvarchar](10) NULL,
	[ODR] [nvarchar](10) NULL,
	[SPV] [nvarchar](10) NULL,
	[UND] [nvarchar](10) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jur_value]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jur_value](
	[ACCOUNT] [nvarchar](13) NULL,
	[TAX_DISTRICT] [nvarchar](6) NULL,
	[TYPE] [nvarchar](1) NULL,
	[PCT_DISTRICT] [nvarchar](6) NULL,
	[APPRAISED_VALUE] [nvarchar](13) NULL,
	[TAXABLE_VALUE] [nvarchar](13) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[land]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[land](
	[ACCOUNT] [nvarchar](13) NULL,
	[LINE_NUMBER] [int] NULL,
	[LAND_USE_CODE] [nvarchar](4) NULL,
	[LAND_USE_DSCR] [nvarchar](50) NULL,
	[SITE_CD] [nvarchar](4) NULL,
	[SITE_CD_DSCR] [nvarchar](50) NULL,
	[SITE_ADJ] [nvarchar](6) NULL,
	[UNIT_TYPE] [nvarchar](2) NULL,
	[UNITS] [nvarchar](13) NULL,
	[SIZE_FACTOR] [nvarchar](6) NULL,
	[SITE_FACT] [nvarchar](6) NULL,
	[APPR_OVERRIDE_FACTOR] [nvarchar](6) NULL,
	[APPR_OVERRIDE_REASON] [nvarchar](50) NULL,
	[TOT_ADJ] [nvarchar](12) NULL,
	[UNIT_PRICE] [nvarchar](12) NULL,
	[ADJ_UNIT_PRICE] [nvarchar](14) NULL,
	[VALUE] [nvarchar](11) NULL,
	[OVERRIDE_VALUE] [nvarchar](11) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[land_ag]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[land_ag](
	[ACCOUNT] [nvarchar](13) NULL,
	[LINE_NUMBER] [int] NULL,
	[LAND_USE_CODE] [nvarchar](4) NULL,
	[LAND_USE_DSCR] [nvarchar](50) NULL,
	[SITE_CD] [nvarchar](4) NULL,
	[SITE_CD_DSCR] [nvarchar](50) NULL,
	[SITE_ADJ] [nvarchar](6) NULL,
	[UNIT_TYPE] [nvarchar](2) NULL,
	[UNITS] [nvarchar](13) NULL,
	[SIZE_FACTOR] [nvarchar](6) NULL,
	[SITE_FACTOR] [nvarchar](6) NULL,
	[APPR_OVERRIDE_FACTOR] [nvarchar](6) NULL,
	[APPR_OVERRIDE_REASON] [nvarchar](50) NULL,
	[TOT_ADJ] [nvarchar](12) NULL,
	[UNIT_PRICE] [nvarchar](12) NULL,
	[ADJ_UNIT_PRICE] [nvarchar](14) NULL,
	[VALUE] [nvarchar](11) NULL,
	[OVERRIDE_VALUE] [nvarchar](11) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[owners]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[owners](
	[ACCOUNT] [nvarchar](13) NULL,
	[LINE_NUMBER] [int] NULL,
	[NAME] [nvarchar](100) NULL,
	[AKA] [nvarchar](50) NULL,
	[PCT_OWN] [nvarchar](5) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ownership_history]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ownership_history](
	[ACCOUNT] [nvarchar](13) NULL,
	[PURCHASE_DATE] [nvarchar](25) NULL,
	[NAME] [nvarchar](100) NULL,
	[SITE_ADDRESS] [nvarchar](75) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parcel_tieback]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parcel_tieback](
	[ACCOUNT] [nvarchar](13) NULL,
	[RELATIONSHIP_TYPE] [nvarchar](2) NULL,
	[RELATIONSHIP_DESCRIPTION] [nvarchar](100) NULL,
	[RELATED_ACCOUNT_NUMBER] [nvarchar](13) NULL,
	[PERCENT] [nvarchar](8) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permits]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permits](
	[ACCOUNT] [nvarchar](13) NULL,
	[PERMIT_ID] [int] NULL,
	[AGENCY_ID] [nvarchar](4) NULL,
	[PERMIT_STATUS] [nvarchar](1) NULL,
	[DESCRIPTION] [nvarchar](50) NULL,
	[STATE_CLASS] [nvarchar](4) NULL,
	[PERMIT_TYPE] [nvarchar](10) NULL,
	[PERMIT_TYPE_DSCR] [nvarchar](50) NULL,
	[PROPERTY_TYPE] [nvarchar](3) NULL,
	[ISSUE_DATE] [nvarchar](10) NULL,
	[YEAR] [nvarchar](4) NULL,
	[SITE_NUMBER] [nvarchar](9) NULL,
	[SITE_PFX] [nvarchar](2) NULL,
	[SITE_STREET_NAME] [nvarchar](50) NULL,
	[SITE_TP] [nvarchar](4) NULL,
	[SITE_SFX] [nvarchar](25) NULL,
	[SITE_APT] [nvarchar](6) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[real_acct]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[real_acct](
	[ACCOUNT] [nvarchar](13) NULL,
	[TAX_YEAR] [nvarchar](4) NULL,
	[MAILTO] [nvarchar](100) NULL,
	[MAIL_ADDR_1] [nvarchar](50) NULL,
	[MAIL_ADDR_2] [nvarchar](50) NULL,
	[MAIL_CITY] [nvarchar](50) NULL,
	[MAIL_STATE] [nvarchar](2) NULL,
	[MAIL_ZIP] [nvarchar](10) NULL,
	[MAIL_COUNTRY] [nvarchar](50) NULL,
	[UNDELIVERABLE] [nvarchar](1) NULL,
	[STR_PFX] [nvarchar](2) NULL,
	[STR_NUM] [int] NULL,
	[STR_NUM_SFX] [nvarchar](3) NULL,
	[STR_NAME] [nvarchar](50) NULL,
	[STR_SFX] [nvarchar](25) NULL,
	[STR_SFX_DIR] [nvarchar](2) NULL,
	[STR_UNIT] [nvarchar](15) NULL,
	[SITE_ADDR_1] [nvarchar](50) NULL,
	[SITE_ADDR_2] [nvarchar](50) NULL,
	[SITE_ADDR_3] [nvarchar](10) NULL,
	[STATE_CLASS] [nvarchar](16) NULL,
	[SCHOOL_DIST] [nvarchar](5) NULL,
	[MAP_FACET] [nvarchar](6) NULL,
	[KEY_MAP] [nvarchar](6) NULL,
	[NEIGHBORHOOD_CODE] [nvarchar](11) NULL,
	[NEIGHBORHOOD_GROUP] [nvarchar](8) NULL,
	[MARKET_AREA_1] [nvarchar](8) NULL,
	[MARKET_AREA_1_DSCR] [nvarchar](50) NULL,
	[MARKET_AREA_2] [nvarchar](8) NULL,
	[MARKET_AREA_2_DSCR] [nvarchar](50) NULL,
	[ECON_AREA] [nvarchar](5) NULL,
	[ECON_BLD_CLASS] [nvarchar](5) NULL,
	[CENTER_CODE] [nvarchar](5) NULL,
	[YR_IMPR] [nvarchar](4) NULL,
	[YR_ANNEXED] [nvarchar](4) NULL,
	[SPLT_DT] [nvarchar](20) NULL,
	[DSC_CD] [nvarchar](2) NULL,
	[NXT_BUILDING] [nvarchar](10) NULL,
	[TOTAL_BUILDING_AREA] [nvarchar](12) NULL,
	[TOTAL_LAND_AREA] [nvarchar](12) NULL,
	[ACREAGE] [nvarchar](13) NULL,
	[CAP_ACCOUNT] [nvarchar](7) NULL,
	[SHARED_CAD_CODE] [nvarchar](3) NULL,
	[LAND_VALUE] [nvarchar](12) NULL,
	[IMPROVEMENT_VALUE] [nvarchar](12) NULL,
	[EXTRA_FEATURES_VALUE] [nvarchar](12) NULL,
	[AG_VALUE] [nvarchar](12) NULL,
	[ASSESSED_VALUE] [nvarchar](12) NULL,
	[TOTAL_APPRAISED_VALUE] [nvarchar](12) NULL,
	[TOTAL_MARKET_VALUE] [nvarchar](12) NULL,
	[PRIOR_LND_VALUE] [nvarchar](12) NULL,
	[PRIOR_IMPR_VALUE] [nvarchar](12) NULL,
	[PRIOR_X_FEATURES_VALUE] [nvarchar](12) NULL,
	[PRIOR_AG_VALUE] [nvarchar](12) NULL,
	[PRIOR_TOTAL_APPRAISED_VALUE] [nvarchar](12) NULL,
	[PRIOR_TOTAL_MARKET_VALUE] [nvarchar](12) NULL,
	[NEW_CONSTRUCTION_VALUE] [nvarchar](12) NULL,
	[TOTAL_RCN_VALUE] [nvarchar](12) NULL,
	[VALUE_STATUS] [nvarchar](36) NULL,
	[NOTICED] [nvarchar](1) NULL,
	[NOTICE_DATE] [nvarchar](25) NULL,
	[PROTESTED] [nvarchar](1) NULL,
	[CERTIFIED_DATE] [nvarchar](25) NULL,
	[LAST_INSPECTED_DATE] [nvarchar](25) NULL,
	[LAST_INSPECTED_BY] [nvarchar](5) NULL,
	[NEW_OWNER_DATE] [nvarchar](25) NULL,
	[LEGAL_DSCR_1] [nvarchar](50) NULL,
	[LEGAL_DSCR_2] [nvarchar](50) NULL,
	[LEGAL_DSCR_3] [nvarchar](50) NULL,
	[LEGAL_DSCR_4] [nvarchar](50) NULL,
	[JURS] [nvarchar](100) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[real_neighborhood_code]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[real_neighborhood_code](
	[NEIGHBORHOOD_CD] [nvarchar](11) NULL,
	[GROUP_CD] [nvarchar](12) NULL,
	[DESCRIPTION] [nvarchar](50) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[structural_elem1]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[structural_elem1](
	[ACCOUNT] [nvarchar](13) NULL,
	[BUILDING_NUMBER] [int] NULL,
	[CODE] [nvarchar](10) NULL,
	[ADJ_CD] [nvarchar](10) NULL,
	[STRUCTURE_TYPE] [nvarchar](4) NULL,
	[TYPE_DESCRIPTION] [nvarchar](50) NULL,
	[CATEGORY_DESCRIPTION] [nvarchar](50) NULL,
	[STATE_CLASS_CODE] [nvarchar](4) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[structural_elem2]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[structural_elem2](
	[ACCOUNT] [nvarchar](13) NULL,
	[BUILDING_NUMBER] [int] NULL,
	[CODE] [nvarchar](10) NULL,
	[ADJ_CD] [nvarchar](10) NULL,
	[STRUCTURE_TYPE] [nvarchar](4) NULL,
	[TYPE_DESCRIPTION] [nvarchar](50) NULL,
	[CATEGORY_DESCRIPTION] [nvarchar](50) NULL,
	[STATE_CLASS_CODE] [nvarchar](4) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_business_acct]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_business_acct](
	[ACCOUNT] [nvarchar](7) NULL,
	[TAX_YEAR] [nvarchar](4) NULL,
	[NAME] [nvarchar](50) NULL,
	[OWNER] [nvarchar](50) NULL,
	[SITE_ADDRESS] [nvarchar](80) NULL,
	[SITE_CITY] [nvarchar](50) NULL,
	[SITE_STATE] [nvarchar](5) NULL,
	[SITE_ZIP] [nvarchar](10) NULL,
	[MAILTO] [nvarchar](50) NULL,
	[MAIL_ADDRESS1] [nvarchar](50) NULL,
	[MAIL_ADDRESS2] [nvarchar](50) NULL,
	[MAIL_CITY] [nvarchar](50) NULL,
	[MAIL_STATE] [nvarchar](2) NULL,
	[MAIL_ZIP] [nvarchar](10) NULL,
	[PHONE] [nvarchar](14) NULL,
	[DSCR] [nvarchar](80) NULL,
	[DESCRIPTION1] [nvarchar](50) NULL,
	[DESCRIPTION2] [nvarchar](50) NULL,
	[DESCRIPTION3] [nvarchar](50) NULL,
	[PROPERTY_TYPE] [nvarchar](1) NULL,
	[PROPERTY_TYPE_DESCR] [nvarchar](50) NULL,
	[STATE_CLASS] [nvarchar](2) NULL,
	[SIC_DESCR] [nvarchar](50) NULL,
	[SIC_CODE] [nvarchar](8) NULL,
	[SIC_DSCR] [nvarchar](100) NULL,
	[SQUARE_FEET] [nvarchar](100) NULL,
	[CENTER_CODE] [nvarchar](10) NULL,
	[SHARED_CAD] [nvarchar](1) NULL,
	[KEY_MAP] [nvarchar](6) NULL,
	[APPRAISED_VALUE] [nvarchar](10) NULL,
	[PRIOR_APPRAISED_VALUE] [nvarchar](12) NULL,
	[RETURN_CODE] [nvarchar](52) NULL,
	[VALUE_STATUS] [nvarchar](36) NULL,
	[NOTICED] [nvarchar](1) NULL,
	[NOTICE_DATE] [nvarchar](25) NULL,
	[PROTESTED] [nvarchar](1) NULL,
	[CERTIFIED_DATE] [nvarchar](25) NULL,
	[AGENT_ID] [nvarchar](6) NULL,
	[JURS] [nvarchar](100) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_business_detail]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_business_detail](
	[ACCOUNT] [nvarchar](7) NULL,
	[LINE_NUMBER] [int] NULL,
	[DEPT_CODE] [nvarchar](4) NULL,
	[DEPT_CODE_DESCR] [nvarchar](50) NULL,
	[APPRAISED_VAL] [nvarchar](12) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_jur_exempt]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_jur_exempt](
	[ACCOUNT] [nvarchar](7) NULL,
	[TAX_DIST] [nvarchar](6) NULL,
	[TAX_DIST_NAME] [nvarchar](100) NULL,
	[EXEMPT_CAT] [nvarchar](4) NULL,
	[EXEMPT_DSCR] [nvarchar](50) NULL,
	[PCT_EXEMPT] [nvarchar](10) NULL,
	[EXEMPT_VALUE] [nvarchar](12) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_jur_tax_dist_exempt_value]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_jur_tax_dist_exempt_value](
	[RP_TYPE] [nvarchar](8) NULL,
	[TAX_DISTRICT] [nvarchar](6) NULL,
	[TAX_DISTRICT_NAME] [nvarchar](100) NULL,
	[PRIOR_YR_RATE] [nvarchar](10) NULL,
	[CURRENT_YR_RATE] [nvarchar](10) NULL,
	[ABT] [int] NULL,
	[APD] [int] NULL,
	[APO] [int] NULL,
	[APR] [int] NULL,
	[DIS] [int] NULL,
	[HIS] [int] NULL,
	[LIH] [int] NULL,
	[MCL] [int] NULL,
	[OVR] [int] NULL,
	[PAR] [int] NULL,
	[PDS] [int] NULL,
	[PEX] [int] NULL,
	[POL] [int] NULL,
	[POV] [int] NULL,
	[PRO] [int] NULL,
	[RES] [int] NULL,
	[SOL] [int] NULL,
	[SSA] [int] NULL,
	[SSD] [int] NULL,
	[STT] [int] NULL,
	[STX] [int] NULL,
	[SUR] [int] NULL,
	[TOT] [int] NULL,
	[V11] [int] NULL,
	[V12] [int] NULL,
	[V13] [int] NULL,
	[V14] [int] NULL,
	[V21] [int] NULL,
	[V22] [int] NULL,
	[V23] [int] NULL,
	[V24] [int] NULL,
	[VCH] [int] NULL,
	[VS1] [int] NULL,
	[VS2] [int] NULL,
	[VS3] [int] NULL,
	[VS4] [int] NULL,
	[VTX] [int] NULL,
	[ESP] [int] NULL,
	[GCC] [int] NULL,
	[ODR] [int] NULL,
	[SPV] [int] NULL,
	[UND] [int] NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_jur_tax_dist_percent_rate]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_jur_tax_dist_percent_rate](
	[RP_TYPE] [nvarchar](8) NULL,
	[TAX_DISTRICT] [nvarchar](6) NULL,
	[TAX_DISTRICT_NAME] [nvarchar](100) NULL,
	[PRIOR_YR_RATE] [nvarchar](10) NULL,
	[CURRENT_YR_RATE] [nvarchar](10) NULL,
	[ABT] [nvarchar](10) NULL,
	[APD] [nvarchar](10) NULL,
	[APO] [nvarchar](10) NULL,
	[APR] [nvarchar](10) NULL,
	[DIS] [nvarchar](10) NULL,
	[HIS] [nvarchar](10) NULL,
	[LIH] [nvarchar](10) NULL,
	[MCL] [nvarchar](10) NULL,
	[OVR] [nvarchar](10) NULL,
	[PAR] [nvarchar](10) NULL,
	[PDS] [nvarchar](10) NULL,
	[PEX] [nvarchar](10) NULL,
	[POL] [nvarchar](10) NULL,
	[POV] [nvarchar](10) NULL,
	[PRO] [nvarchar](10) NULL,
	[RES] [nvarchar](10) NULL,
	[SOL] [nvarchar](10) NULL,
	[SSA] [nvarchar](10) NULL,
	[SSD] [nvarchar](10) NULL,
	[STT] [nvarchar](10) NULL,
	[STX] [nvarchar](10) NULL,
	[SUR] [nvarchar](10) NULL,
	[TOT] [nvarchar](10) NULL,
	[V11] [nvarchar](10) NULL,
	[V12] [nvarchar](10) NULL,
	[V13] [nvarchar](10) NULL,
	[V14] [nvarchar](10) NULL,
	[V21] [nvarchar](10) NULL,
	[V22] [nvarchar](10) NULL,
	[V23] [nvarchar](10) NULL,
	[V24] [nvarchar](10) NULL,
	[VCH] [nvarchar](10) NULL,
	[VS1] [nvarchar](10) NULL,
	[VS2] [nvarchar](10) NULL,
	[VS3] [nvarchar](10) NULL,
	[VS4] [nvarchar](10) NULL,
	[VTX] [nvarchar](10) NULL,
	[ESP] [nvarchar](10) NULL,
	[GCC] [nvarchar](10) NULL,
	[ODR] [nvarchar](10) NULL,
	[SPV] [nvarchar](10) NULL,
	[UND] [nvarchar](10) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_jur_value]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_jur_value](
	[ACCOUNT] [nvarchar](7) NULL,
	[TAX_DISTRICT] [nvarchar](6) NULL,
	[TAX_DISTRICT_TYPE] [nvarchar](1) NULL,
	[PCT_EXEMPT] [nvarchar](12) NULL,
	[APPRAISED_VALUE] [nvarchar](13) NULL,
	[TAXABLE_VALUE] [nvarchar](13) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_pp_c]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_pp_c](
	[ACCOUNT] [nvarchar](7) NULL,
	[PPT_CODE] [nvarchar](1) NULL,
	[PIPE_USAGE] [nvarchar](100) NULL,
	[PIPE_SIZE] [nvarchar](100) NULL,
	[PIPE_MILEAGE] [nvarchar](100) NULL,
	[YEAR_INSTALLED] [nvarchar](100) NULL,
	[PIPE_TYPE] [nvarchar](100) NULL,
	[REGULATION] [nvarchar](100) NULL,
	[USAGE_FACTOR] [nvarchar](100) NULL,
	[STATUS] [nvarchar](100) NULL,
	[PIPE_ID] [nvarchar](100) NULL,
	[HCAD_ID] [nvarchar](100) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_pp_e]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_pp_e](
	[ACCOUNT] [nvarchar](7) NULL,
	[PPT_CODE] [nvarchar](1) NULL,
	[RAIL_LEASENUM] [nvarchar](100) NULL,
	[TYPE_INTEREST] [nvarchar](100) NULL,
	[INTEREST_PERCENT] [nvarchar](100) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_pp_l]    Script Date: 1/4/2018 7:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_pp_l](
	[ACCOUNT] [nvarchar](7) NULL,
	[PPT_CODE] [nvarchar](1) NULL,
	[TYPE_STRUCTURE] [nvarchar](100) NULL,
	[VOLT_AMP] [nvarchar](100) NULL,
	[EL_MILEAGE] [nvarchar](100) NULL,
	[NUM_OF_CIRCUITS] [nvarchar](100) NULL,
	[CONTRACT_ACCOUNT] [nvarchar](100) NULL,
	[SNAPSHOT_YEAR] [nvarchar](4) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [$(DBNAME)] SET  READ_WRITE 
GO
