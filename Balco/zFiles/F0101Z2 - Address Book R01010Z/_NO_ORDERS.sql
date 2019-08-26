		SELECT  -- BillTo Addesses with only 1 shipping address, this includes CB and CSB --
		 'JDE' SZEDUS
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
		,LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)), 40) SZADD1
		,LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 40) SZADD2
		,'' SZADD3
		,'' SZADD4
		,CUST_ADDRESS.ZIPCODE SZADDZ
		,CUST_ADDRESS.CITY SZCTY1
		,'US' SZCTR
		,CUST_ADDRESS.STATE SZADDS
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
        SELECT 
            ACB.CUSTOMER_ID
            
        FROM _AR_CUST_BAL ACB

        LEFT JOIN _CUST_WITH_ORDER_HIST CH
            ON ACB.CUSTOMER_ID = CH.CUSTOMER_ID

        WHERE CH.CUSTOMER_ID IS NULL

        ORDER BY ACB.CUSTOMER_ID
		) CUSLIST
	JOIN CUSTOMER CUSTOMER /* Bill To Addresses*/ ON CUSLIST.CUSTOMER_ID = CUSTOMER.ID
	JOIN CUST_ADDRESS CUST_ADDRESS /* Ship To Address*/ ON CUSTOMER.ID = CUST_ADDRESS.CUSTOMER_ID
