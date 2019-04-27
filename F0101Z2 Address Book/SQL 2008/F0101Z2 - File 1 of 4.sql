/* CSB and CB with 1 CS
	F0101Z2 zFile 1 VER0006
	for Customers with 1 ShipTo and 1 BillTo
	This query uses a reference file created to determine if these are CSB or CB
	20190404 Tom Sampson

	VER0002
	- fixes after discussion with Steve

	VER0003
	- fixed SZALKY

	VER0004
	- fixed consraints on address parts that were failing on load

	VER0005
	-- prepend BC_ to SZALKY

	VER0006
	-- SZAT1 changed CSB to C

	VER0007
	-- replaced null results with ''
	
*/

SELECT
 'JDE'					SZEDUS						
,'BAL0001'				SZEDBT -- this is load ref, can put what we want in here
,72000 + CUSTOMER.ROWID		
						SZEDTN
,0						SZEDLN
,''						SZEDCT
,'JDEAB'				SZTYTN
,''						SZEDFT
,''						SZEDDT
,''						SZDRIN
,''						SZEDDL
,'N'					SZEDSP
,''						SZPNID
,'A'					SZTNAC
,CAST(72000 + CUSTOMER.ROWID AS INTEGER)		
						SZAN8
,'BC_' + LTRIM(RTRIM(CUSTOMER.ID))				
						SZALKY -- old customer ID ref
,''						SZTAX
,LEFT(
	LTRIM(RTRIM(
		REPLACE(
			REPLACE(
				CUSTOMER.NAME
			,'.','')
		,',','')
	))
 ,40)					SZALPH
,''						SZDC
,'          20'			SZMCU -- 10 spaces + 20 needs to be a strng
,''						SZSIC
,''						SZLNGP
,CASE
	WHEN CSB_REF.CSB = '1'
		THEN 'C'
		ELSE 'CB'
 END					SZAT1 -- CASE only for this query, hard-code the rest
,''						SZCM
,'2'					SZTAXC
,'N'					SZAT2
,'N'					SZAT3
,'N'					SZAT4
,'Y'					SZATR
,'N'					SZAT5
,'N'					SZATP
,'N'					SZATPR
,'N'					SZAB3
,'N'					SZATE
,''						SZSBLI
,(DATEPART(year, GETDATE())-1900)*1000 + DATEPART(dayofyear, GETDATE())						SZEFTB -- JDE julian today
,''						SZAN81 -- CB Lookup only where CS
,''						SZAN82
,''						SZAN83
,''						SZAN84
,''						SZAN86
,''						SZAN85
,''						SZAC01
,''						SZAC02
,''						SZAC03
,''						SZAC04
,''						SZAC05
,''						SZAC06
,''						SZAC07
,''						SZAC08
,''						SZAC09
,''						SZAC10
,''						SZAC11
,''						SZAC12
,''						SZAC13
,''						SZAC14
,''						SZAC15
,''						SZAC16
,''						SZAC17
,''						SZAC18
,''						SZAC19
,''						SZAC20
,''						SZAC21
,''						SZAC22
,''						SZAC23
,''						SZAC24
,''						SZAC25
,''						SZAC26
,''						SZAC27
,''						SZAC28
,''						SZAC29
,''						SZAC30
,''						SZGLBA
,0						SZPTI
,'0'					SZPDI
,''						SZMSGA
,''						SZRMK
,''						SZTXCT
,''						SZTX2
,''						SZALP1
,''						SZURCD
,'0'					SZURDT
,0						SZURAT
,0						SZURAB
,''						SZURRF
,''						SZMLNM
,''						SZMLN1
,ISNULL(CASE 
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_1' THEN LEFT(LTRIM(RTRIM(CUSTOMER.ADDR_1)),40)
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_2' THEN LEFT(LTRIM(RTRIM(CUSTOMER.ADDR_2)),40)
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_1' THEN LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)),40)
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_2' THEN LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)),40)
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_1' THEN LEFT(LTRIM(RTRIM(CUSTOMER.ADDR_1)),40)
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_2' THEN LEFT(LTRIM(RTRIM(CUSTOMER.ADDR_2)),40)
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_1' THEN LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)),40)
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_2' THEN LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)),40)
 END,'')				SZADD1
  
,ISNULL(CASE 
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_1'   THEN LEFT(LTRIM(RTRIM(CUSTOMER.ADDR_2)),40)
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_2'   THEN LEFT(LTRIM(RTRIM(CUSTOMER.ADDR_3)),40)
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_1'   THEN LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)),40)
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_2'   THEN LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_3)),40)
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_1'   THEN LEFT(LTRIM(RTRIM(CUSTOMER.ADDR_2)),40)
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_2'   THEN LEFT(LTRIM(RTRIM(CUSTOMER.ADDR_3)),40)
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_1'   THEN LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)),40)
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_2'   THEN LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_3)),40)
	ELSE ''
 END,'')				SZADD2
