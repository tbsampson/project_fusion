/*
 F3002Z1 - Bill of Materials
 IR 20190514 Tom Sampson
 BV R3002Z1I

tables to clear
F3002
*/
-- CREATE VIEW _BOM AS

SELECT

 TTL.SZEDUS
,TTL.SZEDBT
,ROW_NUMBER()  OVER(ORDER BY TTL.SZEDUS)SZEDTN
,TTL.SZEDLN
,TTL.SZEDCT
,TTL.SZTYTN
,TTL.SZEDFT
,TTL.SZEDDT
,TTL.SZDRIN
,TTL.SZEDDL
,TTL.SZEDSP
,TTL.SZPNID
,TTL.SZTNAC
,TTL.SZTBM
,TTL.SZKIT
,TTL.SZKITL
,TTL.SZKITA
,TTL.SZMMCU
,TTL.SZITM
,TTL.SZLITM
,TTL.SZAITM
,TTL.SZCMCU
,TTL.SZCPNT
,TTL.SZSBNT
,TTL.SZPRTA
,TTL.SZQNTY
,TTL.SZUM
,TTL.SZBQTY
,TTL.SZUOM
,TTL.SZFVBT
,TTL.SZEFFF
,TTL.SZEFFT
,TTL.SZFSER
,TTL.SZTSER
,TTL.SZITC
,TTL.SZFTRC
,TTL.SZOPTK
,TTL.SZFORV
,TTL.SZCSTM
,TTL.SZCSMP
,TTL.SZORDW
,TTL.SZFORQ
,TTL.SZCOBY
,TTL.SZCOTY
,TTL.SZFRMP
,TTL.SZTHRP
,TTL.SZFRGD
,TTL.SZTHGD
,TTL.SZOPSQ
,TTL.SZBSEQ
,TTL.SZFTRP
,TTL.SZF$RP
,TTL.SZRSCP
,TTL.SZSCRP
,TTL.SZREWP
,TTL.SZASIP
,TTL.SZCPYP
,TTL.SZSTPP
,TTL.SZLOVD
,TTL.SZECO
,TTL.SZECTY
,TTL.SZECOD
,TTL.SZDSC1
,TTL.SZLNTY
,TTL.SZPRIC
,TTL.SZUNCS
,TTL.SZPCTK
,TTL.SZSHNO
,TTL.SZOMCU
,TTL.SZOBJ
,TTL.SZSUB
,TTL.SZBREV
,TTL.SZCMRV
,TTL.SZRVNO
,TTL.SZUUPG
,TTL.SZURCD
,TTL.SZURDT
,TTL.SZURAT
,TTL.SZURRF
,TTL.SZURAB
,TTL.SZUSER
,TTL.SZPID
,TTL.SZUPMJ
,TTL.SZTDAY
,TTL.SZJOBN
,TTL.SZAING
,TTL.SZSUCO
,TTL.SZSTRC
,TTL.SZENDC
,TTL.SZAPSC
,TTL.SZCPNB
,TTL.SZBSEQAN
,TTL.SZBCHAR
,TTL.SZBOSTR

