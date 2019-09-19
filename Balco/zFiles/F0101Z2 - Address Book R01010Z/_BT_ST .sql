SELECT BTST.SZAN8
	,BTST.SZALKY
	,BTST.TYPE
	,BTST.BILLTO_REF
	,CASE 
		WHEN _BILLTO.SZAN8 IS NULL
			THEN BTST.SZAN8
		ELSE _BILLTO.SZAN8
		END AS BILLTO_ID
	,BTST.ADDR_NO
FROM (
	SELECT SZAN8
		,SZALKY
		,'BT' AS TYPE
		,CASE 
			WHEN SUBSTRING(RIGHT(SZALKY, LEN(SZALKY) - 3), CHARINDEX('_', RIGHT(SZALKY, LEN(SZALKY) - 3)) + 1, LEN(RIGHT(SZALKY, LEN(SZALKY) - 3))) = RIGHT(SZALKY, LEN(SZALKY) - 3)
				THEN RIGHT(SZALKY, LEN(SZALKY) - 3)
			ELSE LEFT(RIGHT(SZALKY, LEN(SZALKY) - 3), LEN(RIGHT(SZALKY, LEN(SZALKY) - 3)) - LEN(SUBSTRING(RIGHT(SZALKY, LEN(SZALKY) - 3), CHARINDEX('_', RIGHT(SZALKY, LEN(SZALKY) - 3)), LEN(RIGHT(SZALKY, LEN(SZALKY) - 3)))))
			END AS BILLTO_REF
		,CASE 
			WHEN SUBSTRING(RIGHT(SZALKY, LEN(SZALKY) - 3), CHARINDEX('_', RIGHT(SZALKY, LEN(SZALKY) - 3)) + 1, LEN(RIGHT(SZALKY, LEN(SZALKY) - 3))) = RIGHT(SZALKY, LEN(SZALKY) - 3)
				THEN 0
			ELSE SUBSTRING(RIGHT(SZALKY, LEN(SZALKY) - 3), CHARINDEX('_', RIGHT(SZALKY, LEN(SZALKY) - 3)) + 1, LEN(RIGHT(SZALKY, LEN(SZALKY) - 3)))
			END AS ADDR_NO
	FROM dbo._BILLTO
	
	UNION
	
	SELECT SZAN8
		,SZALKY
		,'ST' AS TYPE
		,CASE 
			WHEN SUBSTRING(RIGHT(SZALKY, LEN(SZALKY) - 3), CHARINDEX('_', RIGHT(SZALKY, LEN(SZALKY) - 3)) + 1, LEN(RIGHT(SZALKY, LEN(SZALKY) - 3))) = RIGHT(SZALKY, LEN(SZALKY) - 3)
				THEN RIGHT(SZALKY, LEN(SZALKY) - 3)
			ELSE LEFT(RIGHT(SZALKY, LEN(SZALKY) - 3), LEN(RIGHT(SZALKY, LEN(SZALKY) - 3)) - LEN(SUBSTRING(RIGHT(SZALKY, LEN(SZALKY) - 3), CHARINDEX('_', RIGHT(SZALKY, LEN(SZALKY) - 3)), LEN(RIGHT(SZALKY, LEN(SZALKY) - 3)))))
			END AS BILLTO_REF
		,CASE 
			WHEN SUBSTRING(RIGHT(SZALKY, LEN(SZALKY) - 3), CHARINDEX('_', RIGHT(SZALKY, LEN(SZALKY) - 3)) + 1, LEN(RIGHT(SZALKY, LEN(SZALKY) - 3))) = RIGHT(SZALKY, LEN(SZALKY) - 3)
				THEN 0
			ELSE SUBSTRING(RIGHT(SZALKY, LEN(SZALKY) - 3), CHARINDEX('_', RIGHT(SZALKY, LEN(SZALKY) - 3)) + 1, LEN(RIGHT(SZALKY, LEN(SZALKY) - 3)))
			END AS ADDR_NO
	FROM dbo._SHIPTO
	) AS BTST
LEFT OUTER JOIN dbo._CSB_REF$ AS CSB_REF
	ON BTST.BILLTO_REF = CSB_REF.CUSTOMER_ID
		AND BTST.ADDR_NO = 0
LEFT OUTER JOIN dbo._BILLTO
	ON 'BC_' + BTST.BILLTO_REF = dbo._BILLTO.SZALKY
		AND BTST.ADDR_NO > 0