,''						SZADD3
,''						SZADD4
,ISNULL(CASE 
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_1' THEN CUSTOMER.ZIPCODE
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_2' THEN CUSTOMER.ZIPCODE
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_1' THEN CUST_ADDRESS.ZIPCODE
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_2' THEN CUST_ADDRESS.ZIPCODE
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_1' THEN CUSTOMER.ZIPCODE
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_2' THEN CUSTOMER.ZIPCODE
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_1' THEN CUST_ADDRESS.ZIPCODE
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_2' THEN CUST_ADDRESS.ZIPCODE
 END,'')				SZADDZ
,ISNULL(CASE 
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_1' THEN CUSTOMER.CITY
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_2' THEN CUSTOMER.CITY
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_1' THEN CUST_ADDRESS.CITY
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_2' THEN CUST_ADDRESS.CITY
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_1' THEN CUSTOMER.CITY
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_2' THEN CUSTOMER.CITY
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_1' THEN CUST_ADDRESS.CITY
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_2' THEN CUST_ADDRESS.CITY
 END,'')				SZCTY1
,'US'					SZCTR
,ISNULL(CASE 
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_1' AND LEN(CUSTOMER.STATE) = 2 THEN CUSTOMER.STATE
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_2' AND LEN(CUSTOMER.STATE) = 2 THEN CUSTOMER.STATE
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_1' AND LEN(CUST_ADDRESS.STATE) = 2 THEN CUST_ADDRESS.STATE
	WHEN CSB_REF.CSB = '1' AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_2' AND LEN(CUST_ADDRESS.STATE) = 2 THEN CUST_ADDRESS.STATE
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_1' AND LEN(CUSTOMER.STATE) = 2 THEN CUSTOMER.STATE
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_2' AND LEN(CUSTOMER.STATE) = 2 THEN CUSTOMER.STATE
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_1' AND LEN(CUST_ADDRESS.STATE) = 2 THEN CUST_ADDRESS.STATE
	WHEN CSB_REF.CSB <> '1' AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_2' AND LEN(CUST_ADDRESS.STATE) = 2 THEN CUST_ADDRESS.STATE
	ELSE ''
 END,'')				SZADDS
,''  SZCOUN -- no county in infor
,ISNULL(CASE
	WHEN 
		CONTACT_PHONE IS NOT NULL
		THEN
		LEFT(REPLACE(CONTACT_PHONE,'-',''), 3)
		ELSE ''
 END,'')				SZAR1
,ISNULL(CASE
	WHEN
		CONTACT_PHONE IS NOT NULL
		THEN
	LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CONTACT_PHONE,'+',''),' ',''),'-',''),10),7),3)
	+ '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CONTACT_PHONE,'+',''),' ',''),'-',''),10),7),4)
		ELSE ''
 END,'') 				SZPH1
,''  					SZPHT1
,ISNULL(CASE
	WHEN 
		CONTACT_FAX IS NOT NULL
		THEN
		LEFT(REPLACE(CONTACT_FAX,'-',''), 3)
		ELSE ''
 END,'')				SZAR2
,ISNULL(CASE
	WHEN
		CONTACT_FAX IS NOT NULL
		THEN
	LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CONTACT_FAX,'+',''),' ',''),'-',''),10),7),3)
	+ '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CONTACT_FAX,'+',''),' ',''),'-',''),10),7),4)
		ELSE ''
 END,'') 				SZPH2 -- add dash fix
,'FAX'  				SZPHT2
,''  					SZTORG
,'TSAMPSON'				SZUSER
,'Import'				SZPID
,''						SZJOBN
,(DATEPART(year, GETDATE())-1900)*1000 + DATEPART(dayofyear, GETDATE())	
						SZUPMJ
,''						SZTDAY
,''						SZUPMT
,''						SZPRGF
,''						SZSCCLTP
,''						SZPA8
,''						SZTICKER
,''						SZEXCHG
,''						SZDUNS
,''						SZCLASS01
,''						SZCLASS02
,''						SZCLASS03
,''						SZCLASS04
,''						SZCLASS05
,''						SZNOE
,''						SZGROWTHR
,''						SZYEARSTAR
,''						SZAEMPGP
,''						SZACTIN
,''						SZREVRNG
		
FROM
	(
		SELECT DISTINCT 
				CUSTOMER_ID
				,SHIP_TO_ADDR_NO
		FROM CUSTOMER_ORDER ORDERS
		WHERE YEAR(ORDER_DATE) >= 2015
		AND SHIP_TO_ADDR_NO <= 1
	) CUSLIST

JOIN CUSTOMER CUSTOMER -- Bill To Addresses
	ON CUSLIST.CUSTOMER_ID = CUSTOMER.ID

JOIN CUST_ADDRESS CUST_ADDRESS -- Ship To Address
	ON CUSTOMER.ID = CUST_ADDRESS.CUSTOMER_ID
	AND CUST_ADDRESS.ADDR_NO = 1

JOIN _CSB_REF$ CSB_REF
	ON CUSLIST.CUSTOMER_ID = CSB_REF.CUSTOMER_ID
	