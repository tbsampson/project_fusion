/* C and CB, plus AR only union
 -- CUSTOMER ADDRESSES 1
*/
SELECT BILLTO.SZEDUS
	,BILLTO.SZEDBT
	,(
		ROW_NUMBER() OVER (
			ORDER BY BILLTO.SORT
			)
		) + 72000 SZEDTN
	,BILLTO.SZEDLN
	,BILLTO.SZEDCT
	,BILLTO.SZTYTN
	,BILLTO.SZEDFT
	,BILLTO.SZEDDT
	,BILLTO.SZDRIN
	,BILLTO.SZEDDL
	,BILLTO.SZEDSP
	,BILLTO.SZPNID
	,BILLTO.SZTNAC
	,(
		ROW_NUMBER() OVER (
			ORDER BY BILLTO.SORT
			)
		) + 72000 SZAN8
	,BILLTO.SZALKY
	,BILLTO.SZTAX
	,BILLTO.SZALPH
	,BILLTO.SZDC
	,BILLTO.SZMCU
	,BILLTO.SZSIC
	,BILLTO.SZLNGP
	,BILLTO.SZAT1
	,BILLTO.SZCM
	,BILLTO.SZTAXC
	,BILLTO.SZAT2
	,BILLTO.SZAT3
	,BILLTO.SZAT4
	,BILLTO.SZATR
	,BILLTO.SZAT5
	,BILLTO.SZATP
	,BILLTO.SZATPR
	,BILLTO.SZAB3
	,BILLTO.SZATE
	,BILLTO.SZSBLI
	,BILLTO.SZEFTB
	,BILLTO.SZAN81
	,BILLTO.SZAN82
	,BILLTO.SZAN83
	,BILLTO.SZAN84
	,BILLTO.SZAN86
	,BILLTO.SZAN85
	,BILLTO.SZAC01
	,BILLTO.SZAC02
	,BILLTO.SZAC03
	,BILLTO.SZAC04
	,BILLTO.SZAC05
	,BILLTO.SZAC06
	,BILLTO.SZAC07
	,BILLTO.SZAC08
	,BILLTO.SZAC09
	,BILLTO.SZAC10
	,BILLTO.SZAC11
	,BILLTO.SZAC12
	,BILLTO.SZAC13
	,BILLTO.SZAC14
	,BILLTO.SZAC15
	,BILLTO.SZAC16
	,BILLTO.SZAC17
	,BILLTO.SZAC18
	,BILLTO.SZAC19
	,BILLTO.SZAC20
	,BILLTO.SZAC21
	,BILLTO.SZAC22
	,BILLTO.SZAC23
	,BILLTO.SZAC24
	,BILLTO.SZAC25
	,BILLTO.SZAC26
	,BILLTO.SZAC27
	,BILLTO.SZAC28
	,BILLTO.SZAC29
	,BILLTO.SZAC30
	,BILLTO.SZGLBA
	,BILLTO.SZPTI
	,BILLTO.SZPDI
	,BILLTO.SZMSGA
	,BILLTO.SZRMK
	,BILLTO.SZTXCT
	,BILLTO.SZTX2
	,BILLTO.SZALP1
	,BILLTO.SZURCD
	,BILLTO.SZURDT
	,BILLTO.SZURAT
	,BILLTO.SZURAB
	,BILLTO.SZURRF
	,BILLTO.SZMLNM
	,BILLTO.SZMLN1
	,BILLTO.SZADD1
	,BILLTO.SZADD2
	,BILLTO.SZADD3
	,BILLTO.SZADD4
	,BILLTO.SZADDZ
	,BILLTO.SZCTY1
	,BILLTO.SZCTR
	,BILLTO.SZADDS
	,BILLTO.SZCOUN
	,BILLTO.SZAR1
	,BILLTO.SZPH1
	,BILLTO.SZPHT1
	,BILLTO.SZAR2
	,BILLTO.SZPH2
	,BILLTO.SZPHT2
	,BILLTO.SZTORG
	,BILLTO.SZUSER
	,BILLTO.SZPID
	,BILLTO.SZJOBN
	,BILLTO.SZUPMJ
	,BILLTO.SZTDAY
	,BILLTO.SZUPMT
	,BILLTO.SZPRGF
	,BILLTO.SZSCCLTP
	,BILLTO.SZPA8
	,BILLTO.SZTICKER
	,BILLTO.SZEXCHG
	,BILLTO.SZDUNS
	,BILLTO.SZCLASS01
	,BILLTO.SZCLASS02
	,BILLTO.SZCLASS03
	,BILLTO.SZCLASS04
	,BILLTO.SZCLASS05
	,BILLTO.SZNOE
	,BILLTO.SZGROWTHR
	,BILLTO.SZYEARSTAR
	,BILLTO.SZAEMPGP
	,BILLTO.SZACTIN
	,BILLTO.SZREVRNG
