CREATE VIEW _SHIPTO_CM AS
/*
	F03012Z1 Customer Master - File 3 VER0002
	IC 4/16/2019 Tom Sampson

	VER0002
	- Added Ron's updates 4/17/2019
*/


SELECT

 'JDE'   VOEDUS   -- EDI - User ID String Generic Edit 10 (0)
,'BALCM'   VOEDBT   -- EDI - Batch Number String Generic Edit (15)
,_SHIPTO.SZAN8  VOEDTN   -- EDI - Transaction Number String Generic Edit (22)
,0   VOEDLN   -- EDI - Line Number Numeric Generic Edit (7)
,''   VOEDCT   -- EDI - Document Type String Generic Edit (2)
,'JDECM'   VOTYTN   -- Type - Transaction String UDC (00 TT) (8)
,''   VOEDFT   -- EDI - Translation Format String Generic Edit (10)
,''   VOEDDT   -- EDI - Transmission Date Date Generic Edit (6)
,''   VODRIN   -- Direction Indicator Character UDC (00 DN) (1)
,''   VOEDDL   -- EDI - Detail Lines Processed Numeric Generic Edit (5)
,'N'   VOEDSP   -- EDI - Successfully Processed Character Generic Edit (1)
,''   VOPNID   -- Trading Partner ID String Generic Edit (15)
,'A'   VOTNAC   -- Transaction Action String UDC (00 TA) (2)
,_SHIPTO.SZAN8   VOAN8   -- Address Number Numeric UDC (8)
,'00020'   VOCO   -- Company String Generic Edit (5)
,''   VOARC   -- G/L Offset String UDC (55 AR) (4)
,''   VOMCUR   -- Business Unit - A/R Default String Generic Edit (12)
,''   VOOBAR   -- Object - Accounts Receivable Default String Generic Edit (6)
,''   VOAIDR   -- Subsidiary - Accounts Receivable Default String Generic Edit (8)
,''   VOKCOR   -- Document Company (A/R Model Document) String Generic Edit (5)
,''   VODCAR   -- Document - A/R Default for Model JE Numeric Generic Edit (8)
,''   VODTAR   -- Document Type - A/R Default for Model JE String UDC (00 DT) (2)
,'USD'   VOCRCD   -- Currency Code - From String Generic Edit (3)
,''   VOTXA1   -- Tax Rate/Area String Generic Edit (10)
,''   VOEXR1   -- Tax Expl Code 1 String UDC (00 EX) (2)
,''   VOACL   -- Amount - Credit Limit Numeric Generic Edit (15)
,'N'   VOHDAR   -- Hold Invoices Character UDC (H01 HC) (1)
,CASE
	WHEN CUSTOMER.TERMS_NET_DAYS = 0 THEN 'NI'
	WHEN CUSTOMER.TERMS_NET_DAYS = 3 THEN 'N20'
	WHEN CUSTOMER.TERMS_NET_DAYS = 20 THEN 'N20'
	WHEN CUSTOMER.TERMS_NET_DAYS = 30 THEN 'N3'
	WHEN CUSTOMER.TERMS_NET_DAYS = 35 THEN 'N20'
	WHEN CUSTOMER.TERMS_NET_DAYS = 45 THEN 'N4'
	WHEN CUSTOMER.TERMS_NET_DAYS = 60 THEN 'N6'
	WHEN CUSTOMER.TERMS_NET_DAYS = 90 THEN 'N9'
	WHEN CUSTOMER.TERMS_NET_DAYS = 301 THEN 'N20'
	ELSE ''
 END   VOTRAR   -- Payment Terms - A/R String Generic Edit (3)
