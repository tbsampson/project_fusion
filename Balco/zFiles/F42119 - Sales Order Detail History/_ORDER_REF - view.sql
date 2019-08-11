SELECT     ROW_NUMBER() OVER (ORDER BY A.OLD_ID) + 1000 NEW_ID, A.BILLTO_ID, A.BILLTO_REF, A.OLD_ID, A.SHIP_TO_ADDR_NO, A.SHIPTO_ID, A.SHIPTO_REF, 
A.STATUS
FROM         (SELECT DISTINCT 
                                              CO.ID OLD_ID, BTST.BILLTO_REF, BTST.BILLTO_ID, BTST2.SZALKY AS SHIPTO_REF, BTST2.SZAN8 AS SHIPTO_ID, CO.SHIP_TO_ADDR_NO, 
                                              CO.STATUS
                       FROM          _BT_ST_TABLE BTST JOIN
                                              CUSTOMER_ORDER CO ON CO.CUSTOMER_ID = BTST.BILLTO_REF JOIN
                                              _BT_ST_TABLE BTST2 ON 'BC_' + CO.CUSTOMER_ID + '_' + CAST(CO.SHIP_TO_ADDR_NO AS NVARCHAR) = BTST2.SZALKY
                       WHERE      CO.ORDER_DATE IS NOT NULL) A