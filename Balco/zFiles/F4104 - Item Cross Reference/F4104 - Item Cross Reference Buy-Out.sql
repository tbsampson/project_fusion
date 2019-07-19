use BALCO;

/*
    F4104 - Item Cross Reference - Buy-Out
    IR 20190523 Tom Sampson
    Direct load

First, update the _VENDOR table with fresh data from JDE

SELECT ABAN8, ABALKY, ABALPH FROM CVDTA.F0101
WHERE ABAT1 = 'V';


*/
use BALCO;

SELECT



 '0'   IVAN8 -- Address Number [Generic Edit] Numeric (8)
,'MR'   IVXRT -- Type - Cross-Reference Type Code [UDC (41 DT)] String (2)
,IM1.SZITM  IVITM -- Item Number - Short [Generic Edit] Numeric (8)
,'140366'  IVEXDJ -- Date - Expired [Generic Edit] Date (6)
,'119120'   IVEFTJ -- Date - Effective [Generic Edit] Date (6)
,''   IVMCU -- Business Unit [Generic Edit] String (12)
,ISNULL(PART.MFG_PART_ID,'')   IVCITM -- Item Number - Customer/Supplier [Generic Edit] String (25)
,LEFT(PART.DESCRIPTION,30)   IVDSC1 -- Description [Generic Edit] String (30)
,''   IVDSC2 -- Description - Line 2 [Generic Edit] String (30)
,LEFT(
   REPLACE(
	 REPLACE(
	  REPLACE(
	   REPLACE(
		REPLACE(
		  REPLACE(
			REPLACE(
			  REPLACE(
				REPLACE(
				  REPLACE(
					REPLACE(
					  REPLACE(
						REPLACE(
						  REPLACE(
							PART.DESCRIPTION,
						  ' ', ''),
						',', ''),
					  '-', ''),
					'/', ''),
				  '(', ''),
				')', ''),
			  '+', ''),
			'.', ''),
		  '#', ''),
		'%', ''),
	   '''', ''),
	  '*', ''),
	 '&', ''),
	'"', '')
  ,30)
  IVALN -- Search Text - Compressed [Generic Edit] String (30)
,IM1.SZLITM   IVLITM -- 2nd Item Number [Generic Edit] String (25)
,LEFT(PART.ID,25)   IVAITM -- 3rd Item Number [Generic Edit] String (25)
,''   IVURCD -- User Reserved Code [Generic Edit] String (2)
,''   IVURDT -- User Reserved Date [Generic Edit] Date (6)
,''   IVURAT -- User Reserved Amount [Generic Edit] Numeric (15)
,''   IVURAB -- User Reserved Number [Generic Edit] Numeric (8)
,''   IVURRF -- User Reserved Reference [Generic Edit] String (15)
,'TSAMPSON'   IVUSER -- User ID [Generic Edit] String (10)
,'SQL'   IVPID -- Program ID [Generic Edit] String (10)
,''   IVJOBN -- Work Station ID [Generic Edit] String (10)
,dbo.JDEJulian(GETDATE())   IVUPMJ -- Date - Updated [Generic Edit] Date (6)
,''   IVTDAY -- Time of Day [Generic Edit] Numeric (6)
,''   IVRATO -- Substitute Ratio [Generic Edit] Numeric (15)
,''   IVAPSP -- Substitute Priority [Generic Edit] Numeric (15)
,''   IVIDEM -- Transfer Demand [Generic Edit] Character (1)
,'Y'   IVAPSS -- APS Substitute [Generic Edit] Character (1)
,'                    '   IVCIRV -- Item Revision Level - Customer/Supplier [Generic Edit] String (20)
,''   IVADIND -- Adjustment Indicator [UDC (42 IA)] Character (1)
,''   IVBPIND -- Base Price Indicator [UDC (42 IP)] Character (1)
,''   IVCARDNO -- Card Number [UDC (40R CD)] String (4)

FROM _ITEM_MASTER_1_TABLE IM1

JOIN PART PART
	ON PART.ID = IM1.SZAITM
	
	WHERE PART.MFG_PART_ID IS NOT NULL