,'C'   VOSTTO   -- Send Statement to C/P Character UDC (H00 SV) (1)
,'C'   VORYIN   -- Payment Instrument Character UDC (00 PY) (1)
,'Y'   VOSTMT   -- Print Statement Y/N Character UDC (H03 ST) (1)
,''   VOARPY   -- Alternate Payor Numeric Generic Edit (8)
,'Y'   VOATCS   -- Auto Receipt (Y/N) Character Generic Edit (1)
,'C'   VOSITO   -- Send Invoice to C/P Character UDC (H00 SI) (1)
,'6'   VOSQNL   -- Ledger Inquiry Sequence Character UDC (H01 SQ) (1)
,'I'   VOALGM   -- Auto Receipt Algorithm Method String UDC (01 AA) (2)
,''   VOCYCN   -- Statement Cycle String Generic Edit (2)
,''   VOBO   -- Balance Forward-Open Item Character UDC (H03 BO) (1)
,''   VOTSTA   -- Temporary Credit Message String UDC (00 CM) (2)
,''   VOCKHC   -- Credit Check Handling Code Character Generic Edit (1)
,''   VODLC   -- Date - Last Credit Review Date Generic Edit (6)
,'Y'   VODNLT   -- Delinquency Notice (Y/N) Character Generic Edit (1)
,''   VOPLCR   -- Person Completing Last Credit Limit Rev String Generic Edit (10)
,''   VORVDJ   -- Date - Recall for Review Date Generic Edit (6)
,''   VODSO   -- Days Sales Outstanding Numeric Generic Edit (5)
,'BC01'   VOCMGR   -- Credit Manager String UDC (01 CR) (10)
,'BC01'   VOCLMG   -- Collection Manager String Generic Edit (01 CM) (10)
,''   VODLQT   -- Dunning Letters - Number Sent Numeric Generic Edit (3)
,''   VODLQJ   -- Date - Last Dunning Letter Date Generic Edit (6)
,''   VONBRR   -- Reminders - Number of Reminders to Send Character UDC (H00 NB) (1)
,'N'   VOCOLL   -- Collection Report (Y/N) Character UDC (H00 CO) (1)
,''   VONBR1   -- Number of Sent Reminders - 1 Numeric Generic Edit (3)
,''   VONBR2   -- Number of Sent Reminders - 2 Numeric Generic Edit (3)
,''   VONBR3   -- Number of Sent Reminders - 3 Numeric Generic Edit (3)
,''   VONBCL   -- Number of Invoices to Collection Report Numeric Generic Edit (3)
,'N'   VOAFC   -- Apply Finance Charges - Y/N Character UDC (H00 AF) (1)
,''   VOFD   -- Finance Charge Days Numeric Generic Edit (3)
,''   VOFP   -- Percentage Factor Numeric Generic Edit (9)
,'N'   VOCFCE   -- Finance Charge - Create Entries Y/N Character Generic Edit (1)
,''   VOAB2   -- Address Book - Pending Cash Receipts Character Generic Edit (1)
,''   VODT1J   -- Date - Last Statement Date Date Generic Edit (6)
,''   VODFIJ   -- Date - First Invoice Date Generic Edit (6)
,''   VODLIJ   -- Date - Last Invoice (Julian) Date Generic Edit (6)
,''   VOABC1   -- ABC Code Sales Character UDC (H01 A1) (1)
,''   VOABC2   -- ABC Code 2 - Investment - Inventory Character UDC (H01 A2) (1)
,''   VOABC3   -- ABC Code Average Days Character UDC (H01 A3) (1)
,''   VOFNDJ   -- Date - Financial Stmts on Hand Date Generic Edit (6)
,''   VODLP   -- Date - Last Paid Date Generic Edit (6)
,''   VODB   -- Dun & Bradstreet Rating String UDC (01 DB) (3)
,''   VODNBJ   -- Date - Dun & Bradstreet Date Generic Edit (6)
,''   VOTRW   -- TRW Rating String UDC (01 TR) (3)
,''   VOTWDJ   -- TRW Date Date Generic Edit (6)
,''   VOAVD   -- Average Days Late Numeric Generic Edit (3)
,'USD'   VOCRCA   -- Currency Code - A/B Amounts String Generic Edit (3)
,''   VOAD   -- Amount - Due Numeric Generic Edit (15)
,''   VOAFCP   -- Amount - Prior Year Finance Charges Numeric Generic Edit (15)
,''   VOAFCY   -- Amount - YTD Finance Charges Numeric Generic Edit (15)
,SUM(CASE
	WHEN YEAR(RECEIVABLE.INVOICE_DATE) = 2019 THEN RECEIVABLE.TOTAL_AMOUNT
	ELSE 0
 END) VOASTY   -- Amount - Invoiced This Year Numeric Generic Edit (15)
