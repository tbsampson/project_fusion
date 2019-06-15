/*
    F4141Z1 Cycle Count zFile
    IR 20190521 Tom Sampson
    BV R4141Z1I
*/


SELECT

'JDE'       SZEDUS -- EDI - User ID {Generic Edit}  [String] (10)
,'BALCYC'   SZEDBT -- EDI - Batch Number {Generic Edit}  [String] (15)
,ROW_NUMBER() OVER(ORDER BY	PART.ID)   
            SZEDTN -- EDI - Transaction Number {Generic Edit}  [String] (22)
,0          SZEDLN -- EDI - Line Number {Generic Edit}  [Numeric] (7)
,''         SZEDCT -- EDI - Document Type {Generic Edit}  [String] (2)
,'JDECYCLE' SZTYTN -- Type - Transaction {UDC (00 TT)}  [String] (8)
,''         SZEDFT -- EDI - Translation Format {Generic Edit}  [String] (10)
,''         SZEDDT -- EDI - Transmission Date {Generic Edit}  [Date] (6)
,1          SZDRIN -- Direction Indicator {UDC (00 DN)}  [Character] (1)
,0          SZEDDL -- EDI - Detail Lines Processed {Generic Edit}  [Numeric] (5)
,0          SZEDSP -- EDI - Successfully Processed {Generic Edit}  [Character] (1)
,''         SZPNID -- Trading Partner ID {Generic Edit}  [String] (15)
,'02'       SZTNAC -- Transaction Action {UDC (00 TA)}  [String] (2)
,''         SZCYNO -- Cycle Count Number {Generic Edit}  [Numeric] (8)
,1          SZCCCD -- Cycle Count Code {UDC (H41 CC)}  [Character] (1)
,_ITEM_MASTER_1_TABLE.SZITM   
            SZITM  -- Item Number - Short {Generic Edit}  [Numeric] (8)
,_ITEM_MASTER_1_TABLE.SZLITM   
            SZLITM -- 2nd Item Number {Generic Edit}  [String] (25)
,_ITEM_MASTER_1_TABLE.SZAITM
            SZAITM -- 3rd Item Number {Generic Edit}  [String] (25)
,'       20001'   
            SZMCU  -- Business Unit {Generic Edit}  [String] (12)
,CASE
    WHEN _ITEM_MASTER_1_TABLE.SZLNTY = 'W' THEN 'SHIP01'
    WHEN LEFT(PART_LOCATION.LOCATION_ID,1) IN ('W','R','S') THEN PART_LOCATION.LOCATION_ID
 END        SZLOCN -- Location {Generic Edit}  [String] (20)
,''         SZLOTN -- Lot/Serial Number {Generic Edit}  [String] (30)
,''         SZSTUN -- Storage Unit Number {Generic Edit}  [Numeric] (8)
,_ITEM_MASTER_SIDE.SZSRP1   
            SZSRP1 -- Sales Catalog Section {UDC (41 S1)}  [String] (3)
,_ITEM_MASTER_SIDE.SZSRP2   
            SZSRP2 -- Sub Section {UDC (41 S2)}  [String] (3)
,_ITEM_MASTER_SIDE.SZSRP3   
            SZSRP3 -- Sales Category Code 3 {UDC (41 S3)}  [String] (3)
,_ITEM_MASTER_SIDE.SZSRP4   
            SZSRP4 -- Sales Category Code 4 {UDC (41 S4)}  [String] (3)
,_ITEM_MASTER_SIDE.SZSRP5   
            SZSRP5 -- Sales Category Code 5 {UDC (41 S5)}  [String] (3)
,_ITEM_MASTER_1_TABLE.SZGLPT
            SZGLPT -- Category - G/L {UDC (41 9)}  [String] (4)
,''         SZTQOH -- Quantity - Total Primary on Hand {Generic Edit}  [Numeric] (15)
,''         SZTAOH -- Amount - Total Primary on Hand {Generic Edit}  [Numeric] (15)
,''         SZTQCT -- Quantity - Total Primary Counted {Generic Edit}  [Numeric] (15)
,''         SZTACT -- Amount - Total Primary Counted {Generic Edit}  [Numeric] (15)
,CAST(PART_LOCATION.QTY * 10000 AS BIGINT)
            SZTRQT -- Quantity Available {Generic Edit}  [Numeric] (15)
,_ITEM_MASTER_1_TABLE.SZUOM1                
            SZUOM  -- Unit of Measure as Input {UDC (00 UM)}  [String] (2)
,CAST(PART.UNIT_MATERIAL_COST * 1000000 AS BIGINT)
            SZUNCS -- Amount - Unit Cost {Generic Edit}  [Numeric] (15)
,dbo.JDEJulian(GETDATE())   
            SZCNTJ -- Date - Counted {Generic Edit}  [Date] (6)
,'CONVERSION'   
            SZCNTB -- Counted By {Generic Edit}  [String] (10)
,''         SZAISL -- Aisle {Generic Edit}  [String] (8)
,''         SZBIN  -- Bin {Generic Edit}  [String] (8)
,'TSAMPSON' SZUSER -- User ID {Generic Edit}  [String] (10)
,'F4141Z1SQL'   
            SZPID  -- Program ID {Generic Edit}  [String] (10)
,''         SZJOBN -- Work Station ID {Generic Edit}  [String] (10)
,dbo.JDEJulian(GETDATE())   
            SZUPMJ -- Date - Updated {Generic Edit}  [Date] (6)
,''         SZTDAY -- Time of Day {Generic Edit}  [Numeric] (6)
,''         SZLOT1 -- Memo Lot 1 {Generic Edit}  [String] (30)
,''         SZLOT2 -- Memo Lot 2 {Generic Edit}  [String] (30)
,''         SZLOT3 -- Memo Lot 3 {Generic Edit}  [String] (30)
,CAST(PART_LOCATION.QTY * 10000 AS BIGINT) 
            SZSQOR -- Units - Secondary Quantity Ordered {Generic Edit}  [Numeric] (15)
,''         SZSQOH -- Quantity on Hand - in Secondary units {Generic Edit}  [Numeric] (15)

FROM PART PART

JOIN PART_LOCATION PART_LOCATION
    ON PART_LOCATION.PART_ID = PART.ID

JOIN LOCATION LOCATION
	ON PART_LOCATION.LOCATION_ID = LOCATION.ID
    
JOIN _ITEM_MASTER_SIDE _ITEM_MASTER_SIDE
	ON LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZAITM)) = LTRIM(RTRIM(PART.ID))
		
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

JOIN _ITEM_MASTER_1_TABLE _ITEM_MASTER_1_TABLE
    ON PART.ID = _ITEM_MASTER_1_TABLE.SZAITM

WHERE PART.ABC_CODE <> 'Z'
AND 
    (
        -- ((LEFT(PART.DESCRIPTION,6) = 'SYSTEM' OR LEFT(PART.DESCRIPTION,2) = 'FG') AND _ITEM_MASTER_SIDE.SZSTKT = 'M')
        _ITEM_MASTER_1_TABLE.SZLNTY = 'W'
        OR LEFT(PART_LOCATION.LOCATION_ID,1) IN ('W','R','S')
    )
AND PART_LOCATION.QTY <> 0
