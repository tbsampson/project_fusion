USE Balco;
/* CS where more than 1 CS
	F0101Z2 zFile 4 VER0009
	CS Customers with >1 ShipTo 

	20190404 Tom Sampson
	VER0002
	- changes after first review
	VER0003
	- lots of error handling and rules for ugly addresses
	VER0004
	-- removed any single shipTo CB from this list
	VER0005
	-- fixed the real problem, '0' where 0
	-- added business unit
	-- replaced - with _
	VER0006
	-- fixed phone number (again)
	VER0007
	-- prepend BC_ to SZALKY
	VER0008
	-- SZURRF -- for CS only, old CUST_ADDRESS.SHIPTO_ID
	VER0009
	-- trim and scale SZURRF to 15 chars
*/



SELECT DISTINCT
 'JDE'						SZEDUS						
,'BAL0004'					SZEDBT
,CAST(105000 + CUST_ADDRESS.ROWID AS INT)		SZEDTN -- primary key edi
,0							SZEDLN
,'' 						SZEDCT
,'JDEAB'					SZTYTN
,'' 						SZEDFT
,'' 						SZEDDT
,'' 						SZDRIN
,'' 						SZEDDL
,'N'						SZEDSP
,'' 						SZPNID
,'A'						SZTNAC
,CAST(105000 + CUST_ADDRESS.ROWID AS INT)		SZAN8 -- primary key
,'BC_' + TRIM(TRIM(CUST_ADDRESS.CUSTOMER_ID) + '_' + CAST(CUST_ADDRESS.ADDR_NO AS CHAR))			SZALKY
,'' 				SZTAX
,LEFT(
	TRIM(
		REPLACE(
			REPLACE(
				CUST_ADDRESS.NAME
			,'.','')
		,',','')
	)
 ,40)						SZALPH
,''							SZDC
,'          20'			SZMCU
,'' 						SZSIC
,'' 						SZLNGP
,'CS'						SZAT1
,'' 						SZCM
,'2'						SZTAXC
,'N'						SZAT2
,'N'						SZAT3
,'N'						SZAT4
,'Y'						SZATR
,'N'						SZAT5
,'N'						SZATP
,'N'						SZATPR
,'N'						SZAB3
,'N'						SZATE
,'' 						SZSBLI
,(DATEPART(year, GETDATE())-1900)*1000 + DATEPART(dayofyear, GETDATE())	SZEFTB -- JDE julian today
-- ,CUST_ADDRESS.CUSTOMER_ID + '_' + CAST(CUST_ADDRESS.ADDR_NO AS CHAR)				SZAN81
,CAST(72000 + CUSTOMER.ROWID AS INTEGER)	SZAN81
,'' 						SZAN82
,'' 						SZAN83
,'' 						SZAN84
,'' 						SZAN86
,'' 						SZAN85
,'' 						SZAC01
,'' 						SZAC02
,'' 						SZAC03
,'' 						SZAC04
,'' 						SZAC05
,'' 						SZAC06
,'' 						SZAC07
,'' 						SZAC08
,'' 						SZAC09
,'' 						SZAC10
,'' 						SZAC11
,'' 						SZAC12
,'' 						SZAC13
,'' 						SZAC14
,'' 						SZAC15
,'' 						SZAC16
,'' 						SZAC17
,'' 						SZAC18
,'' 						SZAC19
,'' 						SZAC20
,'' 						SZAC21
,'' 						SZAC22
,'' 						SZAC23
,'' 						SZAC24
,'' 						SZAC25
,'' 						SZAC26
,'' 						SZAC27
,'' 						SZAC28
,'' 						SZAC29
,'' 						SZAC30
,'' 						SZGLBA
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
,LEFT(TRIM(CUST_ADDRESS.SHIPTO_ID),15) 						SZURRF -- for CS only, old CUST_ADDRESS.SHIPTO_ID
,'' 						SZMLNM
,'' 						SZMLN1
,CASE 
	WHEN CUST_ADDRESS.ADDR_1 IS NOT NULL -- Only use old ADDR_1 if it looks like a street address
	AND LEFT(TRIM(CUST_ADDRESS.ADDR_1),1) <= '9' 
	AND LEFT(TRIM(CUST_ADDRESS.ADDR_1),1) <> '%'
	AND LEFT(TRIM(CUST_ADDRESS.ADDR_1),1) <> '#'
	AND LEFT(TRIM(CUST_ADDRESS.ADDR_1),1) <> '('
	AND TRIM(CUST_ADDRESS.ADDR_1) <> ''
	THEN TRIM(LEFT(ISNULL(TRIM(CUST_ADDRESS.ADDR_1),''),40))
	 
	WHEN  CUST_ADDRESS.ADDR_2 IS NOT NULL -- Otherwise old ADDR_2 may work
	AND LEFT(TRIM(CUST_ADDRESS.ADDR_2),1) <= '9' 
	AND LEFT(TRIM(CUST_ADDRESS.ADDR_2),1) <> '%'
	AND LEFT(TRIM(CUST_ADDRESS.ADDR_2),1) <> '#'
	AND LEFT(TRIM(CUST_ADDRESS.ADDR_2),1) <> '('
	AND CUST_ADDRESS.ADDR_2 NOT LIKE '%@%'
	THEN TRIM(LEFT(ISNULL(TRIM(CUST_ADDRESS.ADDR_2),''),40))

	ELSE ''
 END					SZADD1