,''   VOSPYE   -- Amount - Invoiced Prior Year Numeric Generic Edit (15)
,''   VOAHB   -- Amount - High Balance Numeric Generic Edit (15)
,''   VOALP   -- Amount - Last Applied Numeric Generic Edit (15)
,''   VOABAM   -- Amount - Address Book Numeric Generic Edit (15)
,''   VOABA1   -- Amount - Address Book Numeric Generic Edit (15)
,''   VOAPRC   -- Amount - Open Order Numeric Generic Edit (15)
,''   VOMAXO   -- Maximum Order Value Numeric Generic Edit (15)
,''   VOMINO   -- Minimum Order Value Numeric Generic Edit (15)
,''   VOOYTD   -- Orders - Year-to-Date Numeric Generic Edit (3)
,''   VOOPY   -- Orders - Prior Year Numeric Generic Edit (3)
,'JDE'   VOPOPN   -- Person Opening Account String Generic Edit (10)
,(DATEPART(year, CUSTOMER.OPEN_DATE)-1900)*1000 + DATEPART(dayofyear, CUSTOMER.OPEN_DATE)   VODAOJ   -- Date - Account Opened Date Generic Edit (6)
,''   VOAN8R   -- Related - Address Number Numeric Generic Edit (8)
,'S'  VOBADT   -- Billing Address Type Character UDC (H42 BA) (1)
,''   VOCPGP   -- Customer Price Group String UDC (40 PC) (8)
,''   VOORTP   -- Order Template String UDC (40 OT) (8)
,''   VOTRDC   -- Discount - Trade Numeric Generic Edit (7)
,''   VOINMG   -- Print Message String UDC (40 PM) (10)
,''   VOEXHD   -- Credit Hold Exempt Character Generic Edit (1)
,''   VOHOLD   -- Hold Orders Code String UDC (42 HC) (2)
,''   VOROUT   -- Route Code String UDC (42 RT) (3)
,''   VOSTOP   -- Stop Code String UDC (42 SP) (3)
,''   VOZON   -- Zone Number String UDC (40 ZN) (3)
,''   VOCARS   -- Carrier Number Numeric Generic Edit (8)
,''   VODEL1   -- Delivery Instructions Line 1 String Generic Edit (30)
,''   VODEL2   -- Delivery Instructions Line 2 String Generic Edit (30)
,''   VOLTDT   -- Transit Days Numeric Generic Edit (5)
,''   VOFRTH   -- Freight Handling Code String UDC (42 FR) (3)
,'Y'   VOAFT   -- Apply Freight - Y/N Character Generic Edit (1)
,'Y'   VOAPTS   -- Partial Line Shipments Allowed (Y/N) Character Generic Edit (1)
,'Y'   VOSBAL   -- Substitutes Allowed (Y/N) Character Generic Edit (1)
,'Y'   VOBACK   -- Backorders Allowed (Y/N) Character Generic Edit (1)
,'N'   VOPORQ   -- Customer PO Required (Y/N) Character Generic Edit (1)
,''   VOPRIO   -- Priority - Processing Character UDC (H40 PR) (1)
,'P'   VOARTO   -- Credit Check Level Character UDC (H42 AR) (1)
,''   VOINVC   -- Invoice Copies Numeric Generic Edit (2)
,'N'   VOICON   -- Invoice Consolidation Character Generic Edit (1)
,''   VOBLFR   -- Billing Frequency Character UDC (H42 BL) (1)
,''   VONIVD   -- Next Invoice Date Date Generic Edit (6)
,''   VOLEDJ   -- Date - License Expiration Date Generic Edit (6)
,'N'   VOPLST   -- Price Pick List (Y/N) Character Generic Edit (1)
,'N'   VOMORD   -- Merge Orders (Y/N) Character Generic Edit (1)
,''   VOCMC1   -- Commission Code 1 Numeric Generic Edit (8)
,''   VOCMR1   -- Rate - Commission 1 Numeric Generic Edit (7)
,''   VOCMC2   -- Commission Code 2 Numeric Generic Edit (8)
,''   VOCMR2   -- Rate - Commission 2 Numeric Generic Edit (7)
,''   VOPALC   -- Pallet Control Character Generic Edit (1)
,''   VOVUMD   -- Unit of Measure - Volume Display String UDC (00 UM) (2)
,''   VOWUMD   -- Unit of Measure - Weight Display String UDC (00 UM) (2)
,'P'   VOEDPM   -- Batch Processing Mode Character UDC (H40 EE) (1)
,''   VOEDII   -- Item Type Identifier Character UDC (40 II) (1)
,''   VOEDCI   -- Customer Type Identifier Character UDC (40 CI) (1)
,''   VOEDQD   -- Quantity Decimals Numeric Generic Edit (1)
,''   VOEDAD   -- Amount Decimals Numeric Generic Edit (1)
,''   VOEDF1   -- Delivery Note Character Generic Edit (1)
,''   VOEDF2   -- Item Restrictions Character UDC (H40 ED) (1)
,'Y'   VOSI01   -- Partial Order Shipments Allowed (Y/N) Character Generic Edit (1)
,'N'   VOSI02   -- COA Print (Y/N) Character Generic Edit (1)
,''   VOSI03   -- Override Territory Id Assignment Character Generic Edit (1)
,''   VOSI04   -- Special Instruction 04 Character Generic Edit (1)
,''   VOSI05   -- Special Instruction 05 Character Generic Edit (1)
,''   VOCP01   -- Sales Price Based On Date Character UDC (40 DB) (1)
,20   VOASN   -- Price and Adjustment Schedule String UDC (40 AS) (8)
,'Y'   VODSPA   -- Print Adjustments on Invoice (Y/N) Character Generic Edit (1)
/*
,CASE WHEN CUSTOMER.CONTACT_EMAIL IS NOT NULL THEN 3
		ELSE NULL
 END   VOCRMD   -- Send Method Character UDC (00 SM) (1)
*/
,''   VOCRMD
,''   VOPLY   -- Policy Number (Internal) Numeric Generic Edit (5)
,''   VOMAN8   -- Deduction Manager Numeric Generic Edit (8)
,'STANDARD'   VOARL   -- Auto Receipts Execution List String Generic Edit (10)
,''   VOAMCR   -- Administration Credit Limit Numeric Generic Edit (15)
,''   VOAC01   -- Category Code - Address Book 01 String UDC (01 01) (3)
,''   VOAC02   -- Category Code - Address Book 02 String UDC (01 02) (3)
,''   VOAC03   -- Category Code - Address Book 03 String UDC (01 03) (3)
,''   VOAC04   -- Category Code - Address Book 04 String UDC (01 04) (3)
,''   VOAC05   -- Category Code - Address Book 05 String UDC (01 05) (3)
,''   VOAC06   -- Category Code - Address Book 06 String UDC (01 06) (3)
,''   VOAC07   -- Category Code - Address Book 07 String UDC (01 07) (3)
,''   VOAC08   -- Category Code - Address Book 08 String UDC (01 08) (3)
,''   VOAC09   -- Address Book 09 - Country Type String UDC (01 09) (3)
,''   VOAC10   -- Address Book 10 - Nature of the Trade String UDC (01 10) (3)
,''   VOAC11   -- Address Book 11 - Discount Group String UDC (01 11) (3)
,''   VOAC12   -- Category Code - Address Book 12 String UDC (01 12) (3)
,''   VOAC13   -- Category Code - Address Book 13 String UDC (01 13) (3)
,''   VOAC14   -- Category Code - Address Book 14 String UDC (01 14) (3)
,''   VOAC15   -- Category Code - Address Book 15 String UDC (01 15) (3)
,''   VOAC16   -- Category Code - Address Book 16 String UDC (01 16) (3)
,''   VOAC17   -- Category Code - Address Book 17 String UDC (01 17) (3)
,''   VOAC18   -- Category Code - Address Book 18 String UDC (01 18) (3)
,''   VOAC19   -- Category Code - Address Book 19 String UDC (01 19) (3)
,''   VOAC20   -- Category Code - Address Book 20 String UDC (01 20) (3)
,''   VOAC21   -- Category Code - Address Book 21 String UDC (01 21) (3)
,''   VOAC22   -- Category Code - Address Book 22 String UDC (01 22) (3)
,''   VOAC23   -- Category Code - Address Book 23 String UDC (01 23) (3)
,''   VOAC24   -- Category Code - Address Book 24 String UDC (01 24) (3)
,''   VOAC25   -- Category Code - Address Book 25 String UDC (01 25) (3)
,''   VOAC26   -- Category Code - Address Book 26 String UDC (01 26) (3)
,''   VOAC27   -- Category Code - Address Book 27 String UDC (01 27) (3)
,''   VOAC28   -- Category Code - Address Book 28 String UDC (01 28) (3)
,''   VOAC29   -- Category Code - Address Book 29 String UDC (01 29) (3)
,''   VOAC30   -- Category Code - Address Book 30 String UDC (01 30) (3)
,''   VOSLPG   -- Program Name - Shipping Labels String Generic Edit (10)
,''   VOSLDW   -- Version Name - Shipping Label Program String Generic Edit (10)
,''   VOCFPP   -- Configuration Pick and Pack String Generic Edit (18)
,''   VOCFSP   -- Configuration Standard Carton Pack String Generic Edit (18)
,''   VOCFDF   -- Default Configuration Character Generic Edit (1)
,''   VORQ01   -- Requires Packaging Code Character Generic Edit (1)
,''   VORQ02   -- Requires Weight Code Character Generic Edit (1)
,''   VORQ03   -- Requires Identification - Code 1 Character Generic Edit (1)
,''   VORQ04   -- Requires Identification - Code 2 Character Generic Edit (1)
,''   VORQ05   -- Requires Transportation Method Character Generic Edit (1)
,''   VORQ06   -- Requires Routing Character Generic Edit (1)
,''   VORQ07   -- Requires Equipment Character Generic Edit (1)
,''   VORQ08   -- Requires Reference Number 1 Character Generic Edit (1)
,''   VORQ09   -- Requires Reference Number 2 Character Generic Edit (1)
,''   VODR03   -- Default Identification Code Qualifier 1 String UDC (41 X3) (2)
,''   VODR04   -- Default Identification Code Qualifier 2 String UDC (41 X3) (2)
,''   VODR08   -- Default Reference Number Qualifier 1 String UDC (41 X6) (2)
,''   VODR09   -- Default Identification Code Qualifier String UDC (41 X6) (2)
,''   VOURDT   -- User Reserved Date Date Generic Edit (6)
,''   VOURCD   -- User Reserved Code String Generic Edit (2)
,''   VOURAT   -- User Reserved Amount Numeric Generic Edit (15)
,''   VOURAB   -- User Reserved Number Numeric Generic Edit (8)
,''   VOURRF   -- User Reserved Reference String Generic Edit (15)
,''   VOTORG   -- Transaction Originator String Generic Edit (10)
,'JDE'   VOUSER   -- User ID String Generic Edit (10)
,'Import'   VOPID   -- Program ID String Generic Edit (10)
,'Import'   VOJOBN   -- Work Station ID String Generic Edit (10)
,''   VOUPMT   -- Time - Last Updated Numeric Generic Edit (6)
,''   VOUPMJ   -- Date - Updated Date Generic Edit (6)
,''   VOTDAY   -- Time of Day Numeric Generic Edit (6)
,''   VOPRGF   -- Purge Flag Character Generic Edit (1)
,'N'   VOBYAL   -- Bypass Audit Logging Character Generic Edit (1)
,''   VOBSC   -- Buying Segment Code String UDC (42B BS) (10)
,'N'   VOASHL   -- Allow Shipping of Held Lots Character Generic Edit (1)
,''   VOPRSN   -- Preference Schedule String Generic Edit (8)
,''   VOOPBO   -- OP Business Objective String UDC (34A BO) (30)
,''   VOAPSB   -- APS Business Unit Character Generic Edit (1)
,''   VOTIER1   -- Tier String UDC (01 TI) (5)
,''   VOPWPCP   -- Pay When Paid Cash Receipt Threshold Numeric Generic Edit (5)
,''   VOCUSTS   -- Customer Status Character UDC (01 TY) (1)
,''   VOSTOF   -- Override Sales Team Assignment Character Generic Edit (1)
,''   VOTERRID   -- Territory Id Numeric Generic Edit (15)
,''   VOCIG   -- Industry Group Numeric Generic Edit (15)
,''	  VODTEE   -- Date - Entered JDE UTime Generic Edit (11)
,''   VOGOPASF   -- GOP Arrival or Ship Flag Character UDC (34A AS) (1)

