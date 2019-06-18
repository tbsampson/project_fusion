
/*
 F3002Z1 - Bill of Materials
 IR 20190514 Tom Sampson
 BV R3002Z1I

tables to clear
F3002


*/
use BALCO;

SELECT

		 'JDE'   		SZEDUS -- EDI - User ID String Generic Edit(10)
		,'BALBOM'   	SZEDBT -- EDI - Batch Number String Generic Edit(15)
		,ROW_NUMBER() OVER(ORDER BY	REQUIREMENT.ROWID)   
						SZEDTN -- EDI - Transaction Number String Generic Edit(22)
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
		,IM1.SZLITM   
						SZKITL -- Kit - 2nd Item Number String Generic Edit(25)
		,REQUIREMENT.WORKORDER_BASE_ID   
						SZKITA -- 3rd Item Number - Kit String Generic Edit(25)
		,'       20001' SZMMCU -- Branch String Generic Edit(12)
		,IM2.SZITM  
						SZITM -- Item Number - Short Numeric Generic Edit(8)
		,IM2.SZLITM   
						SZLITM -- 2nd Item Number String Generic Edit(25)
		,REQUIREMENT.PART_ID   
						SZAITM -- 3rd Item Number String Generic Edit(25)
		,'       20001' SZCMCU -- Component Branch String Generic Edit(12)
		,'' -- CAST(CAST(OP_SEQ_RANK.RANK AS VARCHAR) + CAST(PC_RANK.RANK AS VARCHAR) AS INTEGER)  
						SZCPNT -- Component Line Number Numeric Generic Edit(4)
		,0				SZSBNT -- Substitute Item Sequence Number Numeric Generic Edit(5)
		,'Y'			SZPRTA -- Partials Allowed (Y/N) Character Generic Edit(1)
		,CASE 
			   WHEN REQUIREMENT.QTY_PER <> 0 
	   			THEN CAST(CAST(REQUIREMENT.QTY_PER AS DECIMAL(12,6)) * 10000 AS BIGINT)
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
		,BOM_SIDE.SZITC			SZITC -- Issue Type Code Character UDC (41 IT)(1)
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
		,ISNULL(REQUIREMENT.USER_1,'')   
						SZTHGD -- Thru Grade String UDC (40 LG)(3)
		,CAST(BOM_SIDE.SZOPSQ AS DECIMAL(8,3)) * 100   
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
		,''				SZUNCS -- Amount - Unit Cost Numeric Generic Edit(15)
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

		FROM _BOM_SIDE BOM_SIDE
		
		JOIN _ITEM_MASTER_1_TABLE IM1
			ON BOM_SIDE.SZKITA = IM1.SZAITM
		
		JOIN _ITEM_MASTER_1_TABLE IM2
			ON BOM_SIDE.SZAITM = IM2.SZAITM
					
		JOIN REQUIREMENT REQUIREMENT
			ON BOM_SIDE.SZKITA = REQUIREMENT.WORKORDER_BASE_ID
			AND BOM_SIDE.SZAITM = REQUIREMENT.PART_ID


 