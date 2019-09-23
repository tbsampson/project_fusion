SELECT ORDER_REF.NEW_ID AS SHDOCO
	,'SO' AS SHDCTO
	,'00020' AS SHKCOO
	,REPS1.ABAN8 AS SHSLSM
	,CASE 
		WHEN REPS2.ABAN8 IS NULL
			THEN CAST(ISNULL(LINE.COMMISSION_PCT, 0) * 1000 AS INTEGER)
		ELSE CAST(ISNULL(LINE.COMMISSION_PCT * (1 - SHARE.SHARE_PERCENT), 0) * 1000 AS INTEGER)
		END AS SHSLCM
	,'0' AS SHFCA
	,'0' AS SHAPUN
	,'I' AS SHCCTY
	,ISNULL(SHARE.SHARE_PERCENT, 0) AS COM_SHARE
	,CO.SALESREP_ID AS REP1_OLD_ID
	,REPS1.ABAN8 AS REP1_NEW_ID
	,SHARE.SHARE_SALESREP_ID AS REP2_OLD_ID
	,REPS2.ABAN8 AS REP2_NEW_ID
	,CASE
		WHEN SHARE.SHARE_PERCENT IS NULL
		THEN (LINE.COMMISSION_PCT/100) * ISNULL(LINE.TOTAL_AMT_SHIPPED,0)
		ELSE ((LINE.COMMISSION_PCT/100) * (1 - SHARE.SHARE_PERCENT/100)) * ISNULL(LINE.TOTAL_AMT_SHIPPED,0)
	 END LINE_COM
	,CASE
		WHEN SHARE.SHARE_PERCENT IS NOT NULL
		THEN ((LINE.COMMISSION_PCT/100) * (SHARE.SHARE_PERCENT/100)) * ISNULL(LINE.TOTAL_AMT_SHIPPED,0)
		ELSE 0
	 END LINE_SHARE
	
FROM dbo.CUSTOMER_ORDER AS CO
LEFT OUTER JOIN dbo._REPS AS REPS1
	ON 'BC_' + CO.SALESREP_ID = REPS1.ABALKY
LEFT OUTER JOIN dbo.CUST_ORDER_LINE AS LINE
	ON LINE.CUST_ORDER_ID = CO.ID
INNER JOIN (
	SELECT DISTINCT NEW_ID
		,OLD_ID
	FROM dbo._ORDER_REF
	) AS ORDER_REF
	ON LINE.CUST_ORDER_ID = ORDER_REF.OLD_ID
LEFT OUTER JOIN dbo.CUST_ORDER_SHARE AS SHARE
	ON SHARE.CUST_ORDER_ID = LINE.CUST_ORDER_ID
LEFT OUTER JOIN dbo._REPS AS REPS2
	ON 'BC_' + SHARE.SHARE_SALESREP_ID = REPS2.ABALKY
WHERE (LINE.COMMISSION_PCT <> 0)