FROM CUST_ADDRESS CUST_ADDRESS

JOIN CUSTOMER CUSTOMER -- Bill To Addresses
	ON CUSTOMER.ID = CUST_ADDRESS.CUSTOMER_ID
	AND CUST_ADDRESS.ADDR_NO = 1

JOIN _CSB_REF$ CSB_REF
	ON CUST_ADDRESS.CUSTOMER_ID = CSB_REF.CUSTOMER_ID
	
JOIN _SHIPTO
	ON 'BC_' + LTRIM(RTRIM(CUSTOMER.ID)) + '_' + LTRIM(RTRIM(CAST(CUST_ADDRESS.ADDR_NO AS CHAR))) = _SHIPTO.SZALKY

LEFT JOIN
	(
		SELECT DISTINCT A.CUSTOMER_ID
		FROM CUST_ADDRESS A
		WHERE A.ADDR_NO = 1
	) CB_LIST
	ON CUST_ADDRESS.CUSTOMER_ID = CB_LIST.CUSTOMER_ID

LEFT JOIN RECEIVABLE RECEIVABLE
	ON CUSTOMER.ID = RECEIVABLE.CUSTOMER_ID

WHERE CB_LIST.CUSTOMER_ID IS NOT NULL
	
GROUP BY

	 CUSTOMER.ROWID
	,_SHIPTO.SZAN8
	,CUSTOMER.TERMS_NET_DAYS
	,(DATEPART(year, CUSTOMER.OPEN_DATE)-1900)*1000 + DATEPART(dayofyear, CUSTOMER.OPEN_DATE)  
	,CUSTOMER.CONTACT_EMAIL
	
