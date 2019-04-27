/* CB more than 1 CS
	F0101Z2 zFile 2 VER0004
	CB for Customers with >1 ShipTo 

	20190404 Tom Sampson
	VER0002
	- initial changes after review with Steve

	VER0003
	-- prepend BC_ to SZALKY

	VER0004
	-- added exclusion CSB_REF.CUSTOMER_ID IS NULL
*/


SELECT DISTINCT
 'JDE'					SZEDUS						
,'BAL0002'				SZEDBT
,CAST(72000 + CUSTOMER.ROWID AS INTEGER)	SZEDTN -- primary key edi
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
,CAST(72000 + CUSTOMER.ROWID AS INTEGER)		SZAN8 -- primary key
,'BC_' + CUSTOMER.ID			SZALKY -- for CSB and SB this is default old CUSTOMER.ID, for CS, it's CUST_ADDRESS.CUSTOMER_ID + ADDR_NO
,''						SZTAX
,LEFT(
	TRIM(
		REPLACE(
			REPLACE(
				CUSTOMER.NAME
			,'.','')
		,',','')
	)
 ,40)					SZALPH
,''						SZDC -- JDE does automatically, leave it ''
,'          20'			SZMCU -- ten spaces then a 20
,''						SZSIC
,''						SZLNGP
,'CB'					SZAT1 -- CSB, CB, CS
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
,(DATEPART(year, GETDATE())-1900)*1000 + DATEPART(dayofyear, GETDATE())	SZEFTB -- JDE julian today
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
,CASE
	WHEN CUSTOMER.ADDR_1 IS NOT NULL
	THEN
	 TRIM(
		LEFT(
			TRIM(
		CUSTOMER.ADDR_1
				),40))
	ELSE ''
 END					SZADD1
,CASE
	WHEN CUSTOMER.ADDR_2 IS NOT NULL
	THEN
	 TRIM(
		LEFT(
			TRIM(
		CUSTOMER.ADDR_2
				),40))
	ELSE ''
 END					SZADD2
,''						SZADD3
,''						SZADD4
,CASE 
	WHEN LEN(CUSTOMER.ZIPCODE) <= 12
	THEN TRIM(CUSTOMER.ZIPCODE)
	ELSE ''
 END					SZADDZ
,CASE
	WHEN LEN(CUSTOMER.CITY) <= 25
	THEN TRIM(CUSTOMER.CITY)
	ELSE ''	
 END					SZCTY1
,'US'					SZCTR

,CASE
	WHEN LEN(CUSTOMER.STATE) = 2
	THEN CUSTOMER.STATE
	ELSE ''	
 END					SZADDS
,''						SZCOUN
,CASE
	WHEN 
		LEFT(REPLACE(CUSTOMER.CONTACT_PHONE,'-',''), 3) IS NOT NULL
		AND LEFT(REPLACE(CUSTOMER.CONTACT_PHONE,'-',''), 3) <> ''
		AND LEFT(TRIM(CUSTOMER.CONTACT_PHONE),1) <= '9'
		THEN
		LEFT(REPLACE(CUSTOMER.CONTACT_PHONE,'-',''), 3)
		ELSE ''
 END					SZAR1
,CASE
	WHEN
		CUSTOMER.CONTACT_PHONE IS NOT NULL
		AND 	LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUSTOMER.CONTACT_PHONE,'+',''),' ',''),'-',''),10),7),3)
	+ '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUSTOMER.CONTACT_PHONE,'+',''),' ',''),'-',''),10),7),4) <> ''
		AND LEFT(TRIM(CUSTOMER.CONTACT_PHONE),1) <= '9'
		THEN
	LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUSTOMER.CONTACT_PHONE,'+',''),' ',''),'-',''),10),7),3)
	+ '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUSTOMER.CONTACT_PHONE,'+',''),' ',''),'-',''),10),7),4)
		ELSE ''
 END					SZPH1
,''						SZPHT1
,CASE
	WHEN 
		LEFT(REPLACE(CUSTOMER.CONTACT_FAX,'-',''), 3) IS NOT NULL
		AND LEFT(REPLACE(CUSTOMER.CONTACT_FAX,'-',''), 3) <> ''
		AND LEFT(TRIM(CUSTOMER.CONTACT_FAX),1) <= '9'
		THEN
		LEFT(REPLACE(CUSTOMER.CONTACT_FAX,'-',''), 3)
		ELSE ''
 END					SZAR2
,CASE
	WHEN
		CUSTOMER.CONTACT_FAX IS NOT NULL
		AND 	LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUSTOMER.CONTACT_FAX,'+',''),' ',''),'-',''),10),7),3)
	+ '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUSTOMER.CONTACT_FAX,'+',''),' ',''),'-',''),10),7),4) <> ''
		AND LEFT(TRIM(CUSTOMER.CONTACT_FAX),1) <= '9'
		THEN
	LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUSTOMER.CONTACT_FAX,'+',''),' ',''),'-',''),10),7),3)
	+ '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUSTOMER.CONTACT_FAX,'+',''),' ',''),'-',''),10),7),4)
		ELSE ''
 END					SZPH2
,''						SZTORG
,'TSAMPSON'				SZUSER
,'Import'				SZPID
,''						SZJOBN
,(DATEPART(year, GETDATE())-1900)*1000 + DATEPART(dayofyear, GETDATE())	SZUPMJ
,''						SZTDAY
,''						SZUPMT
,''						SZPRGF
,''						SZSCCLTP
,''						SZPA8 -- This is the CB ref, if CSB or CB this is NULL
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

FROM CUSTOMER CUSTOMER

LEFT JOIN CUST_ADDRESS CUST_ADDRESS ON
	CUSTOMER.ID = CUST_ADDRESS.CUSTOMER_ID

JOIN CUSTOMER_ORDER ORDERS
	ON CUSTOMER.ID = ORDERS.CUSTOMER_ID

LEFT JOIN _CSB_REF$ CSB_REF
	ON CUSTOMER.ID = CSB_REF.CUSTOMER_ID

 WHERE CUST_ADDRESS.ADDR_NO > 1
AND YEAR(ORDERS.ORDER_DATE) >= 2015
AND CSB_REF.CUSTOMER_ID IS NULL
