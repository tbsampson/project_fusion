/*
    F4104 - Item Cross Reference
    IR 20190523 Tom Sampson
    Direct load
*/

SELECT

 ''   IVAN8 -- Address Number [Generic Edit] Numeric (8)
,'MR'   IVXRT -- Type - Cross-Reference Type Code [UDC (41 DT)] String (2)
,LEFT(LTRIM(RTRIM(PART.ID)),25)   IVITM -- Item Number - Short [Generic Edit] Numeric (8)
,dbo.JDEJulian('2019/05/19')   IVEXDJ -- Date - Expired [Generic Edit] Date (6)
,dbo.JDEJulian('2019/12/31')   IVEFTJ -- Date - Effective [Generic Edit] Date (6)
,''   IVMCU -- Business Unit [Generic Edit] String (12)
,ROW_NUMBER() OVER(ORDER BY	PART.ID) + 50000   IVCITM -- Item Number - Customer/Supplier [Generic Edit] String (25)
,LEFT(LTRIM(RTRIM(PART.DESCRIPTION)),30)   IVDSC1 -- Description [Generic Edit] String (30)
,LEFT(LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZDSC2)),30)   IVDSC2 -- Description - Line 2 [Generic Edit] String (30)
,'098'   IVALN -- Search Text - Compressed [Generic Edit] String (30)
,LEFT(LTRIM(RTRIM(PART.ID)),25)   IVLITM -- 2nd Item Number [Generic Edit] String (25)
,''   IVAITM -- 3rd Item Number [Generic Edit] String (25)
,''   IVURCD -- User Reserved Code [Generic Edit] String (2)
,''   IVURDT -- User Reserved Date [Generic Edit] Date (6)
,''   IVURAT -- User Reserved Amount [Generic Edit] Numeric (15)
,''   IVURAB -- User Reserved Number [Generic Edit] Numeric (8)
,''   IVURRF -- User Reserved Reference [Generic Edit] String (15)
,''   IVUSER -- User ID [Generic Edit] String (10)
,''   IVPID -- Program ID [Generic Edit] String (10)
,''   IVJOBN -- Work Station ID [Generic Edit] String (10)
,''   IVUPMJ -- Date - Updated [Generic Edit] Date (6)
,''   IVTDAY -- Time of Day [Generic Edit] Numeric (6)
,''   IVRATO -- Substitute Ratio [Generic Edit] Numeric (15)
,''   IVAPSP -- Substitute Priority [Generic Edit] Numeric (15)
,''   IVIDEM -- Transfer Demand [Generic Edit] Character (1)
,''   IVAPSS -- APS Substitute [Generic Edit] Character (1)
,''   IVCIRV -- Item Revision Level - Customer/Supplier [Generic Edit] String (20)
,''   IVADIND -- Adjustment Indicator [UDC (42 IA)] Character (1)
,''   IVBPIND -- Base Price Indicator [UDC (42 IP)] Character (1)
,''   IVCARDNO -- Card Number [UDC (40R CD)] String (4)

FROM PART PART

JOIN _ITEM_MASTER_SIDE _ITEM_MASTER_SIDE
	ON LTRIM(RTRIM(_ITEM_MASTER_SIDE.PART_ID)) = LTRIM(RTRIM(PART.ID))
		
LEFT JOIN 
	(
		SELECT DISTINCT
			 POL2.PART_ID
			,POL2.PURCHASE_UM
		FROM
			(
				SELECT
					 PART_ID
					,MAX(DESIRED_RECV_DATE) RC_DATE

				FROM PURC_ORDER_LINE
				GROUP BY PART_ID
			) POL1

		JOIN PURC_ORDER_LINE POL2
			ON POL1.RC_DATE = POL2.DESIRED_RECV_DATE
			AND POL1.PART_ID = POL2.PART_ID
	) PO_LINE

	ON PART.ID = PO_LINE.PART_ID


WHERE PART.ABC_CODE <> 'Z'

-- AND LTRIM(RTRIM(_ITEM_MASTER_SIDE.PART_ID)) IS NOT NULL

ORDER BY PART.ROWID