UNION

/*
	F03012Z1 Customer Master - File 4 VER0002
	IC 4/16/2019 Tom Sampson

	VER0002
	- Added Ron's updates 4/17/2019
*/

SELECT

 'JDE'   VOEDUS   -- EDI - User ID String Generic Edit 10 (0)
,'BALCM'   VOEDBT   -- EDI - Batch Number String Generic Edit (15)
,_SHIPTO.SZAN8    VOEDTN   -- EDI - Transaction Number String Generic Edit (22)
,0   VOEDLN   -- EDI - Line Number Numeric Generic Edit (7)
,''   VOEDCT   -- EDI - Document Type String Generic Edit (2)
,'JDECM'   VOTYTN   -- Type - Transaction String UDC (00 TT) (8)
,''   VOEDFT   -- EDI - Translation Format String Generic Edit (10)
,''   VOEDDT   -- EDI - Transmission Date Date Generic Edit (6)
,''   VODRIN   -- Direction Indicator Character UDC (00 DN) (1)
,''   VOEDDL   -- EDI - Detail Lines Processed Numeric Generic Edit (5)
,'N'   VOEDSP   -- EDI - Successfully Processed Character Generic Edit (1)
,''   VOPNID   -- Trading Partner ID String Generic Edit (15)
,'A'   VOTNAC   -- Transaction Action String UDC (00 TA) (2)
,_SHIPTO.SZAN8     VOAN8   -- Address Number Numeric UDC (8)
,'00020'   VOCO   -- Company String Generic Edit (5)
,''   VOARC   -- G/L Offset String UDC (55 AR) (4)
,''   VOMCUR   -- Business Unit - A/R Default String Generic Edit (12)
,''   VOOBAR   -- Object - Accounts Receivable Default String Generic Edit (6)
,''   VOAIDR   -- Subsidiary - Accounts Receivable Default String Generic Edit (8)
,''   VOKCOR   -- Document Company (A/R Model Document) String Generic Edit (5)
,''   VODCAR   -- Document - A/R Default for Model JE Numeric Generic Edit (8)
,''   VODTAR   -- Document Type - A/R Default for Model JE String UDC (00 DT) (2)
,'USD'   VOCRCD   -- Currency Code - From String Generic Edit (3)
,''   VOTXA1   -- Tax Rate/Area String Generic Edit (10)
,''   VOEXR1   -- Tax Expl Code 1 String UDC (00 EX) (2)
,''   VOACL   -- Amount - Credit Limit Numeric Generic Edit (15)
,'N'   VOHDAR   -- Hold Invoices Character UDC (H01 HC) (1)
,CASE
	WHEN CUSTOMER.TERMS_NET_DAYS = 0 THEN 'NI'
	WHEN CUSTOMER.TERMS_NET_DAYS = 3 THEN 'N20'
	WHEN CUSTOMER.TERMS_NET_DAYS = 20 THEN 'N20'
	WHEN CUSTOMER.TERMS_NET_DAYS = 30 THEN 'N3'
	WHEN CUSTOMER.TERMS_NET_DAYS = 35 THEN 'N20'
	WHEN CUSTOMER.TERMS_NET_DAYS = 45 THEN 'N4'
	WHEN CUSTOMER.TERMS_NET_DAYS = 60 THEN 'N6'
	WHEN CUSTOMER.TERMS_NET_DAYS = 90 THEN 'N9'
	WHEN CUSTOMER.TERMS_NET_DAYS = 301 THEN 'N20'
	ELSE ''
 END   VOTRAR   -- Payment Terms - A/R String Generic Edit (3)
