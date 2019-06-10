/*
F4101Z1 Item Master VER0011
Tom Sampson IR 4/10/2019
CR 6/6/2019

VER0002
- Fixed constraint issue with SZUOM4 and others
VER0003
- Added descriptions in comments from jdetables.com
VER0004
- Added same logic for SZABCM and SZABCI as SZABCS
VER0005
- Changes per Steve from 4/15 applied
VER0006
- Modified for SQL 2008
 VER007
 - added multi-pass feature
VER0008
 - updates from Bill in
VER0009
- updates in from Steve 5/7/2019
VER0010
- corrected UOM 5/14/2019
VER0011
- added pref vendor
*/

USE BALCO;	
DECLARE @Pass INTEGER

SET @Pass = 1

SELECT

		'JDE'			SZEDUS	 -- EDI - User ID	String	Generic Edit	10
-- ---------------------------------------- First run, SZEDBT is Q
		,CASE 
			WHEN @Pass = 1 THEN 'Q' -- Item Master
			WHEN @Pass = 2 THEN 'R' -- Branch/Plant
		 END			SZEDBT	 -- EDI - Batch Number	String	Generic Edit	15
-- ----------------------------------------
		,ROW_NUMBER() OVER(ORDER BY	PART.ID)
						SZEDTN	 -- EDI - Transaction Number	String	Generic Edit	22
		,ROW_NUMBER() OVER(ORDER BY	PART.ID)
						SZEDLN	 -- EDI - Line Number	Numeric	Generic Edit	7
		,''				SZEDCT	 -- EDI - Document Type	String	Generic Edit	2
		,'JDEITEM'		SZTYTN	 -- Type - Transaction	String	UDC (00 TT)	8
		,''				SZEDFT	 -- EDI - Translation Format	String	Generic Edit	10
		,''				SZEDDT	 -- EDI - Transmission Date	Date	Generic Edit	6
		,1				SZDRIN	 -- Direction Indicator	Character	UDC (00 DN)	1
		,''				SZEDDL	 -- EDI - Detail Lines Processed	Numeric	Generic Edit	5
-- ----------------------------------------
		,CASE 
			WHEN @Pass = 1 THEN 'N'
			WHEN @Pass = 2 THEN 'N'
		 END			SZEDSP	 -- EDI - Successfully Processed	Character	Generic Edit	1
-- ----------------------------------------
		,''				SZPNID	 -- Trading Partner ID	String	Generic Edit	15
		,'A'			SZTNAC	 -- Transaction Action	String	UDC (00 TA)	2
-- ----------------------------------------		
		,CASE 
			WHEN @Pass = 1 THEN '1'
			WHEN @Pass = 2 THEN '2'
		 END			SZITBR	 -- Update Item Branch	Character	Generic Edit	1
