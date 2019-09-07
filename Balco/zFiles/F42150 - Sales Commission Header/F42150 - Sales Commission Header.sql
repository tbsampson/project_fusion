use BALCO;

SELECT

 OREF.NEW_ID   SHDOCO -- Document (Order No Invoice etc.) (Numeric) Generic Edit [8]
,'SO'   SHDCTO -- Order Type (String) UDC (00 DT) [2]
,'00020'   SHKCOO -- Order Company (Order Number) (String) Generic Edit [5]
,ROW_NUMBER() OVER(ORDER BY	COR.CUST_ORDER_ID,COR.LINE_NO, COR.SALESREP_ID)   SHCMLN -- Commission LineNumber (Numeric) Generic Edit [15]
,'BC_' + COR.SALESREP_ID   SHSLSM -- Salesperson 01 (Numeric) Generic Edit [8]
,CAST(SUM(COR.Expr2) * 1000 AS INTEGER)   SHSLCM -- Salesperson Commission 001 (Numeric) Generic Edit [7]
,''   SHFCA -- Flat Commission Amount (Numeric) Generic Edit [15]
,''   SHAPUN -- Amount - Per Unit (Numeric) Generic Edit [15]
,'I'   SHCCTY -- Commission Code Type (Character) UDC (H42 CC) [1]

FROM Customer_Orders_Rep COR

JOIN CUST_ORDER_LINE COL

ON COR.CUST_ORDER_ID = COL.CUST_ORDER_ID
AND COR.LINE_NO = COL.LINE_NO


JOIN _ORDER_REF OREF
	ON COR.CUST_ORDER_ID = OREF.OLD_ID
	
WHERE COL.COMMISSION_PCT > 0

GROUP BY

	 COR.CUST_ORDER_ID
	,OREF.NEW_ID
	,COR.SALESREP_ID
	,COR.LINE_NO
	,COR.CUSTOMER_ID
	,COL.COMMISSION_PCT
	,COL.ORDER_QTY
	,COL.TOTAL_AMT_ORDERED
	
ORDER BY
		 COR.CUST_ORDER_ID
		 ,COR.LINE_NO


/*
-- build _REPS.txt
SELECT
     F0101.ABALKY 
    ,F0101.ABAN8
    
FROM CRPDTA.F0101 F0101

WHERE F0101.ABAT1 = 'RE'
AND SUBSTR(F0101.ABALKY,1,3) = 'BC_';


*/