,'C'   VOSTTO   -- Send Statement to C/P Character UDC (H00 SV) (1)
,'C'   VORYIN   -- Payment Instrument Character UDC (00 PY) (1)
,'Y'   VOSTMT   -- Print Statement Y/N Character UDC (H03 ST) (1)
,''   VOARPY   -- Alternate Payor Numeric Generic Edit (8)
,'Y'   VOATCS   -- Auto Receipt (Y/N) Character Generic Edit (1)
,'C'   VOSITO   -- Send Invoice to C/P Character UDC (H00 SI) (1)
,'6'   VOSQNL   -- Ledger Inquiry Sequence Character UDC (H01 SQ) (1)
,'I'   VOALGM   -- Auto Receipt Algorithm Method String UDC (01 AA) (2)
,''   VOCYCN   -- Statement Cycle String Generic Edit (2)
,''   VOBO   -- Balance Forward-Open Item Character UDC (H03 BO) (1)
,''   VOTSTA   -- Temporary Credit Message String UDC (00 CM) (2)
,''   VOCKHC   -- Credit Check Handling Code Character Generic Edit (1)
,''   VODLC   -- Date - Last Credit Review Date Generic Edit (6)
,'Y'   VODNLT   -- Delinquency Notice (Y/N) Character Generic Edit (1)
,''   VOPLCR   -- Person Completing Last Credit Limit Rev String Generic Edit (10)
,''   VORVDJ   -- Date - Recall for Review Date Generic Edit (6)
,''   VODSO   -- Days Sales Outstanding Numeric Generic Edit (5)
,'BC01'   VOCMGR   -- Credit Manager String UDC (01 CR) (10)
,'BC01'   VOCLMG   -- Collection Manager String Generic Edit (01 CM) (10)
,''   VODLQT   -- Dunning Letters - Number Sent Numeric Generic Edit (3)
,''   VODLQJ   -- Date - Last Dunning Letter Date Generic Edit (6)
,''   VONBRR   -- Reminders - Number of Reminders to Send Character UDC (H00 NB) (1)
,'N'   VOCOLL   -- Collection Report (Y/N) Character UDC (H00 CO) (1)
,''   VONBR1   -- Number of Sent Reminders - 1 Numeric Generic Edit (3)
,''   VONBR2   -- Number of Sent Reminders - 2 Numeric Generic Edit (3)
,''   VONBR3   -- Number of Sent Reminders - 3 Numeric Generic Edit (3)
,''   VONBCL   -- Number of Invoices to Collection Report Numeric Generic Edit (3)
,'N'   VOAFC   -- Apply Finance Charges - Y/N Character UDC (H00 AF) (1)
,''   VOFD   -- Finance Charge Days Numeric Generic Edit (3)
,''   VOFP   -- Percentage Factor Numeric Generic Edit (9)
,'N'   VOCFCE   -- Finance Charge - Create Entries Y/N Character Generic Edit (1)
,''   VOAB2   -- Address Book - Pending Cash Receipts Character Generic Edit (1)
,''   VODT1J   -- Date - Last Statement Date Date Generic Edit (6)
,''   VODFIJ   -- Date - First Invoice Date Generic Edit (6)
,''   VODLIJ   -- Date - Last Invoice (Julian) Date Generic Edit (6)
,''   VOABC1   -- ABC Code Sales Character UDC (H01 A1) (1)
,''   VOABC2   -- ABC Code 2 - Investment - Inventory Character UDC (H01 A2) (1)
,''   VOABC3   -- ABC Code Average Days Character UDC (H01 A3) (1)
,''   VOFNDJ   -- Date - Financial Stmts on Hand Date Generic Edit (6)
,''   VODLP   -- Date - Last Paid Date Generic Edit (6)
,''   VODB   -- Dun & Bradstreet Rating String UDC (01 DB) (3)
,''   VODNBJ   -- Date - Dun & Bradstreet Date Generic Edit (6)
,''   VOTRW   -- TRW Rating String UDC (01 TR) (3)
,''   VOTWDJ   -- TRW Date Date Generic Edit (6)
,''   VOAVD   -- Average Days Late Numeric Generic Edit (3)
,'USD'   VOCRCA   -- Currency Code - A/B Amounts String Generic Edit (3)
,''   VOAD   -- Amount - Due Numeric Generic Edit (15)
,''   VOAFCP   -- Amount - Prior Year Finance Charges Numeric Generic Edit (15)
,''   VOAFCY   -- Amount - YTD Finance Charges Numeric Generic Edit (15)
,SUM(CASE
	WHEN YEAR(RECEIVABLE.INVOICE_DATE) = 2019 THEN RECEIVABLE.TOTAL_AMOUNT
	ELSE 0
 END) VOASTY   -- Amount - Invoiced This Year Numeric Generic Edit (15)
