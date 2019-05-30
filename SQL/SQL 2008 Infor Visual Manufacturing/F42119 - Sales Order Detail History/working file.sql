SELECT DISTINCT
/*
	 WORK_ORDER.BASE_ID WORKORDER
	,ORDER_REF.NEW_ID NEW_ORDER_ID
	,ORDER_REF.OLD_ID OLD_ORDER_ID
	,CUST_ORDER_LINE.LINE_NO ORDER_LINE_NO
*/
	CUST_ORDER_LINE.PART_ID OLD_PART_ID
/*
	,ITEM_MASTER_1.SZAITM
	,WORK_ORDER.ACT_MATERIAL_COST
	,WORK_ORDER.DESIRED_QTY
	,CASE
		WHEN WORK_ORDER.ACT_MATERIAL_COST = 0
			OR WORK_ORDER.DESIRED_QTY = 0 
		THEN 0
		ELSE ((WORK_ORDER.ACT_MATERIAL_COST/WORK_ORDER.DESIRED_QTY) * 1.7)
	 END CALCULATED_COST_PER_UNIT
--	,((WORK_ORDER.ACT_MATERIAL_COST/ISNULL(WORK_ORDER.DESIRED_QTY,1)) * 1.7) CALCULATED_COST
*/
FROM   DEMAND_SUPPLY_LINK DEMAND_SUPPLY_LINK

JOIN WORK_ORDER WORK_ORDER 
	ON DEMAND_SUPPLY_LINK.SUPPLY_BASE_ID = WORK_ORDER.BASE_ID 
	AND DEMAND_SUPPLY_LINK.SUPPLY_LOT_ID = WORK_ORDER.LOT_ID 
	AND DEMAND_SUPPLY_LINK.SUPPLY_SPLIT_ID = WORK_ORDER.SPLIT_ID 
	AND DEMAND_SUPPLY_LINK.SUPPLY_SUB_ID = WORK_ORDER.SUB_ID 
JOIN _ORDER_REF_TABLE ORDER_REF
	ON DEMAND_SUPPLY_LINK.DEMAND_BASE_ID = ORDER_REF.OLD_ID

JOIN CUST_ORDER_LINE CUST_ORDER_LINE
	ON ORDER_REF.OLD_ID = CUST_ORDER_LINE.CUST_ORDER_ID
	AND CUST_ORDER_LINE.LINE_NO = DEMAND_SUPPLY_LINK.DEMAND_SEQ_NO

JOIN _ADDRESS_BOOK_TABLE ADDRESS_BOOK
    ON CAST(ORDER_REF.SHIPTO_ID AS BIGINT) = CAST(ADDRESS_BOOK.SZAN8 AS BIGINT)	

JOIN RECEIVABLE_LINE RECEIVABLE_LINE
    ON RECEIVABLE_LINE.CUST_ORDER_ID = CUST_ORDER_LINE.CUST_ORDER_ID
    AND RECEIVABLE_LINE.CUST_ORDER_LINE_NO = CUST_ORDER_LINE.LINE_NO

JOIN RECEIVABLE RECEIVABLE
    ON RECEIVABLE.INVOICE_ID = RECEIVABLE_LINE.INVOICE_ID
    
LEFT JOIN _ITEM_MASTER_1_TABLE ITEM_MASTER_1
    ON CUST_ORDER_LINE.PART_ID = LTRIM(RTRIM(ITEM_MASTER_1.SZAITM))  

JOIN PART PART
    ON PART.ID = CUST_ORDER_LINE.PART_ID    
    
WHERE ITEM_MASTER_1.SZAITM IS NULL

/*
ORDER BY

	 ORDER_REF.NEW_ID
	,CUST_ORDER_LINE.LINE_NO
*/


/*
"SELECT WORK_ORDER.BASE_ID FROM DEMAND_SUPPLY_LINK DSL
INNER JOIN WORK_ORDER WO
ON DEMAND_SUPPLY_LINK.SUPPLY_BASE_ID = WORK_ORDER.BASE_ID AND DEMAND_SUPPLY_LINK.SUPPLY_LOT_ID = WORK_ORDER.LOT_ID
AND DEMAND_SUPPLY_LINK.SUPPLY_SPLIT_ID = WORK_ORDER.SPLIT_ID AND DEMAND_SUPPLY_LINK.SUPPLY_SUB_ID = WORK_ORDER.SUB_ID
WHERE DEMAND_SUPPLY_LINK.DEMAND_BASE_ID = CUST_ORDER_ID  AND DEMAND_SUPPLY_LINK.DEMAND_SEQ_NO  = LINE_NO "
*/
