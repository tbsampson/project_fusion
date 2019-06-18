SELECT Row_number() OVER (ORDER BY A.OLD_ID) 
       + 10000 NEW_ID 
       ,A.OLD_ID 
       ,A.BILLTO_REF 
       ,A.BILLTO_ID 
       ,A.SHIPTO_REF 
       ,A.SHIPTO_ID 
       ,A.SHIP_TO_ADDR_NO 

FROM   (SELECT DISTINCT 
        CO.ID AS OLD_ID 
       ,BTST.BILLTO_REF 
       ,BTST.BILLTO_ID 
       ,BTST2.SZALKY AS SHIPTO_REF 
       ,BTST2.SZAN8  AS SHIPTO_ID 
       ,CO.SHIP_TO_ADDR_NO 
        FROM   _BT_ST BTST 
               JOIN CUSTOMER_ORDER CO 
                 ON CO.CUSTOMER_ID = BTST.BILLTO_REF 
               JOIN _BT_ST BTST2 
                 ON 'BC_' + CO.CUSTOMER_ID + '_' 
                    + Cast(CO.SHIP_TO_ADDR_NO AS NVARCHAR) = BTST2.SZALKY 
        WHERE  CO.ORDER_DATE >= '2017/10/1') A 