,''   VOSPYE   -- Amount - Invoiced Prior Year Numeric Generic Edit (15)
,''   VOAHB   -- Amount - High Balance Numeric Generic Edit (15)
,''   VOALP   -- Amount - Last Applied Numeric Generic Edit (15)
,''   VOABAM   -- Amount - Address Book Numeric Generic Edit (15)
,''   VOABA1   -- Amount - Address Book Numeric Generic Edit (15)
,''   VOAPRC   -- Amount - Open Order Numeric Generic Edit (15)
,''   VOMAXO   -- Maximum Order Value Numeric Generic Edit (15)
,''   VOMINO   -- Minimum Order Value Numeric Generic Edit (15)
,''   VOOYTD   -- Orders - Year-to-Date Numeric Generic Edit (3)
,''   VOOPY   -- Orders - Prior Year Numeric Generic Edit (3)
,'JDE'   VOPOPN   -- Person Opening Account String Generic Edit (10)
,(DATEPART(year, CUSTOMER.OPEN_DATE)-1900)*1000 + DATEPART(dayofyear, CUSTOMER.OPEN_DATE)   VODAOJ   -- Date - Account Opened Date Generic Edit (6)
,''   VOAN8R   -- Related - Address Number Numeric Generic Edit (8)
,'S'  VOBADT   -- Billing Address Type Character UDC (H42 BA) (1)
,''   VOCPGP   -- Customer Price Group String UDC (40 PC) (8)
,''   VOORTP   -- Order Template String UDC (40 OT) (8)
,''   VOTRDC   -- Discount - Trade Numeric Generic Edit (7)
,''   VOINMG   -- Print Message String UDC (40 PM) (10)
,''   VOEXHD   -- Credit Hold Exempt Character Generic Edit (1)
,''   VOHOLD   -- Hold Orders Code String UDC (42 HC) (2)
,''   VOROUT   -- Route Code String UDC (42 RT) (3)
,''   VOSTOP   -- Stop Code String UDC (42 SP) (3)
,''   VOZON   -- Zone Number String UDC (40 ZN) (3)
,''   VOCARS   -- Carrier Number Numeric Generic Edit (8)
,''   VODEL1   -- Delivery Instructions Line 1 String Generic Edit (30)
,''   VODEL2   -- Delivery Instructions Line 2 String Generic Edit (30)
,''   VOLTDT   -- Transit Days Numeric Generic Edit (5)
,''   VOFRTH   -- Freight Handling Code String UDC (42 FR) (3)
,'Y'   VOAFT   -- Apply Freight - Y/N Character Generic Edit (1)
,'Y'   VOAPTS   -- Partial Line Shipments Allowed (Y/N) Character Generic Edit (1)
,'Y'   VOSBAL   -- Substitutes Allowed (Y/N) Character Generic Edit (1)
,'Y'   VOBACK   -- Backorders Allowed (Y/N) Character Generic Edit (1)
,'N'   VOPORQ   -- Customer PO Required (Y/N) Character Generic Edit (1)
,''   VOPRIO   -- Priority - Processing Character UDC (H40 PR) (1)
,'P'   VOARTO   -- Credit Check Level Character UDC (H42 AR) (1)
,''   VOINVC   -- Invoice Copies Numeric Generic Edit (2)
,'N'   VOICON   -- Invoice Consolidation Character Generic Edit (1)
,''   VOBLFR   -- Billing Frequency Character UDC (H42 BL) (1)
,''   VONIVD   -- Next Invoice Date Date Generic Edit (6)
,''   VOLEDJ   -- Date - License Expiration Date Generic Edit (6)
,'N'   VOPLST   -- Price Pick List (Y/N) Character Generic Edit (1)
,'N'   VOMORD   -- Merge Orders (Y/N) Character Generic Edit (1)
,''   VOCMC1   -- Commission Code 1 Numeric Generic Edit (8)
,''   VOCMR1   -- Rate - Commission 1 Numeric Generic Edit (7)
,''   VOCMC2   -- Commission Code 2 Numeric Generic Edit (8)
,''   VOCMR2   -- Rate - Commission 2 Numeric Generic Edit (7)
,''   VOPALC   -- Pallet Control Character Generic Edit (1)
,''   VOVUMD   -- Unit of Measure - Volume Display String UDC (00 UM) (2)
,''   VOWUMD   -- Unit of Measure - Weight Display String UDC (00 UM) (2)
,'P'   VOEDPM   -- Batch Processing Mode Character UDC (H40 EE) (1)
,''   VOEDII   -- Item Type Identifier Character UDC (40 II) (1)
,''   VOEDCI   -- Customer Type Identifier Character UDC (40 CI) (1)
,''   VOEDQD   -- Quantity Decimals Numeric Generic Edit (1)
,''   VOEDAD   -- Amount Decimals Numeric Generic Edit (1)
,''   VOEDF1   -- Delivery Note Character Generic Edit (1)
,''   VOEDF2   -- Item Restrictions Character UDC (H40 ED) (1)
,'Y'   VOSI01   -- Partial Order Shipments Allowed (Y/N) Character Generic Edit (1)
,'N'   VOSI02   -- COA Print (Y/N) Character Generic Edit (1)
,''   VOSI03   -- Override Territory Id Assignment Character Generic Edit (1)
,''   VOSI04   -- Special Instruction 04 Character Generic Edit (1)
,''   VOSI05   -- Special Instruction 05 Character Generic Edit (1)
,''   VOCP01   -- Sales Price Based On Date Character UDC (40 DB) (1)
,20   VOASN   -- Price and Adjustment Schedule String UDC (40 AS) (8)
,'Y'   VODSPA   -- Print Adjustments on Invoice (Y/N) Character Generic Edit (1)
/*
,CASE WHEN CUSTOMER.CONTACT_EMAIL IS NOT NULL THEN 3
		ELSE NULL
 END   VOCRMD   -- Send Method Character UDC (00 SM) (1)
*/
,''   VOCRMD
,''   VOPLY   -- Policy Number (Internal) Numeric Generic Edit (5)
,''   VOMAN8   -- Deduction Manager Numeric Generic Edit (8)
,'STANDARD'   VOARL   -- Auto Receipts Execution List String Generic Edit (10)
,''   VOAMCR   -- Administration Credit Limit Numeric Generic Edit (15)
,''   VOAC01   -- Category Code - Address Book 01 String UDC (01 01) (3)
,''   VOAC02   -- Category Code - Address Book 02 String UDC (01 02) (3)
,''   VOAC03   -- Category Code - Address Book 03 String UDC (01 03) (3)
,''   VOAC04   -- Category Code - Address Book 04 String UDC (01 04) (3)
,''   VOAC05   -- Category Code - Address Book 05 String UDC (01 05) (3)
,''   VOAC06   -- Category Code - Address Book 06 String UDC (01 06) (3)
,''   VOAC07   -- Category Code - Address Book 07 String UDC (01 07) (3)
,''   VOAC08   -- Category Code - Address Book 08 String UDC (01 08) (3)
,''   VOAC09   -- Address Book 09 - Country Type String UDC (01 09) (3)
,''   VOAC10   -- Address Book 10 - Nature of the Trade String UDC (01 10) (3)
,''   VOAC11   -- Address Book 11 - Discount Group String UDC (01 11) (3)
,''   VOAC12   -- Category Code - Address Book 12 String UDC (01 12) (3)
,''   VOAC13   -- Category Code - Address Book 13 String UDC (01 13) (3)
,''   VOAC14   -- Category Code - Address Book 14 String UDC (01 14) (3)
,''   VOAC15   -- Category Code - Address Book 15 String UDC (01 15) (3)
,''   VOAC16   -- Category Code - Address Book 16 String UDC (01 16) (3)
,''   VOAC17   -- Category Code - Address Book 17 String UDC (01 17) (3)
,''   VOAC18   -- Category Code - Address Book 18 String UDC (01 18) (3)
,''   VOAC19   -- Category Code - Address Book 19 String UDC (01 19) (3)
,''   VOAC20   -- Category Code - Address Book 20 String UDC (01 20) (3)
,''   VOAC21   -- Category Code - Address Book 21 String UDC (01 21) (3)
,''   VOAC22   -- Category Code - Address Book 22 String UDC (01 22) (3)
,''   VOAC23   -- Category Code - Address Book 23 String UDC (01 23) (3)
,''   VOAC24   -- Category Code - Address Book 24 String UDC (01 24) (3)
,''   VOAC25   -- Category Code - Address Book 25 String UDC (01 25) (3)
,''   VOAC26   -- Category Code - Address Book 26 String UDC (01 26) (3)
,''   VOAC27   -- Category Code - Address Book 27 String UDC (01 27) (3)
,''   VOAC28   -- Category Code - Address Book 28 String UDC (01 28) (3)
,''   VOAC29   -- Category Code - Address Book 29 String UDC (01 29) (3)
,''   VOAC30   -- Category Code - Address Book 30 String UDC (01 30) (3)
,''   VOSLPG   -- Program Name - Shipping Labels String Generic Edit (10)
,''   VOSLDW   -- Version Name - Shipping Label Program String Generic Edit (10)
,''   VOCFPP   -- Configuration Pick and Pack String Generic Edit (18)
,''   VOCFSP   -- Configuration Standard Carton Pack String Generic Edit (18)
,''   VOCFDF   -- Default Configuration Character Generic Edit (1)
,''   VORQ01   -- Requires Packaging Code Character Generic Edit (1)
,''   VORQ02   -- Requires Weight Code Character Generic Edit (1)
,''   VORQ03   -- Requires Identification - Code 1 Character Generic Edit (1)
,''   VORQ04   -- Requires Identification - Code 2 Character Generic Edit (1)
,''   VORQ05   -- Requires Transportation Method Character Generic Edit (1)
,''   VORQ06   -- Requires Routing Character Generic Edit (1)
,''   VORQ07   -- Requires Equipment Character Generic Edit (1)
,''   VORQ08   -- Requires Reference Number 1 Character Generic Edit (1)
,''   VORQ09   -- Requires Reference Number 2 Character Generic Edit (1)
,''   VODR03   -- Default Identification Code Qualifier 1 String UDC (41 X3) (2)
,''   VODR04   -- Default Identification Code Qualifier 2 String UDC (41 X3) (2)
,''   VODR08   -- Default Reference Number Qualifier 1 String UDC (41 X6) (2)
,''   VODR09   -- Default Identification Code Qualifier String UDC (41 X6) (2)
,''   VOURDT   -- User Reserved Date Date Generic Edit (6)
,''   VOURCD   -- User Reserved Code String Generic Edit (2)
,''   VOURAT   -- User Reserved Amount Numeric Generic Edit (15)
,''   VOURAB   -- User Reserved Number Numeric Generic Edit (8)
,''   VOURRF   -- User Reserved Reference String Generic Edit (15)
,''   VOTORG   -- Transaction Originator String Generic Edit (10)
,'JDE'   VOUSER   -- User ID String Generic Edit (10)
,'Import'   VOPID   -- Program ID String Generic Edit (10)
,'Import'   VOJOBN   -- Work Station ID String Generic Edit (10)
,''   VOUPMT   -- Time - Last Updated Numeric Generic Edit (6)
,''   VOUPMJ   -- Date - Updated Date Generic Edit (6)
,''   VOTDAY   -- Time of Day Numeric Generic Edit (6)
,''   VOPRGF   -- Purge Flag Character Generic Edit (1)
,'N'   VOBYAL   -- Bypass Audit Logging Character Generic Edit (1)
,''   VOBSC   -- Buying Segment Code String UDC (42B BS) (10)
,'N'   VOASHL   -- Allow Shipping of Held Lots Character Generic Edit (1)
,''   VOPRSN   -- Preference Schedule String Generic Edit (8)
,''   VOOPBO   -- OP Business Objective String UDC (34A BO) (30)
,''   VOAPSB   -- APS Business Unit Character Generic Edit (1)
,''   VOTIER1   -- Tier String UDC (01 TI) (5)
,''   VOPWPCP   -- Pay When Paid Cash Receipt Threshold Numeric Generic Edit (5)
,''   VOCUSTS   -- Customer Status Character UDC (01 TY) (1)
,''   VOSTOF   -- Override Sales Team Assignment Character Generic Edit (1)
,''   VOTERRID   -- Territory Id Numeric Generic Edit (15)
,''   VOCIG   -- Industry Group Numeric Generic Edit (15)
,''	  VODTEE   -- Date - Entered JDE UTime Generic Edit (11)
,''   VOGOPASF   -- GOP Arrival or Ship Flag Character UDC (34A AS) (1)