,CASE
	WHEN CUST_ADDRESS.ADDR_1 IS NOT NULL -- If old ADDR_1 is new ADDR1, check ADDR2, only use it if it looks legit
	AND LEFT(TRIM(CUST_ADDRESS.ADDR_1),1) <= '9' 
	AND LEFT(TRIM(CUST_ADDRESS.ADDR_1),1) <> '%'
	AND LEFT(TRIM(CUST_ADDRESS.ADDR_1),1) <> '#'
	AND LEFT(TRIM(CUST_ADDRESS.ADDR_1),1) <> '('
	AND TRIM(CUST_ADDRESS.ADDR_1) <> ''
	AND
		(
			LEFT(TRIM(CUST_ADDRESS.ADDR_2),3) = 'STE'
			OR LEFT(TRIM(CUST_ADDRESS.ADDR_2),5) = 'SUITE'
			OR LEFT(TRIM(CUST_ADDRESS.ADDR_2),3) = '1ST'
			OR LEFT(TRIM(CUST_ADDRESS.ADDR_2),4) = 'BLDG'
			OR LEFT(TRIM(CUST_ADDRESS.ADDR_2),8) = 'BUILDING'
		)
	THEN TRIM(LEFT(ISNULL(TRIM(CUST_ADDRESS.ADDR_2),''),40))

	ELSE ''
 END					SZADD2
,''			SZADD3
,''			SZADD4
,CASE 
	WHEN LEN(CUST_ADDRESS.ZIPCODE) <= 12
	THEN TRIM(CUST_ADDRESS.ZIPCODE)
	ELSE ''
 END					SZADDZ
,CASE
	WHEN LEN(CUST_ADDRESS.CITY) <= 25
	THEN TRIM(CUST_ADDRESS.CITY)
	ELSE ''	
 END					SZCTY1
,'US'					SZCTR

,CASE
	WHEN LEN(TRIM(CUST_ADDRESS.STATE)) = 2
	THEN TRIM(CUST_ADDRESS.STATE)
	ELSE ''	
 END					SZADDS
,''						SZCOUN
,CASE
	WHEN 
		LEFT(REPLACE(CUST_ADDRESS.COUNTRY,'-',''), 3) IS NOT NULL
		AND LEFT(REPLACE(CUST_ADDRESS.COUNTRY,'-',''), 3) <> ''
		AND LEFT(TRIM(CUST_ADDRESS.COUNTRY),1) <= '9'
		THEN
		LEFT(REPLACE(CUST_ADDRESS.COUNTRY,'-',''), 3)
		ELSE ''
 END					SZAR1
,CASE
	WHEN
		CUST_ADDRESS.COUNTRY IS NOT NULL
		AND 	LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUST_ADDRESS.COUNTRY,'+',''),' ',''),'-',''),10),7),3)
	+ '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUST_ADDRESS.COUNTRY,'+',''),' ',''),'-',''),10),7),4) <> ''
		AND LEFT(TRIM(CUST_ADDRESS.COUNTRY),1) <= '9'
		THEN
	LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUST_ADDRESS.COUNTRY,'+',''),' ',''),'-',''),10),7),3)
	+ '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUST_ADDRESS.COUNTRY,'+',''),' ',''),'-',''),10),7),4)
		ELSE ''
 END					SZPH1





,''							SZPHT1
,''							SZAR2
,''							SZPH2
,''							SZPHT2
,''							SZTORG
,'TSAMPSON'					SZUSER
,'Import'					SZPID
,'' 						SZJOBN
,(DATEPART(year, GETDATE())-1900)*1000 + DATEPART(dayofyear, GETDATE())	SZUPMJ
,'' 						SZTDAY
,'' 						SZUPMT
,'' 						SZPRGF
,'' 						SZSCCLTP
,CAST(72000 + CUSTOMER.ROWID AS INTEGER)		SZPA8 -- This is the CB ref, if CSB or CB this is NULL
,'' 						SZTICKER
,'' 						SZEXCHG
,'' 						SZDUNS
,'' 						SZCLASS01
,'' 						SZCLASS02
,'' 						SZCLASS03
,'' 						SZCLASS04
,'' 						SZCLASS05
,'' 						SZNOE
,'' 						SZGROWTHR
,'' 						SZYEARSTAR
,'' 						SZAEMPGP
,'' 						SZACTIN
,'' 						SZREVRNG

FROM CUST_ADDRESS CUST_ADDRESS

LEFT JOIN CUSTOMER CUSTOMER ON
	CUST_ADDRESS.CUSTOMER_ID = CUSTOMER.ID

JOIN CUSTOMER_ORDER ORDERS
	ON CUST_ADDRESS.CUSTOMER_ID = ORDERS.CUSTOMER_ID
	AND CUST_ADDRESS.ADDR_NO = ORDERS.SHIP_TO_ADDR_NO

LEFT JOIN
	(
		SELECT DISTINCT A.CUSTOMER_ID
		FROM CUST_ADDRESS A
		WHERE A.ADDR_NO > 1
	) CB_LIST
	ON CB_LIST.CUSTOMER_ID = CUST_ADDRESS.CUSTOMER_ID
WHERE CB_LIST.CUSTOMER_ID IS NOT NULL
 
AND YEAR(ORDERS.ORDER_DATE) >= 2015