FROM

	(

SELECT DISTINCT

		 'JDE'   		SZEDUS -- EDI - User ID String Generic Edit(10)
		,'BALBOM'   	SZEDBT -- EDI - Batch Number String Generic Edit(15)
		--,ROW_NUMBER() OVER(ORDER BY	REQUIREMENT.ROWID)   
		--				SZEDTN -- EDI - Transaction Number String Generic Edit(22)
		,1   			SZEDLN -- EDI - Line Number Numeric Generic Edit(7)
		,''   			SZEDCT -- EDI - Document Type String Generic Edit(2)
		,'JDEBOM'   	SZTYTN -- Type - Transaction String UDC (00 TT)(8)
		,''   			SZEDFT -- EDI - Translation Format String Generic Edit(10)
		,''   			SZEDDT -- EDI - Transmission Date Date Generic Edit(6)
		,1   			SZDRIN -- Direction Indicator Character UDC (00 DN)(1)
		,''   			SZEDDL -- EDI - Detail Lines Processed Numeric Generic Edit(5)
		,'N'   			SZEDSP -- EDI - Successfully Processed Character Generic Edit(1)
		,''   			SZPNID -- Trading Partner ID String Generic Edit(15)
		,'A'   			SZTNAC -- Transaction Action String UDC (00 TA)(2)
		,'M'   			SZTBM -- Type Bill of Material String UDC (40 TB)(3)
		,IM1.SZITM 
						SZKIT -- Parent (short) Item Number Numeric Generic Edit(8)
		,REQUIREMENT.WORKORDER_BASE_ID -- IM1.SZLITM   
						SZKITL -- Kit - 2nd Item Number String Generic Edit(25)
		,IM1.SZAITM --    -- SZLITM old 3rd
						SZKITA -- 3rd Item Number - Kit String Generic Edit(25)
		,'       20001' SZMMCU -- Branch String Generic Edit(12)
		,IM2.SZITM  
						SZITM -- Item Number - Short Numeric Generic Edit(8)
		,REQUIREMENT.PART_ID -- IM2.SZLITM   
						SZLITM -- 2nd Item Number String Generic Edit(25)
		,IM2.SZAITM   
						SZAITM -- 3rd Item Number String Generic Edit(25)
		,'       20001' SZCMCU -- Component Branch String Generic Edit(12)
		,'' -- CAST(CAST(OP_SEQ_RANK.RANK AS VARCHAR) + CAST(PC_RANK.RANK AS VARCHAR) AS INTEGER)  
						SZCPNT -- Component Line Number Numeric Generic Edit(4)
		,0				SZSBNT -- Substitute Item Sequence Number Numeric Generic Edit(5)
		,'Y'			SZPRTA -- Partials Allowed (Y/N) Character Generic Edit(1)
		,CASE 
			   WHEN REQUIREMENT.CALC_QTY <> 0 
				THEN CAST(CAST(REQUIREMENT.CALC_QTY AS DECIMAL(12,6)) * 10000 AS BIGINT)
			   WHEN REQUIREMENT.FIXED_QTY <> 0
				THEN CAST(CAST(REQUIREMENT.FIXED_QTY AS DECIMAL(12,6)) * 10000 AS BIGINT)
			   ELSE 10000
		 END			SZQNTY -- Quantity - Standard Required Quantity Numeric Generic Edit(15)
		,IM2.SZUOM1 	SZUM -- Unit of Measure String UDC (00 UM)(2)
		,0				SZBQTY -- Units - Batch Quantity Numeric Generic Edit(15)
		,''				SZUOM -- Unit of Measure as Input String UDC (00 UM)(2)
		,''				SZFVBT -- Fixed or Variable Batch Size Character Generic Edit(1)
		,119001			SZEFFF -- Effective - From Date Date Generic Edit(6)
		,140336			SZEFFT -- Effective - Thru Date Date Generic Edit(6)
		,''				SZFSER -- Effective From Serial Number String Generic Edit(25)
		,''				SZTSER -- Effective Thru Serial Number String Generic Edit(25)
		,ISNULL(BOM_SIDE.SZITC,'I')			SZITC -- Issue Type Code Character UDC (41 IT)(1) -- not on side 'I'
		,'N'			SZFTRC -- Required Character Generic Edit(1)
		,'S'			SZOPTK -- Optional Item (Kit) Character UDC (H40 OP)(1)
		,'N'			SZFORV -- Default Component Character Generic Edit(1)
		,''				SZCSTM -- Component Costing Method Character UDC (H40 CV)(1)
		,''				SZCSMP -- Costing Method - Purchasing Character Generic Edit(1)
		,''				SZORDW -- Order With Character Generic Edit(1)
		,CASE 
			WHEN REQUIREMENT.QTY_PER <> 0 
			THEN 'V'
			ELSE 'F'
		 END			SZFORQ -- Fixed or Variable Quantity Character UDC (H40 FO)(1)
		,''				SZCOBY -- Co-Products/By-Products/Intermediate Character UDC (H40 CO)(1)
		,''				SZCOTY -- Component Type Character UDC (H40 CP)(1)
		,''				SZFRMP -- From Potency Numeric Generic Edit(7)
		,''				SZTHRP -- Thru Potency Numeric Generic Edit(7)
		,''				SZFRGD -- From Grade String UDC (40 LG)(3)
		,CASE
			WHEN LTRIM(RTRIM(REQUIREMENT.USER_1)) <> 'Y' 
				THEN '' 
				ELSE 'Y'
		 END			SZTHGD -- Thru Grade String UDC (40 LG)(3)
		,CAST(	CASE	WHEN BOM_SIDE.SZOPSQ IS NULL OR LTRIM(RTRIM(BOM_SIDE.SZOPSQ)) = '' THEN 0.00 -- confirmed Bill wants blanks to be zero
						ELSE CAST(LTRIM(RTRIM(BOM_SIDE.SZOPSQ)) AS DECIMAL(4,2)) * 100
				END AS INTEGER)
						SZOPSQ -- Sequence Number - Operations Numeric Generic Edit(5)
		,''				SZBSEQ -- Sequence - Bubble Sequence Numeric Generic Edit(5)
		,10000			SZFTRP -- Feature Planned Percent Numeric Generic Edit(5)
		,10000			SZF$RP -- Feature Cost Percent Numeric Generic Edit(5)
		,''				SZRSCP -- Resource Percent Numeric Generic Edit(5)
		,0				SZSCRP -- Percent - Percent of Scrap Numeric Generic Edit(5)
		,0				SZREWP -- Percent - Rework Numeric Generic Edit(5)
		,0				SZASIP -- Percent - As is Numeric Generic Edit(5)
		,10000			SZCPYP -- Percent - Cumulative Planned Yield Numeric Generic Edit(5)
		,0				SZSTPP -- Operation Scrap Percent Numeric Generic Edit(5)
		,0				SZLOVD -- Leadtime Offset Days Numeric Generic Edit(6)
		,''				SZECO -- ECO Number String Generic Edit(12)
		,''				SZECTY -- Engineering Change Reason String UDC (40 CR)(2)
		,''				SZECOD -- Date - Engineering Change Date Date Generic Edit(6)
		,''				SZDSC1 -- Description String Generic Edit(30)
		,'S'			SZLNTY -- Line Type String Generic Edit(2)
		,''				SZPRIC -- Unit Price per Primary Numeric Generic Edit(15)
		,ISNULL(CAST(PART2.UNIT_MATERIAL_COST * 10000 AS INTEGER),0)			SZUNCS -- Amount - Unit Cost Numeric Generic Edit(15)
		,''				SZPCTK -- Percent Assembly Sales Price Numeric Generic Edit(7)
		,''				SZSHNO -- Message Number String Generic Edit(10)
		,''				SZOMCU -- Project Business Unit String Generic Edit(12)
		,''				SZOBJ  -- Object Account String Generic Edit(6)
		,''				SZSUB  -- Subsidiary String Generic Edit(8)
		,''				SZBREV -- Bill Revision Level String Generic Edit(3)
		,''				SZCMRV -- Component Revision Level String Generic Edit(3)
		,''				SZRVNO -- Last Revision No. String Generic Edit(2)
		,''				SZUUPG -- Item Number - Use Up/Go To Numeric Generic Edit(8)
		,''				SZURCD -- User Reserved Code String Generic Edit(2)
		,''				SZURDT -- User Reserved Date Date Generic Edit(6)
		,''				SZURAT -- User Reserved Amount Numeric Generic Edit(15)
		,''				SZURRF -- User Reserved Reference String Generic Edit(15)
		,''				SZURAB -- User Reserved Number Numeric Generic Edit(8)
		,'TSAMPSON'		SZUSER -- User ID String Generic Edit(10)
		,'BALBOM'		SZPID  -- Program ID String Generic Edit(10)
		,dbo.JDEJulian(GETDATE())   
						SZUPMJ -- Date - Updated Date Generic Edit(6)
		,''				SZTDAY -- Time of Day Numeric Generic Edit(6)
		,''				SZJOBN -- Work Station ID String Generic Edit(10)
		,''				SZAING -- Active Ingredient Flag Character Generic Edit(1)
		,''				SZSUCO -- Substitute Counter Integer Generic Edit(11)
		,''				SZSTRC -- Consumption Start Numeric Generic Edit(15)
		,''				SZENDC -- Consumption End Numeric Generic Edit(15)
		,''				SZAPSC -- Constraints Flag Character UDC (42 AC)(1)
		,''				SZCPNB -- Component Line Number BOM Numeric Generic Edit(8)
		,''				SZBSEQAN -- Bubble Sequence Alpha Numeric String Generic Edit(5)
		,''				SZBCHAR -- Lean Superflush Flag Character Generic Edit(1)
		,''				SZBOSTR -- Prep Code String UDC (F30L PC)(4)

		FROM REQUIREMENT REQUIREMENT
		
		LEFT JOIN _ITEM_MASTER_1_TABLE IM1 -- first item master for the base
			ON REQUIREMENT.WORKORDER_BASE_ID = IM1.SZLITM -- LTRIM(RTRIM(BOM_SIDE.SZKITA))
		
		LEFT JOIN _ITEM_MASTER_1_TABLE IM2 -- second item master for the componment
			ON REQUIREMENT.PART_ID = IM2.SZLITM --LTRIM(RTRIM(BOM_SIDE.SZLITM))
			
		LEFT JOIN _BOM_SIDE BOM_SIDE
			ON REQUIREMENT.WORKORDER_BASE_ID = LTRIM(RTRIM(BOM_SIDE.SZKITA))
			AND REQUIREMENT.PART_ID = LTRIM(RTRIM(BOM_SIDE.SZLITM))	
		
		LEFT JOIN _ITEM_MASTER_SIDE IMS
			ON REQUIREMENT.WORKORDER_BASE_ID = IMS.SZLITM 
	
		JOIN PART PART1
			ON REQUIREMENT.WORKORDER_BASE_ID = PART1.ID	
			
		JOIN PART PART2
			ON REQUIREMENT.PART_ID = PART2.ID
			
		WHERE REQUIREMENT.WORKORDER_LOT_ID = '0'
		AND REQUIREMENT.WORKORDER_TYPE IN ('M','S')  -- M per Bill 8/7/2019, S per Bill 9/19/2019
		AND (REQUIREMENT.SUBORD_WO_SUB_ID IS NULL OR REQUIREMENT.SUBORD_WO_SUB_ID = 0)
		AND IMS.SZSTKT IN ('M','S') -- M per Bill 8/7/2019, S per Bill 9/19/2019
		AND REQUIREMENT.PART_ID <> 'INTSHEET'
		AND REQUIREMENT.PART_ID <> 'ABRASIVEBK'
		AND REQUIREMENT.PART_ID <> 'GALVANIZE-0'
		AND REQUIREMENT.PART_ID <> 'HEATTREAT'
		AND REQUIREMENT.PART_ID <> 'PLATING'
		AND REQUIREMENT.PART_ID <> 'CVRSPLC9RW'
		AND PART1.ABC_CODE <> 'Z'
		AND PART1.ABC_CODE IS NOT NULL
		AND PART2.ABC_CODE <> 'Z'
		AND PART2.ABC_CODE IS NOT NULL		
	) TTL