FROM CUST_ADDRESS CUST_ADDRESS

JOIN CUSTOMER_ORDER ORDERS
	ON CUST_ADDRESS.CUSTOMER_ID = ORDERS.CUSTOMER_ID
	AND CUST_ADDRESS.ADDR_NO = ORDERS.SHIP_TO_ADDR_NO
	AND ORDERS.SHIP_TO_ADDR_NO > 1

LEFT JOIN CUSTOMER CUSTOMER ON
	CUST_ADDRESS.CUSTOMER_ID = CUSTOMER.ID
	
LEFT JOIN RECEIVABLE RECEIVABLE
	ON CUSTOMER.ID = RECEIVABLE.CUSTOMER_ID	
 
JOIN _SHIPTO
	ON 'BC_' + LTRIM(RTRIM(CUSTOMER.ID)) + '_' + LTRIM(RTRIM(CAST(CUST_ADDRESS.ADDR_NO AS CHAR))) = _SHIPTO.SZALKY 
 
WHERE YEAR(ORDERS.ORDER_DATE) >= 2015


GROUP BY

	 CUSTOMER.ROWID
	,_SHIPTO.SZAN8  
	,CUSTOMER.TERMS_NET_DAYS
	,(DATEPART(year, CUSTOMER.OPEN_DATE)-1900)*1000 + DATEPART(dayofyear, CUSTOMER.OPEN_DATE)  
	,CUSTOMER.CONTACT_EMAIL	