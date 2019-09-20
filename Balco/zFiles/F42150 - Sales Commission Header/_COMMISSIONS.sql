/*
-- build _REPS.txt
SELECT
     F0101.ABALKY 
    ,F0101.ABAN8
    
FROM CRPDTA.F0101 F0101

WHERE F0101.ABAT1 = 'RE'
AND SUBSTR(F0101.ABALKY,1,3) = 'BC_';

this is a view _COMMISSIONS
can use _COM_BASE to find NULL reps
*/

SELECT

	 SHDOCO -- Document (Order No Invoice etc.) (Numeric) Generic Edit [8]
	,SHDCTO -- Order Type (String) UDC (00 DT) [2]
	,SHKCOO -- Order Company (Order Number) (String) Generic Edit [5]
    ,ROW_NUMBER() OVER(ORDER BY	 SHKCOO,SHSLSM)   
	 SHCMLN -- Commission LineNumber (Numeric) Generic Edit [15]	
	,SHSLSM -- Salesperson 01 (Numeric) Generic Edit [8]
	,SHSLCM -- Salesperson Commission 001 (Numeric) Generic Edit [7]
	,SHFCA -- Flat Commission Amount (Numeric) Generic Edit [15]
	,SHAPUN -- Amount - Per Unit (Numeric) Generic Edit [15]
	,SHCCTY -- Commission Code Type (Character) UDC (H42 CC) [1]

FROM
	(
		SELECT -- REP1 commissions
			 SHDOCO
			,SHDCTO
			,SHKCOO
			--,SHCMLN
			,SHSLSM
			,SHSLCM
			,SHFCA
			,SHAPUN
			,SHCCTY
			
		FROM _COM_BASE

		UNION ALL

		SELECT  -- REP2 commissions

			 SHDOCO
			,SHDCTO
			,SHKCOO
			--,SHCMLN
			,REP2_NEW_ID SHSLSM
			,CAST((ISNULL(LINE_COM,0) * ISNULL(SHARE_COM,0)) * 1000 AS INTEGER) SHSLCM
			,SHFCA
			,SHAPUN
			,SHCCTY
			
		FROM _COM_BASE

		WHERE  REP2_OLD_ID IS NOT NULL
	) COMMISSIONS
