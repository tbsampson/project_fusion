/*SELEC
    F42019 - Sales Order Header History Definition
    IR 20190528 Tom Sampson
*/
use BALCO;
SELECT

 '00020'   SHKCOO -- Order Company (Order Number) [Generic Edit] String (5)
,ORDER_REF.NEW_ID   SHDOCO -- Document (Order No Invoice etc.) [Generic Edit] Numeric (8)
,'SO'   SHDCTO -- Order Type [UDC (00 DT)] String (2)
,'000'   SHSFXO -- Order Suffix [Generic Edit] String (3)
,'       20001'   SHMCU -- Business Unit [Generic Edit] String (12)
,'00020'   SHCO -- Company [Generic Edit] String (5)
,''   SHOKCO -- Document Company (Original Order) [Generic Edit] String (5)
,''   SHOORN -- Original Order Number [Generic Edit] String (8)
,''   SHOCTO -- Original Order Type [UDC (00 DT)] String (2)
,''   SHRKCO -- Company - Key (Related Order) [Generic Edit] String (5)
,''   SHRORN -- Related PO/SO/WO Number [Generic Edit] String (8)
,''   SHRCTO -- Related PO/SO/WO Order Type [UDC (00 DT)] String (2)
,ORDER_REF.BILLTO_ID   SHAN8 -- Address Number [Generic Edit] Numeric (8)
,ORDER_REF.SHIPTO_ID   SHSHAN -- Address Number - Ship To [Generic Edit] Numeric (8)
,ADDRESS_BOOK.SZPA8   SHPA8 -- Address Number - Parent [Generic Edit] Numeric (8)
,ISNULL(dbo.JDEJulian(CUSTOMER_ORDER.DESIRED_SHIP_DATE),'')    SHDRQJ -- Date - Requested [Generic Edit] Date (6)
,ISNULL(dbo.JDEJulian(CUSTOMER_ORDER.ORDER_DATE),'')    SHTRDJ -- Date - Order/Transaction [Generic Edit] Date (6)
,ISNULL(dbo.JDEJulian(CUSTOMER_ORDER.PROMISE_DATE),'')   SHPDDJ -- Date - Scheduled Pick [Generic Edit] Date (6)
,ISNULL(dbo.JDEJulian(CUSTOMER_ORDER.DESIRED_SHIP_DATE),'')   SHOPDJ -- Date - Original Promised Delivery [Generic Edit] Date (6)
,ISNULL(dbo.JDEJulian(CUSTOMER_ORDER.PROMISE_DEL_DATE),'')   SHADDJ -- Date - Actual Ship Date [Generic Edit] Date (6)
,''   SHCNDJ -- Date - Cancel [Generic Edit] Date (6)
,ISNULL(dbo.JDEJulian(CUSTOMER_ORDER.ORDER_DATE),'')   SHPEFJ -- Date - Price Effective Date [Generic Edit] Date (6)
,ISNULL(dbo.JDEJulian(CUSTOMER_ORDER.DESIRED_SHIP_DATE),'')   SHPPDJ -- Date - Promised Shipment [Generic Edit] Date (6)
,LEFT(LTRIM(RTRIM(CUSTOMER_ORDER.CUSTOMER_PO_REF)),25)   SHVR01 -- Reference [Generic Edit] String (25)
,''   SHVR02 -- Reference 2 [Generic Edit] String (25)
,''   SHDEL1 -- Delivery Instructions Line 1 [Generic Edit] String (30)
,''   SHDEL2 -- Delivery Instructions Line 2 [Generic Edit] String (30)
,''   SHINMG -- Print Message [UDC (40 PM)] String (10)
,CASE
	WHEN CUSTOMER_ORDER.TERMS_NET_DAYS = 0 THEN 'NI'
	WHEN CUSTOMER_ORDER.TERMS_NET_DAYS = 3 THEN 'N20'
	WHEN CUSTOMER_ORDER.TERMS_NET_DAYS = 20 THEN 'N20'
	WHEN CUSTOMER_ORDER.TERMS_NET_DAYS = 30 THEN 'N3'
	WHEN CUSTOMER_ORDER.TERMS_NET_DAYS = 35 THEN 'N20'
	WHEN CUSTOMER_ORDER.TERMS_NET_DAYS = 45 THEN 'N4'
	WHEN CUSTOMER_ORDER.TERMS_NET_DAYS = 60 THEN 'N6'
	WHEN CUSTOMER_ORDER.TERMS_NET_DAYS = 90 THEN 'N9'
	WHEN CUSTOMER_ORDER.TERMS_NET_DAYS = 301 THEN 'N20'
	ELSE ''
 END      SHPTC -- Payment Terms Code [Generic Edit] String (3)