-- ----------------------------------------
	--	,ROW_NUMBER() OVER(ORDER BY	PART.ID) + 51000
		,_ITEM_MASTER_SIDE.SZITM
						SZITM	 -- Item Number - Short	Numeric	Generic Edit	8
		,''				SZKIT	 -- Parent (short) Item Number	Numeric	Generic Edit	8
		,_ITEM_MASTER_SIDE.SZLITM
						SZLITM	 -- 2nd Item Number	String	Generic Edit	25
		,LEFT(LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZAITM)),25) -- LEFT(LTRIM(RTRIM(PART.ID)),25)
						SZAITM	 -- 3rd Item Number	String	Generic Edit	25
		,LEFT(LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZDSC1)),30)
						SZDSC1	 -- Description	String	Generic Edit	30
		,LEFT(LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZDSC2)),30)
						SZDSC2	 -- Description - Line 2	String	Generic Edit	30
		,''				SZSRTX	 -- Search Text	String	Generic Edit	30
		,''				SZALN	 -- Search Text - Compressed	String	Generic Edit	30
		,LEFT(LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZSRP1)),3)
						SZSRP1	 -- Sales Catalog Section	String	UDC (41 S1)	3
		,LEFT(LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZSRP2)),3)
						SZSRP2	 -- Sub Section	String	UDC (41 S2)	3
		,LEFT(LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZSRP3)),3)
						SZSRP3	 -- Sales Category Code 3	String	UDC (41 S3)	3
		,CASE
			WHEN _ITEM_MASTER_SIDE.SZSRP4 IS NULL OR _ITEM_MASTER_SIDE.SZSRP4 = '' 
			THEN ''
			ELSE'00' + CAST(CAST(LEFT(LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZSRP4)),3) AS INTEGER) AS VARCHAR)
		 END
						SZSRP4	 -- Sales Category Code 4	String	UDC (41 S4)	3
		,CASE
			WHEN _ITEM_MASTER_SIDE.SZSRP5 IS NULL OR _ITEM_MASTER_SIDE.SZSRP5 = '' 
			THEN ''
			ELSE'00' + CAST(CAST(LEFT(LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZSRP5)),3) AS INTEGER) AS VARCHAR)
		 END
						SZSRP5	 -- Sales Category Code 5	String	UDC (41 S5)	3
		,CASE
			WHEN _ITEM_MASTER_SIDE.SZSRP6 IS NULL OR _ITEM_MASTER_SIDE.SZSRP6 = '' 
			THEN ''
			ELSE'00' + CAST(CAST(LEFT(LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZSRP6)),3) AS INTEGER) AS VARCHAR)
		 END
						SZSRP6	 -- Category Code 6	String	UDC (41 06)	6
		,''				SZSRP7	 -- Category Code 7	String	UDC (41 07)	6
		,''				SZSRP8	 -- Category Code 8	String	UDC (41 08)	6
		,''				SZSRP9	 -- Category Code 9	String	UDC (41 09)	6
		,''				SZSRP0	 -- Category Code 10	String	UDC (41 10)	6
		,''				SZPRP1	 -- Commodity Class	String	UDC (41 P1)	3
		,''				SZPRP2	 -- Commodity Sub Class	String	UDC (41 P2)	3
		,''				SZPRP3	 -- Supplier Rebate Code	String	UDC (41 P3)	3
		,LEFT(LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZPRP4)),3)
						SZPRP4	 -- Master Planning Family	String	UDC (41 P4)	3
		,''				SZPRP5	 -- Purchasing Category Code 5	String	UDC (41 P5)	3
		,''				SZPRP6	 -- Group - Item Dimension	String	UDC (41 01)	6
		,''				SZPRP7	 -- Group - Warehouse Process 1	String	UDC (41 02)	6
		,''				SZPRP8	 -- Group - Warehouse Process 2	String	UDC (41 02)	6
		,''				SZPRP9	 -- Group - Warehouse Process 3	String	UDC (41 02)	6
		,''				SZPRP0	 -- Item Pool	String	UDC (41 05)	6
		,''				SZCDCD	 -- Commodity Code	String	Generic Edit	15
		,''				SZPDGR	 -- Product Group	String	UDC (41B PG)	3
		,''				SZDSGP	 -- Dispatch Group	String	UDC (41B DG)	3
		,''				SZPRGR	 -- Item Price Group	String	UDC (40 PI)	8
		,''				SZRPRC	 -- Reprice (Basket Price) Category	String	UDC (40 PI)	8
		,''				SZORPR	 -- Order Reprice Category	String	UDC (40 PI)	8
		,CAST(_ITEM_MASTER_SIDE.SZBUYR AS INTEGER)
						SZBUYR	 -- Buyer Number	Numeric	Generic Edit	8
		,LEFT(LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZDRAW)),20)
						SZDRAW	 -- Drawing Number	String	Generic Edit	20
		,''				SZRVNO	 -- Last Revision No.	String	Generic Edit	2
		,''				SZDSZE	 -- Drawing Size	Character	Generic Edit	1
		,''				SZVCUD	 -- Cubic Dimensions - Volume	Numeric	Generic Edit	15
		,''				SZCARS	 -- Carrier Number	Numeric	Generic Edit	8
		,''				SZCARP	 -- Preferred Carrier - Purchasing	Numeric	Generic Edit	8
		,''				SZSHCN	 -- Shipping Conditions Code	String	UDC (41 C)	3
		,''				SZSHCM	 -- Shipping Commodity Class	String	UDC (41 E)	3
		,CASE
			WHEN PART.STOCK_UM IS NULL THEN ''
			WHEN PART.STOCK_UM = 'BG' THEN 'BC'
			WHEN PART.STOCK_UM = 'GL' THEN 'GA'
			WHEN PART.STOCK_UM = 'GRAMS' THEN 'GM'
			WHEN PART.STOCK_UM = 'M' THEN 'MT'
			ELSE LEFT(LTRIM(RTRIM(PART.STOCK_UM)),2)
		END             SZUOM1	 -- Unit of Measure - Primary	String	UDC (00 UM)	2		
		,CASE
			WHEN PART.STOCK_UM IS NULL THEN ''
			WHEN PART.STOCK_UM = 'BG' THEN 'BC'
			WHEN PART.STOCK_UM = 'GL' THEN 'GA'
			WHEN PART.STOCK_UM = 'GRAMS' THEN 'GM'
			WHEN PART.STOCK_UM = 'M' THEN 'MT'
			ELSE LEFT(LTRIM(RTRIM(PART.STOCK_UM)),2)
		END             SZUOM2	 -- Unit of Measure - Secondary	String	UDC (00 UM)	2	
		,CASE
			WHEN PO_LINE.PURCHASE_UM IS NULL THEN ''
			WHEN PO_LINE.PURCHASE_UM = 'BG' THEN 'BC'
			WHEN PO_LINE.PURCHASE_UM = 'GL' THEN 'GA'
			WHEN PO_LINE.PURCHASE_UM = 'GRAMS' THEN 'GM'
			WHEN PO_LINE.PURCHASE_UM = 'M' THEN 'MT'
			ELSE LEFT(LTRIM(RTRIM(PART.STOCK_UM)),2)
		END             SZUOM3	 -- Unit of Measure - Purchasing	String	UDC (00 UM)	2	
		,CASE
			WHEN PART.STOCK_UM IS NULL THEN ''
			WHEN PART.STOCK_UM = 'BG' THEN 'BC'
			WHEN PART.STOCK_UM = 'GL' THEN 'GA'
			WHEN PART.STOCK_UM = 'GRAMS' THEN 'GM'
			WHEN PART.STOCK_UM = 'M' THEN 'MT'
			ELSE LEFT(LTRIM(RTRIM(PART.STOCK_UM)),2)
		END             SZUOM4	 -- Unit of Measure - Pricing	String	UDC (00 UM)	2
		,CASE
			WHEN PART.STOCK_UM IS NULL THEN ''
			WHEN PART.STOCK_UM = 'BG' THEN 'BC'
			WHEN PART.STOCK_UM = 'GL' THEN 'GA'
			WHEN PART.STOCK_UM = 'GRAMS' THEN 'GM'
			WHEN PART.STOCK_UM = 'M' THEN 'MT'
			ELSE LEFT(LTRIM(RTRIM(PART.STOCK_UM)),2)
		END             SZUOM6	 -- Unit of Measure - Shipping	String	UDC (00 UM)	2
		,CASE
			WHEN PART.STOCK_UM IS NULL THEN ''
			WHEN PART.STOCK_UM = 'BG' THEN 'BC'
			WHEN PART.STOCK_UM = 'GL' THEN 'GA'
			WHEN PART.STOCK_UM = 'GRAMS' THEN 'GM'
			WHEN PART.STOCK_UM = 'M' THEN 'MT'
			ELSE LEFT(LTRIM(RTRIM(PART.STOCK_UM)),2)
		END             SZUOM8	 -- Unit of Measure - Production	String	UDC (00 UM)	2
		,CASE
			WHEN PART.STOCK_UM IS NULL THEN ''
			WHEN PART.STOCK_UM = 'BG' THEN 'BC'
			WHEN PART.STOCK_UM = 'GL' THEN 'GA'
			WHEN PART.STOCK_UM = 'GRAMS' THEN 'GM'
			WHEN PART.STOCK_UM = 'M' THEN 'MT'
			ELSE LEFT(LTRIM(RTRIM(PART.STOCK_UM)),2)
		END             SZUOM9	 -- Unit of Measure - Component	String	UDC (00 UM)	2
		,'LB'			SZUWUM	 -- Unit of Measure - Weight	String	UDC (00 UM)	2
		,'FC'			SZUVM1	 -- Unit of Measure - Volume	String	UDC (00 UM)	2
		,CASE
			WHEN LEFT(LTRIM(RTRIM(PART.STOCK_UM)),2) = 'GL'
			THEN 'GA'
			ELSE ISNULL(LEFT(LTRIM(RTRIM(PART.STOCK_UM)),2),'')
		 END
						SZSUTM	 -- Unit of Measure - Stocking	String	UDC (00 UM)	2
		,'W'			SZUMVW	 -- Unit of Measure - Volume or Weight	Character	UDC (39 VW)	1
		,CASE
			WHEN PART.ABC_CODE = 'A' THEN 'MON'
			WHEN PART.ABC_CODE = 'B' THEN 'QTR'
			WHEN PART.ABC_CODE = 'C' THEN 'SEM'
			ELSE ''
		 END			SZCYCL	 -- Cycle Count Category	String	UDC (41 8)	3
		,CASE 
			-- WHEN PART.ID = 'PLC105FC12' THEN 'M'
			WHEN _ITEM_MASTER_SIDE.SZSTKT = 'P' THEN 'BC10'
			WHEN _ITEM_MASTER_SIDE.SZSTKT = 'S' THEN 'BC50'
			WHEN (
						LEFT(_ITEM_MASTER_SIDE.SZDSC1,6) = 'SYSTEM' 
					OR	LEFT(_ITEM_MASTER_SIDE.SZDSC1,2) = 'FG'
				  ) THEN 'BC30'
			ELSE 'BC20'
		 END			SZGLPT	 -- Category - G/L	String	UDC (41 9)	4
		,2				SZPLEV	 -- Level - Sales Base Price	Character	UDC (H40 PL)	1
		,3				SZPPLV	 -- Level - Purchase Price	Character	UDC (H40 PP)	1
		,2				SZCLEV	 -- Level - Inventory Cost	Character	UDC (H40 CL)	1
		,''				SZPRPO	 -- Grade/Potency Pricing	Character	UDC (40 LP)	1
		,'Y'			SZCKAV	 -- Check Availability Y/N	Character	Generic Edit	1
		,'P'			SZBPFG	 -- Bulk/Packed Flag	Character	UDC (41B BF)	1
		,''				SZSRCE	 -- Layer Code - Source	Character	UDC (H41 SR)	1
		,'N'			SZOT1Y	 -- Potency Control	Character	Generic Edit	1
		,'N'			SZOT2Y	 -- Grade Control	Character	Generic Edit	1
		,''				SZSTDP	 -- Standard Potency	Numeric	Generic Edit	7
		,''				SZFRMP	 -- From Potency	Numeric	Generic Edit	7
		,''				SZTHRP	 -- Thru Potency	Numeric	Generic Edit	7
		,''				SZSTDG	 -- Standard Grade	String	UDC (40 LG)	3
		,''				SZFRGD	 -- From Grade	String	UDC (40 LG)	3
		,''				SZTHGD	 -- Thru Grade	String	UDC (40 LG)	3
		,''				SZCOTY	 -- Component Type	Character	UDC (H40 CP)	1
		,CASE WHEN PART.ID = 'PLC105FC12' THEN 'M'
			ELSE LEFT(LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZSTKT)),1)
		 END SZSTKT	 -- Stocking Type	Character	UDC (41 I)	1
		,CASE
            WHEN LEFT(PART.DESCRIPTION,6) = 'SYSTEM' AND LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZSTKT)) = 'M' THEN 'W'
            WHEN LEFT(PART.DESCRIPTION,2) = 'FG' AND LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZSTKT)) = 'M' THEN 'W'
            ELSE 'S'
         END			SZLNTY	 -- Line Type	String	Generic Edit	2
		,'N'			SZCONT	 -- Contract - Item	Character	Generic Edit	1
		,'Y'			SZBACK	 -- Backorders Allowed (Y/N)	Character	Generic Edit	1
		,''				SZIFLA	 -- Item Flash Message	String	UDC (40 FL)	2
		,''				SZTFLA	 -- Standard Unit of Measure Conversion	String	UDC (H40 ST)	2
		,''				SZINMG	 -- Print Message	String	UDC (40 PM)	10
		,CASE
			WHEN PART.ABC_CODE IN ('A', 'B', 'C') THEN PART.ABC_CODE
		 ELSE 'D'
		END				SZABCS	 -- ABC Code 1 - Sales - Inventory	Character	UDC (H41 AB)	1
		,CASE
			WHEN PART.ABC_CODE IN ('A', 'B', 'C') THEN PART.ABC_CODE
		 ELSE 'D'
		END				SZABCM	 -- ABC Code 1 - Margin - Inventory	Character	UDC (H41 AB)	1
		,CASE
			WHEN PART.ABC_CODE IN ('A', 'B', 'C') THEN PART.ABC_CODE
		 ELSE 'D'
		END				SZABCI	 -- ABC Code 3 - Investment - Inventory	Character	UDC (H41 AB)	1
		,''				SZOVR	 -- ABC Code Override Indicator	Character	Generic Edit	1
		,''				SZWARR	 -- Type Warranty	String	Generic Edit	8
		,''				SZCMCG	 -- Commission Category	String	Generic Edit	8
		,'N'			SZSRNR	 -- Serial Number Required	Character	UDC (H41 NR)	1
		,''				SZPMTH	 -- Method - Kit/Configurator Pricing	Character	UDC (H41 PM)	1
		,''				SZFIFO	 -- FIFO Processing	Character	Generic Edit	1
		,''				SZLOTS	 -- Lot Status Code	Character	UDC (41 L)	1
		,''				SZSLD	 -- Days - Shelf Life Days	Numeric	Generic Edit	6
		,CAST(_ITEM_MASTER_SIDE.SZANPL AS INTEGER)
						SZANPL	 -- Planner Number	Numeric	Generic Edit	8
		,LEFT(LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZMPST)),1)
						SZMPST	 -- Planning Code	Character	UDC (H41 MP)	1
		,''				SZPCTM	 -- Percent Margin	Numeric	Generic Edit	7
		,''				SZMMPC	 -- Margin Maintenance (%)	Numeric	Generic Edit	7
		,''				SZPTSC	 -- Material Status	String	UDC (40 PS)	2
		,''				SZSNS	 -- Round to Whole Number	Character	UDC (H41 SN)	1
		,CAST(_ITEM_MASTER_SIDE.SZLTLV AS INTEGER)
						SZLTLV	 -- Leadtime Level	Numeric	Generic Edit	5
		,''				SZLTMF	 -- Leadtime MFG	Numeric	Generic Edit	5
		,''				SZLTCM	 -- Leadtime Cumulative	Numeric	Generic Edit	5
		,LEFT(LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZOPC)),1)
						SZOPC	 -- Order Policy Code	Character	UDC (H41 OP)	1
		,CASE WHEN
			LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZOPV)) = 'N/A' THEN ''
			ELSE CAST(_ITEM_MASTER_SIDE.SZOPV AS INTEGER)		
		 END			SZOPV	 -- Value - Order Policy	Numeric	Generic Edit	15
		,100*10000		SZACQ	 -- Quantity - Accounting Cost	Numeric	Generic Edit	15
									-- changed to 100*10000 4/16
		,''				SZMLQ	 -- Quantity - MFG Leadtime	Numeric	Generic Edit	15
		,''				SZLTPU	 -- Leadtime Per Unit	Numeric	Generic Edit	5
		,CASE 
			WHEN LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZMPSP)) = 'N/A' THEN ''
			WHEN LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZMPSP)) IS NULL OR LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZMPSP)) = '' THEN ''
			WHEN LEFT(LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZMPSP)),1) IS NULL THEN ''
			ELSE LEFT(LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZMPSP)),1)	
		 END			SZMPSP	 -- Planning Time Fence Rule	Character	UDC (34 TF)	1
		,'F'			SZMRPP	 -- Fixed or Variable Leadtime	Character	UDC (H41 MS)	1
		,'U'			SZITC	 -- Issue Type Code	Character	UDC (41 IT)	1
		,'N'			SZORDW	 -- Order With	Character	Generic Edit	1
		,CASE WHEN LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZMTF1)) = 'N/A' THEN ''
			ELSE CAST(_ITEM_MASTER_SIDE.SZMTF1 AS INTEGER)
		 END			SZMTF1	 -- Planning Time Fence Days	Numeric	Generic Edit	5
		,''				SZMTF2	 -- Freeze Time Fence Days	Numeric	Generic Edit	5
		,CAST(_ITEM_MASTER_SIDE.SZMTF3 AS INTEGER)
						SZMTF3	 -- Message Time Fence Days	Numeric	Generic Edit	5
		,''				SZMTF4	 -- MPS/MRP Time Fence 4	Numeric	Generic Edit	5
		,''				SZMTF5	 -- Shipment Leadtime Offset	Numeric	Generic Edit	5
		,''				SZEXPD	 -- Expedite Damper Days	Numeric	Generic Edit	5
		,''				SZDEFD	 -- Defer Damper Days	Numeric	Generic Edit	5
		,''				SZSFLT	 -- Safety Leadtime	Numeric	Generic Edit	5
		,CASE
			WHEN LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZSTKT)) = 'M' THEN 'M'
			ELSE 'B'
		 END 			SZMAKE	 -- Make/Buy Code	Character	UDC (H40 MA)	1
		,''				SZCOBY	 -- Co-Products/By-Products/Intermediate	Character	UDC (H40 CO)	1
		,''				SZLLX	 -- Low Level Code	Numeric	Generic Edit	3
		,1				SZCMGL	 -- Commitment Method	Character	UDC (H40 CM)	1
		,999			SZCOMH	 -- Commitment - Specific (Days)	Numeric	Generic Edit	3
		,''				SZAVRT	 -- Replenishment Hours - Standard	Numeric	Generic Edit	15
		,''				SZUPCN	 -- UPC Number	String	Generic Edit	13
		,''				SZSCC0	 -- Aggregate SCC Code (PI=0)	String	Generic Edit	14
		,''				SZUMDF	 -- Unit of Measure - Aggregate UPC	String	UDC (00 UM)	2
		,''				SZUMS0	 -- Unit of Measure - SCC(PI=0)	String	UDC (00 UM)	2
		,''				SZUMUP	 -- Unit of Measure - UPC	String	UDC (00 UM)	2
		,''				SZUMS1	 -- Unit of Measure - SCC(PI=1)	String	UDC (00 UM)	2
		,''				SZUMS2	 -- Unit of Measure - SCC(PI=2)	String	UDC (00 UM)	2
		,''				SZUMS3	 -- Unit of Measure - SCC(PI=3)	String	UDC (00 UM)	2
		,''				SZUMS4	 -- Unit of Measure - SCC(PI=4)	String	UDC (00 UM)	2
		,''				SZUMS5	 -- Unit of Measure - SCC(PI=5)	String	UDC (00 UM)	2
		,''				SZUMS6	 -- Unit of Measure - SCC(PI=6)	String	UDC (00 UM)	2
		,''				SZUMS7	 -- Unit of Measure - SCC(PI=7)	String	UDC (00 UM)	2
		,''				SZUMS8	 -- Unit of Measure - SCC(PI=8)	String	UDC (00 UM)	2
		,'N'			SZWTRQ	 -- Item Weight Required Y/N	Character	Generic Edit	1
		,''				SZEQTY	 -- Container Code	String	UDC (46 EQ)	5
		,0				SZPOC	 -- Issue and Receipt	Character	UDC (43 IR)	1
		,'       20001'	SZMCU	 -- Business Unit	String	Generic Edit	12
		,'       20001'	SZMMCU	 -- Branch	String	Generic Edit	12
		,ISNULL(TV.ID1,'')			SZVEND	 -- Primary / Last Supplier Number	Numeric	Generic Edit	8
		,''				SZORIG	 -- Country of Origin	String	UDC (00 CN)	3
		,''				SZROPI	 -- Reorder Point - Input	Numeric	Generic Edit	15
		-- ,ISNULL(PART.ORDER_POINT*10000,0)		
		,''				SZROQI	 -- Reorder Quantity - Input	Numeric	Generic Edit	15
		,''				SZRQMX	 -- Reorder Quantity - Maximum	Numeric	Generic Edit	15
		,''				SZRQMN	 -- Reorder Quantity - Minimum	Numeric	Generic Edit	15
		,''				SZWOMO	 -- Quantity - Order Multiples (SO/PO)	Numeric	Generic Edit	7
		,''				SZSERV	 -- Service Level	Numeric	Generic Edit	7
		,ISNULL(PART.ORDER_POINT*10000,0)		
						SZSAFE	 -- Safety Stock	Numeric	Generic Edit	15
											--  was CAST(REPLACE(_ITEM_MASTER_SIDE.SZSAFE,',','') AS INTEGER)
		,''				SZFUF1	 -- AIA Document Flag	Character	UDC (H40 FU)	1
		,'N'			SZTX	 -- Purchasing Taxable (Y/N)	Character	UDC (H00 TV)	1
		,'N'			SZTAX1	 -- Sales Taxable (Y/N)	Character	UDC (H00 TV)	1
		,''				SZMRPD	 -- Item Display Code	Character	UDC (H41 MR)	1
		,''				SZMRPC	 -- Flag - Net Change	Character	UDC (H41 MQ)	1
		,''				SZUPC	 -- Units - Per Container	Numeric	Generic Edit	15
		,''				SZMERL	 -- Item Revision Level	String	Generic Edit	3
		,''				SZECO	 -- ECO Number	String	Generic Edit	12
		,''				SZECTY	 -- Engineering Change Reason	String	UDC (40 CR)	2
		,''				SZECOD	 -- Date - Engineering Change Date	Date	Generic Edit	6
		,''				SZMOVD	 -- Move Hours - Standard	Numeric	Generic Edit	5
		,''				SZQUED	 -- Queue Hours - Standard	Numeric	Generic Edit	5
		,''				SZSETL	 -- Setup Labor - Standard	Numeric	Generic Edit	15
		,''				SZSRNK	 -- Shrink Factor	Numeric	Generic Edit	15
		,'%'			SZSRKF	 -- Shrink Factor Method	Character	UDC (H40 SR)	1
		,'U'			SZTIMB	 -- Time Basis Code	Character	UDC (30 TB)	1
		,''				SZBQTY	 -- Units - Batch Quantity	Numeric	Generic Edit	15
		,''				SZMULT	 -- Quantity - Order Multiples (MRP)	Numeric	Generic Edit	15
		,''				SZLFDJ	 -- Date - Future Use	Date	Generic Edit	6
		,'Y'			SZMLOT	 -- Mix Dates / Lots (Y/N)	Character	Generic Edit	1
		,CASE
            WHEN LEFT(PART.DESCRIPTION,6) = 'SYSTEM' AND _ITEM_MASTER_SIDE.SZSTKT = 'M' THEN 'SHIP01'
            WHEN LEFT(PART.DESCRIPTION,2) = 'FG' AND _ITEM_MASTER_SIDE.SZSTKT = 'M' THEN 'SHIP01'
            ELSE ''
         END			SZLOCN	 -- Location	String	Generic Edit	20
		,''				SZLOTN	 -- Lot/Serial Number	String	Generic Edit	30
		,''				SZURCD	 -- User Reserved Code	String	Generic Edit	2
		,''				SZURDT	 -- User Reserved Date	Date	Generic Edit	6
		,''				SZURAT	 -- User Reserved Amount	Numeric	Generic Edit	15
		,''				SZURAB	 -- User Reserved Number	Numeric	Generic Edit	8
		,''				SZURRF	 -- User Reserved Reference	String	Generic Edit	15
		,''				SZTORG	 -- Transaction Originator	String	Generic Edit	10
		,''				SZSTAW	 -- Status	Character	UDC (00 WS)	1
		,''				SZEFFT	 -- Effective - Thru Date	Date	Generic Edit	6
		,''				SZDOC	 -- Document (Voucher Invoice etc.)	Numeric	Generic Edit	8
		,''				SZDCT	 -- Document Type	String	UDC (00 DT)	2
		,''				SZUSER	 -- User ID	String	Generic Edit	10
		,''				SZPID	 -- Program ID	String	Generic Edit	10
		,''				SZJOBN	 -- Work Station ID	String	Generic Edit	10
		,''				SZUPMJ	 -- Date - Updated	Date	Generic Edit	6
		,''				SZTDAY	 -- Time of Day	Numeric	Generic Edit	6
		,''				SZTMPL	 -- Template	String	Generic Edit	20
		,''				SZSEG1	 -- Segment 1	String	Generic Edit	10
		,''				SZSEG2	 -- Segment 2	String	Generic Edit	10
		,''				SZSEG3	 -- Segment 3	String	Generic Edit	10
		,''				SZSEG4	 -- Segment 4	String	Generic Edit	10
		,''				SZSEG5	 -- Segment 5	String	Generic Edit	10
		,''				SZSEG6	 -- Segment 6	String	Generic Edit	10
		,''				SZSEG7	 -- Segment 7	String	Generic Edit	10
		,''				SZSEG8	 -- Segment 8	String	Generic Edit	10
		,''				SZSEG9	 -- Segment 9	String	Generic Edit	10
		,''				SZSEG0	 -- Segment 10	String	Generic Edit	10
		,0				SZAING	 -- Active Ingredient Flag	Character	Generic Edit	1
		,1				SZCMDM	 -- Commitment Date Method	Character	UDC (H40 CD)	1
		,''				SZDPPO	 -- Dual Picking Process Option	Character	Generic Edit	1
		,''				SZDUAL	 -- Dual Unit Of Measure Item	Character	Generic Edit	1
		,1				SZLECM	 -- Lot Expiraton Date Calculation Method	Character	UDC (H41 EC)	1
		,''				SZMIC	 -- Matrix Controlled	Character	UDC (41 MA)	1
		,''				SZXDCK	 -- Cross-Docking Flag	Character	Generic Edit	1
		,''				SZDLTL	 -- Dual Tolerance	Numeric	Generic Edit	7
		,''				SZLEDD	 -- Lot Effective Default Days	Numeric	Generic Edit	6
		,''				SZPEFD	 -- Purchasing Effective Days	Numeric	Generic Edit	6
		,''				SZSBDD	 -- Sell By Default Days	Numeric	Generic Edit	6
		,''				SZU1DD	 -- User Lot Date 1 Default Days	Numeric	Generic Edit	6
		,''				SZU2DD	 -- User Lot Date 2 Default Days	Numeric	Generic Edit	6
		,''				SZU3DD	 -- User Lot Date 3 Default Days	Numeric	Generic Edit	6
		,''				SZU4DD	 -- User Lot Date 4 Default Days	Numeric	Generic Edit	6
		,''				SZU5DD	 -- User Lot Date 5 Default Days	Numeric	Generic Edit	6
		,''				SZBBDD	 -- Best Before Default Days	Numeric	Generic Edit	6
		,''				SZLOTC	 -- Lot Status Code Expanded	String	Generic Edit	3
		,1				SZEXPI	 -- Explode Item (1/0)	Character	Generic Edit	1
		,''				SZCONB	 -- Consumable	Character	Generic Edit	1
		,''				SZPRI1	 -- Priority One Alert Level	Numeric	Generic Edit	15
		,''				SZPRI2	 -- Priority Two Alert Level	Numeric	Generic Edit	15
		,''				SZGCMP	 -- Composition	Character	Generic Edit	1
		,''				SZAPSC	 -- Constraints Flag	Character	UDC (42 AC)	1
		,''				SZCMETH	 -- Method - Configurator Costing	Character	UDC (41 CM)	1
		,''				SZLAF	 -- Lot Audit Flag	Character	Generic Edit	1
		,''				SZLTFM	 -- Special Lot Format	Character	Generic Edit	1
		,''				SZRWLA	 -- Restrict Work Order Lot Assignment	Character	Generic Edit	1
		,''				SZLNPA	 -- Lot Number Pre-Assignment	Character	Generic Edit	1
		,''				SZASHL	 -- Allow Shipping of Held Lots	Character	Generic Edit	1
		,''				SZVMINV	 -- Vendor Managed Inventory	Character	Generic Edit	1
		,''				SZLTCV	 -- Leadtime Conversion Factor	Numeric	Generic Edit	15
		,''				SZOPTH	 -- Minimum Operational Threshold	Numeric	Generic Edit	15
		,''				SZCUTH	 -- Minimum Cumulative Threshold	Numeric	Generic Edit	15
		,''				SZUMTH	 -- Operational Threshold Unit of Measure	String	UDC (31B UM)	3
		,''				SZLMFG	 -- Lean Manufacturing Flag	Character	Generic Edit	1
		,''				SZLINE	 -- Line/Cell Identifier	String	Generic Edit	12
		,''				SZDFTPCT	 -- Total Product Cycle Time	Numeric	Generic Edit	20
		,''				SZKBIT	 -- Kanban Item	Character	Generic Edit	1
		,''				SZDFENDITM	 -- Demand Flow End Item Flag	Character	Generic Edit	1
		,''				SZKANEXLL	 -- Kanban Explode to Lower Level	Character	Generic Edit	1
		,''				SZSCPSELL	 -- Sellable Item	Character	UDC (34A SA)	1
		,''				SZMOPTH	 -- Maximum Operational Threshold	Numeric	Generic Edit	15
		,''				SZMCUTH	 -- Maximum Cumulative Threshold	Numeric	Generic Edit	15
		,''				SZCUMTH	 -- Cumulative Threshold Unit of Measure	String	UDC (31B UM)	3
		,''				SZATPRN	 -- ATP Rule Name	String	Generic Edit	80
		,''				SZATPCA	 -- Check ATP	Character	UDC (34A CA)	1
		,''				SZATPAC	 -- ATP Components	String	UDC (34A AP)	5
		,''				SZCOORE	 -- Country of Origin Required Flag	Character	Generic Edit	1
		,''				SZVCPFC	 -- ATO Forecast Control	String	UDC (34A CF)	20
		,''				SZPNYN	 -- Production Number Controlled	Character	Generic Edit	1

			
FROM _ITEM_MASTER_SIDE _ITEM_MASTER_SIDE

LEFT JOIN PART PART
	ON _ITEM_MASTER_SIDE.SZAITM = PART.ID
		
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

	ON _ITEM_MASTER_SIDE.SZAITM = PO_LINE.PART_ID

LEFT JOIN VENDOR VENDOR
	ON PART.PREF_VENDOR_ID = VENDOR.ID

LEFT JOIN _TEMP_VENDORS TV
	ON TV.ID2 = 'BC_' + CAST(VENDOR.ID AS VARCHAR)

ORDER BY PART.ROWID