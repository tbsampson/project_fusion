use balco;

SELECT
	
	 COM_BASE.SHDOCO -- Document (Order No Invoice etc.) (Numeric) Generic Edit [8]
	,COM_BASE.SHDCTO -- Order Type (String) UDC (00 DT) [2]
	,COM_BASE.SHKCOO -- Order Company (Order Number) (String) Generic Edit [5]
    ,ROW_NUMBER() OVER(ORDER BY	COM_BASE.SHDOCO)   
	 SHCMLN -- Commission LineNumber (Numeric) Generic Edit [15]	
	,COM_BASE.SHSLSM -- Salesperson 01 (Numeric) Generic Edit [8]
	,COM_BASE.SHSLCM -- Salesperson Commission 001 (Numeric) Generic Edit [7]
	,COM_BASE.SHFCA -- Flat Commission Amount (Numeric) Generic Edit [15]
	,COM_BASE.SHAPUN -- Amount - Per Unit (Numeric) Generic Edit [15]
	,COM_BASE.SHCCTY -- Commission Code Type (Character) UDC (H42 CC) [1]
	
FROM
	(
		SELECT

			 CB1.SHDOCO -- Document (Order No Invoice etc.) (Numeric) Generic Edit [8]
			,CB1.SHDCTO -- Order Type (String) UDC (00 DT) [2]
			,CB1.SHKCOO -- Order Company (Order Number) (String) Generic Edit [5]
			,CB1.REP1_NEW_ID SHSLSM -- Salesperson 01 (Numeric) Generic Edit [8]
			,CASE WHEN SUM(CB1.TOTAL_AMT_SHIPPED) > 0 AND SUM(CB1.LINE_COM) > 0
				THEN CAST(CAST(SUM(CB1.LINE_COM) / SUM(CB1.TOTAL_AMT_SHIPPED) AS DECIMAL(5,3)) * 1000 AS INTEGER)
				ELSE 0
			 END	SHSLCM -- Salesperson Commission 001 (Numeric) Generic Edit [7]
			,CB1.SHFCA -- Flat Commission Amount (Numeric) Generic Edit [15]
			,CB1.SHAPUN -- Amount - Per Unit (Numeric) Generic Edit [15]
			,CB1.SHCCTY -- Commission Code Type (Character) UDC (H42 CC) [1]

		FROM _COM_BASE CB1

		GROUP BY

			 CB1.SHDOCO -- Document (Order No Invoice etc.) (Numeric) Generic Edit [8]
			,CB1.SHDCTO -- Order Type (String) UDC (00 DT) [2]
			,CB1.SHKCOO -- Order Company (Order Number) (String) Generic Edit [5]
			,CB1.REP1_NEW_ID -- Salesperson 01 (Numeric) Generic Edit [8]
			,CB1.SHFCA -- Flat Commission Amount (Numeric) Generic Edit [15]
			,CB1.SHAPUN -- Amount - Per Unit (Numeric) Generic Edit [15]
			,CB1.SHCCTY -- Commission Code Type (Character) UDC (H42 CC) [1]
			
		UNION ALL

		SELECT

			 CB2.SHDOCO -- Document (Order No Invoice etc.) (Numeric) Generic Edit [8]
			,CB2.SHDCTO -- Order Type (String) UDC (00 DT) [2]
			,CB2.SHKCOO -- Order Company (Order Number) (String) Generic Edit [5]
			,CB2.REP2_NEW_ID SHSLSM -- Salesperson 01 (Numeric) Generic Edit [8]
			,CASE WHEN SUM(CB2.TOTAL_AMT_SHIPPED) > 0 AND SUM(CB2.LINE_SHARE) > 0
				THEN CAST(CAST(SUM(CB2.LINE_SHARE) / SUM(CB2.TOTAL_AMT_SHIPPED) AS DECIMAL(5,3)) * 1000 AS INTEGER)
				ELSE 0
			 END	SHSLCM -- Salesperson Commission 001 (Numeric) Generic Edit [7]
			,CB2.SHFCA -- Flat Commission Amount (Numeric) Generic Edit [15]
			,CB2.SHAPUN -- Amount - Per Unit (Numeric) Generic Edit [15]
			,CB2.SHCCTY -- Commission Code Type (Character) UDC (H42 CC) [1]

		FROM _COM_BASE CB2

		WHERE CB2.REP2_OLD_ID IS NOT NULL

		GROUP BY

			 CB2.SHDOCO -- Document (Order No Invoice etc.) (Numeric) Generic Edit [8]
			,CB2.SHDCTO -- Order Type (String) UDC (00 DT) [2]
			,CB2.SHKCOO -- Order Company (Order Number) (String) Generic Edit [5]
			,CB2.REP2_NEW_ID -- Salesperson 01 (Numeric) Generic Edit [8]
			,CB2.SHFCA -- Flat Commission Amount (Numeric) Generic Edit [15]
			,CB2.SHAPUN -- Amount - Per Unit (Numeric) Generic Edit [15]
			,CB2.SHCCTY -- Commission Code Type (Character) UDC (H42 CC) [1]
	) COM_BASE
ORDER BY COM_BASE.SHDOCO