FROM (
	SELECT 'JDE' SZEDUS
		,'BAL0001' SZEDBT /* this is load ref, can put what we want in here*/
		,'' SZEDTN
		,0 SZEDLN
		,'' SZEDCT
		,'JDEAB' SZTYTN
		,'' SZEDFT
		,'' SZEDDT
		,'' SZDRIN
		,'' SZEDDL
		,'N' SZEDSP
		,'' SZPNID
		,'A' SZTNAC
		,'' SZAN8
		,'BC_' + LTRIM(RTRIM(CUSTOMER.ID)) SZALKY /* old customer ID ref*/
		,'' SZTAX
		,LEFT(LTRIM(RTRIM(REPLACE(REPLACE(CUSTOMER.NAME, '.', ''), ',', ''))), 40) SZALPH
		,'' SZDC
		,'          20' SZMCU /* 10 spaces + 20 needs to be a strng*/
		,'' SZSIC
		,'' SZLNGP
		,CASE 
			WHEN CSB_REF.CSB = '1'
				THEN 'C'
			ELSE 'CB'
			END SZAT1 /* CASE only for this query, hard-code the rest*/
		,'' SZCM
		,'2' SZTAXC
		,'N' SZAT2
		,'N' SZAT3
		,'N' SZAT4
		,'Y' SZATR
		,'N' SZAT5
		,'N' SZATP
		,'N' SZATPR
		,'N' SZAB3
		,'N' SZATE
		,'' SZSBLI
		,dbo.JDEJulian(GETDATE()) SZEFTB /* JDE julian today*/
		,'' SZAN81 /* CB Lookup only where CS*/
		,'' SZAN82
		,'' SZAN83
		,'' SZAN84
		,'' SZAN86
		,'' SZAN85
		,'' SZAC01
		,'' SZAC02
		,'' SZAC03
		,'' SZAC04
		,'' SZAC05
		,'' SZAC06
		,'' SZAC07
		,'' SZAC08
		,'' SZAC09
		,'' SZAC10
		,'' SZAC11
		,'' SZAC12
		,'' SZAC13
		,'' SZAC14
		,'' SZAC15
		,'' SZAC16
		,'' SZAC17
		,'' SZAC18
		,'' SZAC19
		,'' SZAC20
		,'' SZAC21
		,'' SZAC22
		,'' SZAC23
		,'' SZAC24
		,'' SZAC25
		,'' SZAC26
		,'' SZAC27
		,'' SZAC28
		,'' SZAC29
		,'' SZAC30
		,'' SZGLBA
		,0 SZPTI
		,'0' SZPDI
		,'' SZMSGA
		,'' SZRMK
		,'' SZTXCT
		,'' SZTX2
		,'' SZALP1
		,'' SZURCD
		,'0' SZURDT
		,0 SZURAT
		,0 SZURAB
		,'' SZURRF
		,'' SZMLNM
		,'' SZMLN1
		,ISNULL(CASE 
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_1'
					THEN LEFT(LTRIM(RTRIM(CUSTOMER.ADDR_1)), 40)
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_2'
					THEN LEFT(LTRIM(RTRIM(CUSTOMER.ADDR_2)), 40)
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_1'
					THEN LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)), 40)
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_2'
					THEN LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 40)
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_1'
					THEN LEFT(LTRIM(RTRIM(CUSTOMER.ADDR_1)), 40)
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_2'
					THEN LEFT(LTRIM(RTRIM(CUSTOMER.ADDR_2)), 40)
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_1'
					THEN LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)), 40)
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_2'
					THEN LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 40)
				WHEN CSB_REF.CSB IS NULL
					THEN LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)), 40)
				END, '') SZADD1
		,ISNULL(CASE 
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_1'
					THEN LEFT(LTRIM(RTRIM(CUSTOMER.ADDR_2)), 40)
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_2'
					THEN LEFT(LTRIM(RTRIM(CUSTOMER.ADDR_3)), 40)
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_1'
					THEN LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 40)
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_2'
					THEN LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_3)), 40)
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_1'
					THEN LEFT(LTRIM(RTRIM(CUSTOMER.ADDR_2)), 40)
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_2'
					THEN LEFT(LTRIM(RTRIM(CUSTOMER.ADDR_3)), 40)
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_1'
					THEN LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 40)
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_2'
					THEN LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_3)), 40)
				WHEN CSB_REF.CSB IS NULL
					THEN LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 40)
				ELSE ''
				END, '') SZADD2
		,'' SZADD3
		,'' SZADD4
		,ISNULL(CASE 
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_1'
					THEN CUSTOMER.ZIPCODE
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_2'
					THEN CUSTOMER.ZIPCODE
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_1'
					THEN CUST_ADDRESS.ZIPCODE
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_2'
					THEN CUST_ADDRESS.ZIPCODE
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_1'
					THEN CUSTOMER.ZIPCODE
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_2'
					THEN CUSTOMER.ZIPCODE
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_1'
					THEN CUST_ADDRESS.ZIPCODE
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_2'
					THEN CUST_ADDRESS.ZIPCODE
				WHEN CSB_REF.CSB IS NULL
					THEN CUST_ADDRESS.ZIPCODE
				END, '') SZADDZ
		,ISNULL(CASE 
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_1'
					THEN CUSTOMER.CITY
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_2'
					THEN CUSTOMER.CITY
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_1'
					THEN CUST_ADDRESS.CITY
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_2'
					THEN CUST_ADDRESS.CITY
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_1'
					THEN CUSTOMER.CITY
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_2'
					THEN CUSTOMER.CITY
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_1'
					THEN CUST_ADDRESS.CITY
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_2'
					THEN CUST_ADDRESS.CITY
				WHEN CSB_REF.CSB IS NULL
					THEN CUST_ADDRESS.CITY
				END, '') SZCTY1
		,'US' SZCTR
		,ISNULL(CASE 
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_1'
					AND LEN(CUSTOMER.STATE) = 2
					THEN CUSTOMER.STATE
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'BT_ADDR_2'
					AND LEN(CUSTOMER.STATE) = 2
					THEN CUSTOMER.STATE
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_1'
					AND LEN(CUST_ADDRESS.STATE) = 2
					THEN CUST_ADDRESS.STATE
				WHEN CSB_REF.CSB = '1'
					AND CSB_REF.CSB_ADDR1_SOURCE = 'ST_ADDR_2'
					AND LEN(CUST_ADDRESS.STATE) = 2
					THEN CUST_ADDRESS.STATE
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_1'
					AND LEN(CUSTOMER.STATE) = 2
					THEN CUSTOMER.STATE
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'BT_ADDR_2'
					AND LEN(CUSTOMER.STATE) = 2
					THEN CUSTOMER.STATE
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_1'
					AND LEN(CUST_ADDRESS.STATE) = 2
					THEN CUST_ADDRESS.STATE
				WHEN CSB_REF.CSB <> '1'
					AND CSB_REF.CB_ADDR1_SOURCE = 'ST_ADDR_2'
					AND LEN(CUST_ADDRESS.STATE) = 2
					THEN CUST_ADDRESS.STATE
				WHEN CSB_REF.CSB IS NULL
					THEN CUST_ADDRESS.STATE
				ELSE ''
				END, '') SZADDS
		,'' SZCOUN /* no county in infor*/
		,ISNULL(CASE 
				WHEN CONTACT_PHONE IS NOT NULL
					THEN LEFT(REPLACE(CONTACT_PHONE, '-', ''), 3)
				ELSE ''
				END, '') SZAR1
		,ISNULL(CASE 
				WHEN CONTACT_PHONE IS NOT NULL
					THEN LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CONTACT_PHONE, '+', ''), ' ', ''), '-', ''), 10), 7), 3) + '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CONTACT_PHONE, '+', ''), ' ', ''), '-', ''), 10), 7), 4)
				ELSE ''
				END, '') SZPH1
		,'' SZPHT1
		,ISNULL(CASE 
				WHEN CONTACT_FAX IS NOT NULL
					THEN LEFT(REPLACE(CONTACT_FAX, '-', ''), 3)
				ELSE ''
				END, '') SZAR2
		,ISNULL(CASE 
				WHEN CONTACT_FAX IS NOT NULL
					THEN LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CONTACT_FAX, '+', ''), ' ', ''), '-', ''), 10), 7), 3) + '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CONTACT_FAX, '+', ''), ' ', ''), '-', ''), 10), 7), 4)
				ELSE ''
				END, '') SZPH2 /* add dash fix*/
		,'FAX' SZPHT2
		,'' SZTORG
		,'TSAMPSON' SZUSER
		,'Import' SZPID
		,'' SZJOBN
		,dbo.JDEJulian(GETDATE()) SZUPMJ
		,'' SZTDAY
		,'' SZUPMT
		,'' SZPRGF
		,'' SZSCCLTP
		,'' SZPA8
		,'' SZTICKER
		,'' SZEXCHG
		,'' SZDUNS
		,'' SZCLASS01
		,'' SZCLASS02
		,'' SZCLASS03
		,'' SZCLASS04
		,'' SZCLASS05
		,'' SZNOE
		,'' SZGROWTHR
		,'' SZYEARSTAR
		,'' SZAEMPGP
		,'' SZACTIN
		,'' SZREVRNG
		,CUSTOMER.ROWID SORT
	FROM (
		SELECT DISTINCT CUSTOMER_ID
			,SHIP_TO_ADDR_NO
		FROM CUSTOMER_ORDER ORDERS
		WHERE SHIP_TO_ADDR_NO <= 1
		) CUSLIST
	JOIN CUSTOMER CUSTOMER /* Bill To Addresses*/
		ON CUSLIST.CUSTOMER_ID = CUSTOMER.ID
	JOIN CUST_ADDRESS CUST_ADDRESS /* Ship To Address*/
		ON CUSTOMER.ID = CUST_ADDRESS.CUSTOMER_ID
			AND CUST_ADDRESS.ADDR_NO = 1
	LEFT JOIN _CSB_REF$ CSB_REF
		ON CUSLIST.CUSTOMER_ID = CSB_REF.CUSTOMER_ID
	
	UNION ------------------------------------------------------------------------------------------------------------------------------
	
	/* BillTo addresses with more than 1 shipping address*/ SELECT DISTINCT 'JDE' SZEDUS
    -- customer addresses more than 1
		,'BAL0002' SZEDBT
		,'' SZEDTN /* primary key edi*/
		,0 SZEDLN
		,'' SZEDCT
		,'JDEAB' SZTYTN
		,'' SZEDFT
		,'' SZEDDT
		,'' SZDRIN
		,'' SZEDDL
		,'N' SZEDSP
		,'' SZPNID
		,'A' SZTNAC
		,'' SZAN8 /* primary key*/
		,'BC_' + LTRIM(RTRIM(CUSTOMER.ID)) SZALKY /* for CSB and SB this is default old CUSTOMER.ID, for CS, it's CUST_ADDRESS.CUSTOMER_ID + ADDR_NO*/
		,'' SZTAX
		,LEFT(LTRIM(RTRIM(REPLACE(REPLACE(CUSTOMER.NAME, '.', ''), ',', ''))), 40) SZALPH
		,'' SZDC /* JDE does automatically, leave it ''*/
		,'          20' SZMCU /* ten spaces then a 20*/
		,'' SZSIC
		,'' SZLNGP
		,'CB' SZAT1 /* CSB, CB, CS*/
		,'' SZCM
		,'2' SZTAXC
		,'N' SZAT2
		,'N' SZAT3
		,'N' SZAT4
		,'Y' SZATR
		,'N' SZAT5
		,'N' SZATP
		,'N' SZATPR
		,'N' SZAB3
		,'N' SZATE
		,'' SZSBLI
		,(DATEPART(year, GETDATE()) - 1900) * 1000 + DATEPART(dayofyear, GETDATE()) SZEFTB /* JDE julian today*/
		,'' SZAN81 /* CB Lookup only where CS*/
		,'' SZAN82
		,'' SZAN83
		,'' SZAN84
		,'' SZAN86
		,'' SZAN85
		,'' SZAC01
		,'' SZAC02
		,'' SZAC03
		,'' SZAC04
		,'' SZAC05
		,'' SZAC06
		,'' SZAC07
		,'' SZAC08
		,'' SZAC09
		,'' SZAC10
		,'' SZAC11
		,'' SZAC12
		,'' SZAC13
		,'' SZAC14
		,'' SZAC15
		,'' SZAC16
		,'' SZAC17
		,'' SZAC18
		,'' SZAC19
		,'' SZAC20
		,'' SZAC21
		,'' SZAC22
		,'' SZAC23
		,'' SZAC24
		,'' SZAC25
		,'' SZAC26
		,'' SZAC27
		,'' SZAC28
		,'' SZAC29
		,'' SZAC30
		,'' SZGLBA
		,0 SZPTI
		,'0' SZPDI
		,'' SZMSGA
		,'' SZRMK
		,'' SZTXCT
		,'' SZTX2
		,'' SZALP1
		,'' SZURCD
		,'0' SZURDT
		,0 SZURAT
		,0 SZURAB
		,'' SZURRF
		,'' SZMLNM
		,'' SZMLN1
		,CASE 
			WHEN CUSTOMER.ADDR_1 IS NOT NULL
				THEN LTRIM(RTRIM(LEFT(LTRIM(RTRIM(CUSTOMER.ADDR_1)), 40)))
			ELSE ''
			END SZADD1
		,CASE 
			WHEN CUSTOMER.ADDR_2 IS NOT NULL
				THEN LTRIM(RTRIM(LEFT(LTRIM(RTRIM(CUSTOMER.ADDR_2)), 40)))
			ELSE ''
			END SZADD2
		,'' SZADD3
		,'' SZADD4
		,CASE 
			WHEN LEN(CUSTOMER.ZIPCODE) <= 12
				THEN LTRIM(RTRIM(CUSTOMER.ZIPCODE))
			ELSE ''
			END SZADDZ
		,CASE 
			WHEN LEN(CUSTOMER.CITY) <= 25
				THEN LTRIM(RTRIM(CUSTOMER.CITY))
			ELSE ''
			END SZCTY1
		,'US' SZCTR
		,CASE 
			WHEN LEN(CUSTOMER.STATE) = 2
				THEN CUSTOMER.STATE
			ELSE ''
			END SZADDS
		,'' SZCOUN
		,CASE 
			WHEN LEFT(REPLACE(CUSTOMER.CONTACT_PHONE, '-', ''), 3) IS NOT NULL
				AND LEFT(REPLACE(CUSTOMER.CONTACT_PHONE, '-', ''), 3) <> ''
				AND LEFT(LTRIM(RTRIM(CUSTOMER.CONTACT_PHONE)), 1) <= '9'
				THEN LEFT(REPLACE(CUSTOMER.CONTACT_PHONE, '-', ''), 3)
			ELSE ''
			END SZAR1
		,CASE 
			WHEN CUSTOMER.CONTACT_PHONE IS NOT NULL
				AND LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUSTOMER.CONTACT_PHONE, '+', ''), ' ', ''), '-', ''), 10), 7), 3) + '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUSTOMER.CONTACT_PHONE, '+', ''), ' ', ''), '-', ''), 10), 7), 4) <> ''
				AND LEFT(LTRIM(RTRIM(CUSTOMER.CONTACT_PHONE)), 1) <= '9'
				THEN LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUSTOMER.CONTACT_PHONE, '+', ''), ' ', ''), '-', ''), 10), 7), 3) + '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUSTOMER.CONTACT_PHONE, '+', ''), ' ', ''), '-', ''), 10), 7), 4)
			ELSE ''
			END SZPH1
		,'' SZPHT1
		,CASE 
			WHEN LEFT(REPLACE(CUSTOMER.CONTACT_FAX, '-', ''), 3) IS NOT NULL
				AND LEFT(REPLACE(CUSTOMER.CONTACT_FAX, '-', ''), 3) <> ''
				AND LEFT(LTRIM(RTRIM(CUSTOMER.CONTACT_FAX)), 1) <= '9'
				THEN LEFT(REPLACE(CUSTOMER.CONTACT_FAX, '-', ''), 3)
			ELSE ''
			END SZAR2
		,CASE 
			WHEN CUSTOMER.CONTACT_FAX IS NOT NULL
				AND LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUSTOMER.CONTACT_FAX, '+', ''), ' ', ''), '-', ''), 10), 7), 3) + '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUSTOMER.CONTACT_FAX, '+', ''), ' ', ''), '-', ''), 10), 7), 4) <> ''
				AND LEFT(LTRIM(RTRIM(CUSTOMER.CONTACT_FAX)), 1) <= '9'
				THEN LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUSTOMER.CONTACT_FAX, '+', ''), ' ', ''), '-', ''), 10), 7), 3) + '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUSTOMER.CONTACT_FAX, '+', ''), ' ', ''), '-', ''), 10), 7), 4)
			ELSE ''
			END SZPH2
		,'FAX' SZPHT2
		,'' SZTORG
		,'TSAMPSON' SZUSER
		,'Import' SZPID
		,'' SZJOBN
		,(DATEPART(year, GETDATE()) - 1900) * 1000 + DATEPART(dayofyear, GETDATE()) SZUPMJ
		,'' SZTDAY
		,'' SZUPMT
		,'' SZPRGF
		,'' SZSCCLTP
		,'' SZPA8 /* This is the CB ref, if CSB or CB this is NULL*/
		,'' SZTICKER
		,'' SZEXCHG
		,'' SZDUNS
		,'' SZCLASS01
		,'' SZCLASS02
		,'' SZCLASS03
		,'' SZCLASS04
		,'' SZCLASS05
		,'' SZNOE
		,'' SZGROWTHR
		,'' SZYEARSTAR
		,'' SZAEMPGP
		,'' SZACTIN
		,'' SZREVRNG
		,CUSTOMER.ROWID SORT
	FROM CUSTOMER CUSTOMER
	LEFT JOIN CUST_ADDRESS CUST_ADDRESS
		ON CUSTOMER.ID = CUST_ADDRESS.CUSTOMER_ID
	JOIN CUSTOMER_ORDER ORDERS
		ON CUSTOMER.ID = ORDERS.CUSTOMER_ID
	LEFT JOIN _CSB_REF$ CSB_REF
		ON CUSTOMER.ID = CSB_REF.CUSTOMER_ID
	WHERE CUST_ADDRESS.ADDR_NO > 1
		AND ORDERS.ORDER_DATE IS NOT NULL
		AND CSB_REF.CUSTOMER_ID IS NULL
	
	UNION ------------------------------------------------------------------------------------------------------------------------------
	
	SELECT 'JDE' SZEDUS
		,'BAL0001' SZEDBT /* this is load ref, can put what we want in here*/
		,'' SZEDTN
		,0 SZEDLN
		,'' SZEDCT
		,'JDEAB' SZTYTN
		,'' SZEDFT
		,'' SZEDDT
		,'' SZDRIN
		,'' SZEDDL
		,'N' SZEDSP
		,'' SZPNID
		,'A' SZTNAC
		,'' SZAN8
		,'BC_' + LTRIM(RTRIM(CUSTOMER.ID)) SZALKY /* old customer ID ref*/
		,'' SZTAX
		,LEFT(LTRIM(RTRIM(REPLACE(REPLACE(CUSTOMER.NAME, '.', ''), ',', ''))), 40) SZALPH
		,'' SZDC
		,'          20' SZMCU /* 10 spaces + 20 needs to be a strng*/
		,'' SZSIC
		,'' SZLNGP
		,'C' SZAT1 /* CASE only for this query, hard-code the rest*/
		,'' SZCM
		,'2' SZTAXC
		,'N' SZAT2
		,'N' SZAT3
		,'N' SZAT4
		,'Y' SZATR
		,'N' SZAT5
		,'N' SZATP
		,'N' SZATPR
		,'N' SZAB3
		,'N' SZATE
		,'' SZSBLI
		,dbo.JDEJulian(GETDATE()) SZEFTB /* JDE julian today*/
		,'' SZAN81 /* CB Lookup only where CS*/
		,'' SZAN82
		,'' SZAN83
		,'' SZAN84
		,'' SZAN86
		,'' SZAN85
		,'' SZAC01
		,'' SZAC02
		,'' SZAC03
		,'' SZAC04
		,'' SZAC05
		,'' SZAC06
		,'' SZAC07
		,'' SZAC08
		,'' SZAC09
		,'' SZAC10
		,'' SZAC11
		,'' SZAC12
		,'' SZAC13
		,'' SZAC14
		,'' SZAC15
		,'' SZAC16
		,'' SZAC17
		,'' SZAC18
		,'' SZAC19
		,'' SZAC20
		,'' SZAC21
		,'' SZAC22
		,'' SZAC23
		,'' SZAC24
		,'' SZAC25
		,'' SZAC26
		,'' SZAC27
		,'' SZAC28
		,'' SZAC29
		,'' SZAC30
		,'' SZGLBA
		,0 SZPTI
		,'0' SZPDI
		,'' SZMSGA
		,'' SZRMK
		,'' SZTXCT
		,'' SZTX2
		,'' SZALP1
		,'' SZURCD
		,'0' SZURDT
		,0 SZURAT
		,0 SZURAB
		,'' SZURRF
		,'' SZMLNM
		,'' SZMLN1
		,CASE 
			WHEN LEFT(CUST_ADDRESS.ADDR_1, 1) = '%'
				OR LEFT(CUST_ADDRESS.ADDR_1, 3) = 'C/O'
				OR LEFT(CUST_ADDRESS.ADDR_1, 4) = 'ATTN'
				OR CUST_ADDRESS.ADDR_1 IS NULL
				THEN ISNULL(LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 40), '')
			ELSE ISNULL(LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)), 40), '')
			END SZADD1
		,CASE 
			WHEN LEFT(CUST_ADDRESS.ADDR_1, 1) = '%'
				OR LEFT(CUST_ADDRESS.ADDR_1, 3) = 'C/O'
				OR LEFT(CUST_ADDRESS.ADDR_1, 4) = 'ATTN'
				OR CUST_ADDRESS.ADDR_1 IS NULL
				THEN ''
			ELSE ISNULL(LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 40), '')
			END SZADD2
		,'' SZADD3
		,'' SZADD4
		,ISNULL(CUST_ADDRESS.ZIPCODE, '') SZADDZ
		,ISNULL(CUST_ADDRESS.CITY, '') SZCTY1
		,'US' SZCTR
		,ISNULL(CUST_ADDRESS.STATE, '') SZADDS
		,'' SZCOUN /* no county in infor*/
		,ISNULL(CASE 
				WHEN CONTACT_PHONE IS NOT NULL
					THEN LEFT(REPLACE(CONTACT_PHONE, '-', ''), 3)
				ELSE ''
				END, '') SZAR1
		,ISNULL(CASE 
				WHEN CONTACT_PHONE IS NOT NULL
					THEN LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CONTACT_PHONE, '+', ''), ' ', ''), '-', ''), 10), 7), 3) + '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CONTACT_PHONE, '+', ''), ' ', ''), '-', ''), 10), 7), 4)
				ELSE ''
				END, '') SZPH1
		,'' SZPHT1
		,ISNULL(CASE 
				WHEN CONTACT_FAX IS NOT NULL
					THEN LEFT(REPLACE(CONTACT_FAX, '-', ''), 3)
				ELSE ''
				END, '') SZAR2
		,ISNULL(CASE 
				WHEN CONTACT_FAX IS NOT NULL
					THEN LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CONTACT_FAX, '+', ''), ' ', ''), '-', ''), 10), 7), 3) + '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CONTACT_FAX, '+', ''), ' ', ''), '-', ''), 10), 7), 4)
				ELSE ''
				END, '') SZPH2 /* add dash fix*/
		,'FAX' SZPHT2
		,'' SZTORG
		,'TSAMPSON' SZUSER
		,'Import' SZPID
		,'' SZJOBN
		,dbo.JDEJulian(GETDATE()) SZUPMJ
		,'' SZTDAY
		,'' SZUPMT
		,'' SZPRGF
		,'' SZSCCLTP
		,'' SZPA8
		,'' SZTICKER
		,'' SZEXCHG
		,'' SZDUNS
		,'' SZCLASS01
		,'' SZCLASS02
		,'' SZCLASS03
		,'' SZCLASS04
		,'' SZCLASS05
		,'' SZNOE
		,'' SZGROWTHR
		,'' SZYEARSTAR
		,'' SZAEMPGP
		,'' SZACTIN
		,'' SZREVRNG
		,CUSTOMER.ROWID SORT
	FROM (
		SELECT ACB.CUSTOMER_ID
		FROM _AR_CUST_BAL ACB
		LEFT JOIN _CUST_WITH_ORDER_HIST CH
			ON ACB.CUSTOMER_ID = CH.CUSTOMER_ID
		WHERE CH.CUSTOMER_ID IS NULL
		) CUSLIST
	JOIN CUSTOMER CUSTOMER /* Bill To Addresses*/
		ON CUSLIST.CUSTOMER_ID = CUSTOMER.ID
	JOIN CUST_ADDRESS CUST_ADDRESS /* Ship To Address*/
		ON CUSTOMER.ID = CUST_ADDRESS.CUSTOMER_ID
			AND CUST_ADDRESS.ADDR_NO = 1
	
	UNION
	
	SELECT 'JDE' SZEDUS
		,'BAL0001' SZEDBT /* this is load ref, can put what we want in here*/
		,'' SZEDTN
		,0 SZEDLN
		,'' SZEDCT
		,'JDEAB' SZTYTN
		,'' SZEDFT
		,'' SZEDDT
		,'' SZDRIN
		,'' SZEDDL
		,'N' SZEDSP
		,'' SZPNID
		,'A' SZTNAC
		,'' SZAN8
		,'BC_' + LTRIM(RTRIM(CUSTOMER.ID)) SZALKY /* old customer ID ref*/
		,'' SZTAX
		,LEFT(LTRIM(RTRIM(REPLACE(REPLACE(CUSTOMER.NAME, '.', ''), ',', ''))), 40) SZALPH
		,'' SZDC
		,'          20' SZMCU /* 10 spaces + 20 needs to be a strng*/
		,'' SZSIC
		,'' SZLNGP
		,'C' SZAT1 /* CASE only for this query, hard-code the rest*/
		,'' SZCM
		,'2' SZTAXC
		,'N' SZAT2
		,'N' SZAT3
		,'N' SZAT4
		,'Y' SZATR
		,'N' SZAT5
		,'N' SZATP
		,'N' SZATPR
		,'N' SZAB3
		,'N' SZATE
		,'' SZSBLI
		,dbo.JDEJulian(GETDATE()) SZEFTB /* JDE julian today*/
		,'' SZAN81 /* CB Lookup only where CS*/
		,'' SZAN82
		,'' SZAN83
		,'' SZAN84
		,'' SZAN86
		,'' SZAN85
		,'' SZAC01
		,'' SZAC02
		,'' SZAC03
		,'' SZAC04
		,'' SZAC05
		,'' SZAC06
		,'' SZAC07
		,'' SZAC08
		,'' SZAC09
		,'' SZAC10
		,'' SZAC11
		,'' SZAC12
		,'' SZAC13
		,'' SZAC14
		,'' SZAC15
		,'' SZAC16
		,'' SZAC17
		,'' SZAC18
		,'' SZAC19
		,'' SZAC20
		,'' SZAC21
		,'' SZAC22
		,'' SZAC23
		,'' SZAC24
		,'' SZAC25
		,'' SZAC26
		,'' SZAC27
		,'' SZAC28
		,'' SZAC29
		,'' SZAC30
		,'' SZGLBA
		,0 SZPTI
		,'0' SZPDI
		,'' SZMSGA
		,'' SZRMK
		,'' SZTXCT
		,'' SZTX2
		,'' SZALP1
		,'' SZURCD
		,'0' SZURDT
		,0 SZURAT
		,0 SZURAB
		,'' SZURRF
		,'' SZMLNM
		,'' SZMLN1
		,CASE 
			WHEN LEFT(CUST_ADDRESS.ADDR_1, 1) = '%'
				OR LEFT(CUST_ADDRESS.ADDR_1, 3) = 'C/O'
				OR LEFT(CUST_ADDRESS.ADDR_1, 4) = 'ATTN'
				OR CUST_ADDRESS.ADDR_1 IS NULL
				THEN ISNULL(LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 40), '')
			ELSE ISNULL(LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)), 40), '')
			END SZADD1
		,CASE 
			WHEN LEFT(CUST_ADDRESS.ADDR_1, 1) = '%'
				OR LEFT(CUST_ADDRESS.ADDR_1, 3) = 'C/O'
				OR LEFT(CUST_ADDRESS.ADDR_1, 4) = 'ATTN'
				OR CUST_ADDRESS.ADDR_1 IS NULL
				THEN ''
			ELSE ISNULL(LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 40), '')
			END SZADD2
		,'' SZADD3
		,'' SZADD4
		,ISNULL(CUST_ADDRESS.ZIPCODE, '') SZADDZ
		,ISNULL(CUST_ADDRESS.CITY, '') SZCTY1
		,'US' SZCTR
		,ISNULL(CUST_ADDRESS.STATE, '') SZADDS
		,'' SZCOUN /* no county in infor*/
		,ISNULL(CASE 
				WHEN CONTACT_PHONE IS NOT NULL
					THEN LEFT(REPLACE(CONTACT_PHONE, '-', ''), 3)
				ELSE ''
				END, '') SZAR1
		,ISNULL(CASE 
				WHEN CONTACT_PHONE IS NOT NULL
					THEN LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CONTACT_PHONE, '+', ''), ' ', ''), '-', ''), 10), 7), 3) + '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CONTACT_PHONE, '+', ''), ' ', ''), '-', ''), 10), 7), 4)
				ELSE ''
				END, '') SZPH1
		,'' SZPHT1
		,ISNULL(CASE 
				WHEN CONTACT_FAX IS NOT NULL
					THEN LEFT(REPLACE(CONTACT_FAX, '-', ''), 3)
				ELSE ''
				END, '') SZAR2
		,ISNULL(CASE 
				WHEN CONTACT_FAX IS NOT NULL
					THEN LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CONTACT_FAX, '+', ''), ' ', ''), '-', ''), 10), 7), 3) + '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CONTACT_FAX, '+', ''), ' ', ''), '-', ''), 10), 7), 4)
				ELSE ''
				END, '') SZPH2 /* add dash fix*/
		,'FAX' SZPHT2
		,'' SZTORG
		,'TSAMPSON' SZUSER
		,'Import' SZPID
		,'' SZJOBN
		,dbo.JDEJulian(GETDATE()) SZUPMJ
		,'' SZTDAY
		,'' SZUPMT
		,'' SZPRGF
		,'' SZSCCLTP
		,'' SZPA8
		,'' SZTICKER
		,'' SZEXCHG
		,'' SZDUNS
		,'' SZCLASS01
		,'' SZCLASS02
		,'' SZCLASS03
		,'' SZCLASS04
		,'' SZCLASS05
		,'' SZNOE
		,'' SZGROWTHR
		,'' SZYEARSTAR
		,'' SZAEMPGP
		,'' SZACTIN
		,'' SZREVRNG
		,CUSTOMER.ROWID SORT
	FROM (
		SELECT DISTINCT R.CUSTOMER_ID
		FROM _INVOICE_LINE_TOTALS ILT
		JOIN RECEIVABLE R
			ON R.INVOICE_ID = ILT.INVOICE_ID
		LEFT JOIN _PRE_BILLTO ABT
			ON 'BC_' + R.CUSTOMER_ID = ABT.SZALKY
		WHERE R.ZERO_DATE IS NULL
			AND ABT.SZALKY IS NULL
		) CUSLIST
	JOIN CUSTOMER CUSTOMER /* Bill To Addresses*/
		ON CUSLIST.CUSTOMER_ID = CUSTOMER.ID
	LEFT JOIN CUST_ADDRESS CUST_ADDRESS /* Ship To Address*/
		ON CUSLIST.CUSTOMER_ID = CUST_ADDRESS.CUSTOMER_ID
			AND CUST_ADDRESS.ADDR_NO = 1
	) BILLTO