,'C'   SHRYIN -- Payment Instrument [UDC (00 PY)] Character (1)
,'20'   SHASN -- Price and Adjustment Schedule [UDC (40 AS)] String (8)
,''   SHPRGP -- Pricing Group [UDC (40 PC)] String (8)
,''   SHTRDC -- Discount - Trade [Generic Edit] Numeric (7)
,''   SHPCRT -- Percent - Retainage [Generic Edit] Numeric (7)
,''   SHTXA1 -- Tax Rate/Area [Generic Edit] String (10)
,''   SHEXR1 -- Tax Expl Code 1 [UDC (00 EX)] String (2)
,''   SHTXCT -- Certificate Tax Exemption [Generic Edit] String (20)
,''   SHATXT -- Associated Text [Generic Edit] Character (1)
,'0'   SHPRIO -- Priority - Processing [UDC (H40 PR)] Character (1)
,'Y'   SHBACK -- Backorders Allowed (Y/N) [Generic Edit] Character (1)
,'Y'   SHSBAL -- Substitutes Allowed (Y/N) [Generic Edit] Character (1)
,''   SHHOLD -- Hold Orders Code [UDC (42 HC)] String (2)
,'Y'   SHPLST -- Price Pick List (Y/N) [Generic Edit] Character (1)
,''   SHINVC -- Invoice Copies [Generic Edit] Numeric (2)
,''   SHNTR -- Nature of Transaction [UDC (00 NT)] String (2)
,''   SHANBY -- Buyer Number [Generic Edit] Numeric (8)
,''   SHCARS -- Carrier Number [Generic Edit] Numeric (8)
,''   SHMOT -- Mode of Transport [UDC (00 TM)] String (3)
,''   SHCOT -- Conditions of Transport [UDC (00 TC)] String (3)
,''   SHROUT -- Route Code [UDC (42 RT)] String (3)
,''   SHSTOP -- Stop Code [UDC (42 SP)] String (3)
,''   SHZON -- Zone Number [UDC (40 ZN)] String (3)
,''   SHCNID -- Container I.D. [Generic Edit] String (20)
,''   SHFRTH -- Freight Handling Code [UDC (42 FR)] String (3)
,''   SHAFT -- Apply Freight - Y/N [Generic Edit] Character (1)
,''   SHFUF1 -- AIA Document Flag [UDC (H40 FU)] Character (1)
,''   SHFRTC -- Freight Calculated (Y/N) [Generic Edit] Character (1)
,'Y'   SHMORD -- Merge Orders (Y/N) [Generic Edit] Character (1)
,''   SHRCD -- Reason Code [UDC (42 RC)] String (3)
,'N'   SHFUF2 -- Post Quantities [Generic Edit] Character (1)
,''   SHOTOT -- Amount - Order Gross [Generic Edit] Numeric (15)
,TOTALS.SDECST   SHTOTC -- Amount - Total Cost [Generic Edit] Numeric (15)
,''   SHWUMD -- Unit of Measure - Weight Display [UDC (00 UM)] String (2)
,''   SHVUMD -- Unit of Measure - Volume Display [UDC (00 UM)] String (2)
,''   SHAUTN -- Authorization Number - Credit Approval [Generic Edit] String (10)
,''   SHCACT -- Account Number - Credit/Bank [Generic Edit] String (25)
,''   SHCEXP -- Date - Expired (Julian) [Generic Edit] Date (6)
,''   SHSBLI -- Subledger Inactive Code [UDC (00 SI)] Character (1)
,''   SHCRMD -- Send Method [UDC (00 SM)] Character (1)
,'D'   SHCRRM -- Currency Mode-Foreign or Domestic Entry [UDC (H00 CY)] Character (1)
,'USD'   SHCRCD -- Currency Code - From [Generic Edit] String (3)
,''   SHCRR -- Currency Conversion Rate - Spot Rate [Generic Edit] Numeric (15)
,''   SHLNGP -- Language [UDC (01 LP)] String (2)
,''   SHFAP -- Amount - Foreign Open [Generic Edit] Numeric (15)
,''   SHFCST -- Amount - Foreign Total Cost [Generic Edit] Numeric (15)
,''   SHORBY -- Ordered By [Generic Edit] String (10)
,''   SHTKBY -- Order Taken By [Generic Edit] String (10)
,''   SHURCD -- User Reserved Code [Generic Edit] String (2)
,''   SHURDT -- User Reserved Date [Generic Edit] Date (6)
,''   SHURAT -- User Reserved Amount [Generic Edit] Numeric (15)
,''   SHURAB -- User Reserved Number [Generic Edit] Numeric (8)
,''   SHURRF -- User Reserved Reference [Generic Edit] String (15)
,'TSAMPSON'   SHUSER -- User ID [Generic Edit] String (10)
,'SQL'   SHPID -- Program ID [Generic Edit] String (10)
,''   SHJOBN -- Work Station ID [Generic Edit] String (10)
,dbo.JDEJulian(GETDATE())   SHUPMJ -- Date - Updated [Generic Edit] Date (6)
,''   SHTDAY -- Time of Day [Generic Edit] Numeric (6)
,''   SHIR01 -- Integration Reference 01 [Generic Edit] String (30)
,''   SHIR02 -- Integration Reference 02 [Generic Edit] String (30)
,''   SHIR03 -- Integration Reference 03 [Generic Edit] String (30)
,''   SHIR04 -- Integration Reference 04 [Generic Edit] String (30)
,''   SHIR05 -- Integration Reference 05 [Generic Edit] String (30)
,''   SHVR03 -- Reference [Generic Edit] String (25)
,'0'   SHSOOR -- Source of Order [Generic Edit] Integer (11)
,'0'   SHPMDT -- Scheduled Shipment Time [Generic Edit] Numeric (6)
,'0'   SHRSDT -- Promised Delivery Time [Generic Edit] Numeric (6)
,''   SHRQSJ -- Date - Requested Ship [Generic Edit] Date (6)
,'0'   SHPSTM -- Time - Future Time 2 [Generic Edit] Numeric (6)
,'0'   SHPDTT -- Time - Scheduled Pick [Generic Edit] Numeric (6)
,'0'   SHOPTT -- Time - Original Promised Delivery [Generic Edit] Numeric (6)
,'0'   SHDRQT -- Requested Delivery Time [Generic Edit] Numeric (6)
,'0'   SHADTM -- Actual Shipment Time [Generic Edit] Numeric (6)
,''   SHADLJ -- Date - Actual Delivery [Generic Edit] Date (6)
,''   SHPBAN -- Address Number - Paid By [Generic Edit] Numeric (8)
,''   SHITAN -- Address Number - Invoiced To [Generic Edit] Numeric (8)
,''   SHFTAN -- Address Number - Forwarded To [Generic Edit] Numeric (8)
,''   SHDVAN -- Address Number - Deliver To [Generic Edit] Numeric (8)
,''   SHDOC1 -- Document (Order # Invoice etc.) [Generic Edit] Numeric (8)
,''   SHDCT4 -- Document Type [UDC (00 DT)] String (2)
,'0'   SHCORD -- Change Order Number [Generic Edit] Numeric (3)
,''   SHBSC -- Buying Segment Code [UDC (42B BS)] String (10)
,''   SHBCRC -- Currency Code - Base [Generic Edit] String (3)
,'1'   SHAUFT -- Address Number to use for Tax [UDC (42B UA)] Character (1)
,'1'   SHAUFI -- Address Number to use for Transportation [UDC (42B UA)] Character (1)
,''   SHOPBO -- OP Business Objective [UDC (34A BO)] String (30)
,''   SHOPTC -- OP Total Cost [Generic Edit] Numeric (15)
,''   SHOPLD -- OP Latest Line Date [Generic Edit] Date (6)
,''   SHOPBK -- OP Number of Backorders [Generic Edit] Numeric (15)
,''   SHOPSB -- OP Number of Substitutes [Generic Edit] Numeric (15)
,''   SHOPPS -- OP Promised Status [Generic Edit] String (30)
,'Y'   SHOPPL -- OP Partial Order Shipment [Generic Edit] Character (1)
,'Y'   SHOPMS -- OP Allow Multi Source [Generic Edit] Character (1)
,'Y'   SHOPSS -- OP Allow Substitutes [Generic Edit] Character (1)
,'Y'   SHOPBA -- OP Allow Backorders [Generic Edit] Character (1)
,'Y'   SHOPLL -- OP Partial Ship Line Items [Generic Edit] Character (1)
,'0'   SHPRAN8 -- Partner Address Number [Generic Edit] Numeric (8)
,'0'   SHOPPID -- Opportunity Number [Generic Edit] Numeric (15)
,''   SHSDATTN -- Sold To Attention [Generic Edit] String (50)
,CUSTOMER_ORDER.FREE_ON_BOARD   SHSPATTN -- Ship To Attention [Generic Edit] String (50)
,''   SHOTIND -- Order Type Indicator [Generic Edit] Character (1)
,'0'   SHPRCIDLN -- Partner Contact Line Number ID [Generic Edit] Numeric (5)
,'0'   SHCCIDLN -- Customer Contact Line Number ID [Generic Edit] Numeric (5)
,'0'   SHSHCCIDLN -- Ship To Cust Contact Line Num ID [Generic Edit] Numeric (5)

FROM _ORDER_REF_TABLE ORDER_REF

JOIN _ADDRESS_BOOK ADDRESS_BOOK
    ON ORDER_REF.SHIPTO_ID = ADDRESS_BOOK.SZAN8

JOIN CUSTOMER_ORDER CUSTOMER_ORDER
    ON CUSTOMER_ORDER.ID = ORDER_REF.OLD_ID

JOIN

	(
		SELECT

		ORDER_REF.NEW_ID   SHDOCO -- Document (Order No Invoice etc.) [Generic Edit] Numeric (8)

		,SUM(CASE
			WHEN WORK_ORDER.ACT_MATERIAL_COST = 0
				OR WORK_ORDER.DESIRED_QTY = 0 
			THEN 0
			WHEN _ITEM_MASTER_SIDE.SZSTKT = 'S' THEN CAST((WORK_ORDER.ACT_MATERIAL_COST) * 100 AS BIGINT)
			ELSE CAST(((WORK_ORDER.ACT_MATERIAL_COST) * 1.7) * 100 AS BIGINT)
			END)   SDECST -- Amount - Extended Cost [Generic Edit] Numeric (15)


		FROM   DEMAND_SUPPLY_LINK DEMAND_SUPPLY_LINK

		JOIN WORK_ORDER WORK_ORDER 
			ON DEMAND_SUPPLY_LINK.SUPPLY_BASE_ID = WORK_ORDER.BASE_ID 
			AND DEMAND_SUPPLY_LINK.SUPPLY_LOT_ID = WORK_ORDER.LOT_ID 
			AND DEMAND_SUPPLY_LINK.SUPPLY_SPLIT_ID = WORK_ORDER.SPLIT_ID 
			AND DEMAND_SUPPLY_LINK.SUPPLY_SUB_ID = WORK_ORDER.SUB_ID 

		JOIN _ORDER_REF_TABLE ORDER_REF
			ON DEMAND_SUPPLY_LINK.DEMAND_BASE_ID = ORDER_REF.OLD_ID

		JOIN CUST_ORDER_LINE CUST_ORDER_LINE
			ON ORDER_REF.OLD_ID = CUST_ORDER_LINE.CUST_ORDER_ID
			AND CUST_ORDER_LINE.LINE_NO = DEMAND_SUPPLY_LINK.DEMAND_SEQ_NO

		JOIN _ADDRESS_BOOK_TABLE ADDRESS_BOOK
			ON CAST(ORDER_REF.SHIPTO_ID AS BIGINT) = CAST(ADDRESS_BOOK.SZAN8 AS BIGINT)	

		JOIN CUSTOMER_ORDER CUSTOMER_ORDER
			ON CUSTOMER_ORDER.ID = LTRIM(RTRIM(ORDER_REF.OLD_ID))

		JOIN RECEIVABLE_LINE RECEIVABLE_LINE
			ON RECEIVABLE_LINE.CUST_ORDER_ID = CUST_ORDER_LINE.CUST_ORDER_ID
			AND RECEIVABLE_LINE.CUST_ORDER_LINE_NO = CUST_ORDER_LINE.LINE_NO

		JOIN RECEIVABLE RECEIVABLE
			ON RECEIVABLE.INVOICE_ID = RECEIVABLE_LINE.INVOICE_ID
		    
		LEFT JOIN _ITEM_MASTER_1_TABLE ITEM_MASTER_1
			ON CUST_ORDER_LINE.PART_ID = LTRIM(RTRIM(ITEM_MASTER_1.SZAITM))  

		JOIN _ITEM_MASTER_SIDE _ITEM_MASTER_SIDE
			ON CUST_ORDER_LINE.PART_ID = _ITEM_MASTER_SIDE.SZAITM

		JOIN PART PART
			ON PART.ID = CUST_ORDER_LINE.PART_ID    
		    
		GROUP BY ORDER_REF.NEW_ID
	) TOTALS
ON ORDER_REF.NEW_ID  = TOTALS.SHDOCO