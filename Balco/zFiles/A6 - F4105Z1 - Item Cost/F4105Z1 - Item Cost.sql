/*
F4105Z1 Item Cost File 1 VER0001
IR 4/17/2019
Tom Sampson
BV R4105Z1I

MAKE SURE YOU LOADED _ITEM_MASTER_1_TABLE!

*/
use BALCO;

DECLARE @Load INTEGER
-- Set 1 or 2 for 1st/2nd load
SET @Load = 1

SELECT

	 'JDE'		SZEDUS			 -- EDI - User ID String Generic Edit (10)
	,CASE 
		WHEN @Load = 1 
			THEN 'BALIC1'
		WHEN @Load = 2
			THEN 'BALIC2'
		WHEN @Load = 3
			THEN 'BALIC3'
	 END		SZEDBT			 -- EDI - Batch Number String Generic Edit (15)
	,ROW_NUMBER() OVER(ORDER BY	PART.ROWID)			
				SZEDTN			 -- EDI - Transaction Number String Generic Edit (22)
	,0			SZEDLN			 -- EDI - Line Number Numeric Generic Edit (7)
	,''			SZEDCT			 -- EDI - Document Type String Generic Edit (2)
	,'JDEIC'	SZTYTN			 -- Type - Transaction String UDC (00 TT) (8)
	,''			SZEDFT			 -- EDI - Translation Format String Generic Edit (10)
	,''			SZEDDT			 -- EDI - Transmission Date Date Generic Edit (6)
	,1			SZDRIN			 -- Direction Indicator Character UDC (00 DN) (1)
	,''			SZEDDL			 -- EDI - Detail Lines Processed Numeric Generic Edit (5)
	,' '		SZEDSP			 -- EDI - Successfully Processed Character Generic Edit (1)
	,''			SZPNID			 -- Trading Partner ID String Generic Edit (15)
	,'A'		SZTNAC			 -- Transaction Action String UDC (00 TA) (2)
	,IM1.SZITM 			
				SZITM			 -- Item Number - Short Numeric Generic Edit (8)
	,IM1.SZLITM			
				SZLITM			 -- 2nd Item Number String Generic Edit (25)
	,IM1.SZAITM	
                SZAITM			 -- 3rd Item Number String Generic Edit (25)
	,'       20001'	
                SZMCU			 -- Business Unit String Generic Edit (12)
	,''			SZLOCN			 -- Location String Generic Edit (20)
	,''			SZLOTN			 -- Lot/Serial Number String Generic Edit (30)
	,''			SZLOTG			 -- Lot Grade String UDC (40 LG) (3)
	,CASE
		WHEN @Load = 1 THEN '08'
		WHEN @Load = 2 THEN '07'
		WHEN @Load = 3 THEN '99'
		ELSE 'Error' -- forces load constraint failure
		END		SZLEDG			 -- Cost Method String UDC (40 CM) (2)
	
	/*
	,CASE 
		WHEN IM1.SZSTKT = 'M' THEN IM1.CAST(PART.UNIT_MATERIAL_COST * 1.7 * 10000 AS BIGINT)	
		ELSE IM1.CAST(PART.UNIT_MATERIAL_COST * 10000 AS BIGINT)
	 END		SZUNCS			 -- Amount - Unit Cost Numeric Generic Edit (15)
	 */
	
	,CAST(PART.UNIT_MATERIAL_COST * 10000 AS BIGINT)
				SZUNCS			 -- Amount - Unit Cost Numeric Generic Edit (15)
	,CASE
		WHEN @Load = 1 THEN 'P'
		WHEN @Load = 2 THEN ''
		WHEN @Load = 3 THEN ''
		ELSE 'Error' -- forces load constraint failure
		END		SZCSPO			 -- Costing Selection - Purchasing Character UDC (H40 CT) (1)
	,CASE
		WHEN @Load = 1 THEN ''
		WHEN @Load = 2 THEN 'I'
		WHEN @Load = 3 THEN ''
		ELSE 'Error' -- forces load constraint failure
		END		SZCSIN			 -- Costing Selection - Inventory Character UDC (H40 CS) (1)
	,''			SZURCD			 -- User Reserved Code String Generic Edit (2)
	,''			SZURDT			 -- User Reserved Date Date Generic Edit (6)
	,''			SZURAT			 -- User Reserved Amount Numeric Generic Edit (15)
	,''			SZURAB			 -- User Reserved Number Numeric Generic Edit (8)
	,''			SZURRF			 -- User Reserved Reference String Generic Edit (15)
	,''			SZTORG			 -- Transaction Originator String Generic Edit (10)
	,'TSAMPSON'	SZUSER			 -- User ID String Generic Edit (10)
	,'BALIC'	SZPID			 -- Program ID String Generic Edit (10)
	,''			SZJOBN			 -- Work Station ID String Generic Edit (10)
	,dbo.JDEJulian(GETDATE())			
				SZUPMJ			 -- Date - Updated Date Generic Edit (6)
	,''			SZTDAY			 -- Time of Day Numeric Generic Edit (6)
	,''			SZCCFL			 -- Cost Changed Flag Character Generic Edit (1)
	,''			SZOSTC			 -- Overstock Cost Numeric Generic Edit (15)
	,''			SZCRCS			 -- Carrying Cost Numeric Generic Edit (15)
	,''			SZSTOC			 -- Stockout Cost Numeric Generic Edit (15)

FROM PART PART
/*
JOIN _ITEM_MASTER_1_TABLE CONV
	ON CONV.SZLITM = PART.ID
*/
JOIN _ITEM_MASTER_1_TABLE IM1
	ON LEFT(PART.ID,25) = LEFT(IM1.SZLITM,25)


WHERE PART.ABC_CODE <> 'Z'
AND PART.ABC_CODE IS NOT NULL

ORDER BY PART.ROWID