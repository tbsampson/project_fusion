SELECT 
  
     ANDY.JDE_VENDOR IVAN8 -- Address Number [Generic Edit] Numeric (8)
    ,'VN'   IVXRT -- Type - Cross-Reference Type Code [UDC (41 DT)] String (2)
    ,ANDY.JDE_PART  IVITM -- Item Number - Short [Generic Edit] Numeric (8)
    ,'140365'  IVEXDJ -- Date - Expired [Generic Edit] Date (6)
    ,'119121'   IVEFTJ -- Date - Effective [Generic Edit] Date (6)
    ,''   IVMCU -- Business Unit [Generic Edit] String (12)
    ,ANDY.VENDOR_PART_ID   IVCITM -- Item Number - Customer/Supplier [Generic Edit] String (25)
    ,F4101.IMDSC1   IVDSC1 -- Description [Generic Edit] String (30)
    ,''   IVDSC2 -- Description - Line 2 [Generic Edit] String (30)
    
    ,SUBSTR(
       REPLACE(
         REPLACE(
          REPLACE(
           REPLACE(
            REPLACE(
              REPLACE(
                REPLACE(
                  REPLACE(
                    REPLACE(
                      REPLACE(
                        REPLACE(
                          REPLACE(
                            REPLACE(
                              REPLACE(
                                F4101.IMDSC1,
                              ' ', ''),
                            ',', ''),
                          '-', ''),
                        '/', ''),
                      '(', ''),
                    ')', ''),
                  '+', ''),
                '.', ''),
              '#', ''),
            '%', ''),
           '''', ''),
          '*', ''),
         '&', ''),
        '"', '')
      ,1,30)  IVALN -- Search Text - Compressed [Generic Edit] String (30)
      
    ,F4101.IMLITM   IVLITM -- 2nd Item Number [Generic Edit] String (25)
    ,F4101.IMAITM   IVAITM -- 3rd Item Number [Generic Edit] String (25)
    ,''   IVURCD -- User Reserved Code [Generic Edit] String (2)
    ,''   IVURDT -- User Reserved Date [Generic Edit] Date (6)
    ,''   IVURAT -- User Reserved Amount [Generic Edit] Numeric (15)
    ,''   IVURAB -- User Reserved Number [Generic Edit] Numeric (8)
    ,''   IVURRF -- User Reserved Reference [Generic Edit] String (15)
    ,'TSAMPSON'   IVUSER -- User ID [Generic Edit] String (10)
    ,'SQL'   IVPID -- Program ID [Generic Edit] String (10)
    ,''   IVJOBN -- Work Station ID [Generic Edit] String (10)
    ,119289   IVUPMJ -- Date - Updated [Generic Edit] Date (6)
    ,''   IVTDAY -- Time of Day [Generic Edit] Numeric (6)
    ,''   IVRATO -- Substitute Ratio [Generic Edit] Numeric (15)
    ,''   IVAPSP -- Substitute Priority [Generic Edit] Numeric (15)
    ,''   IVIDEM -- Transfer Demand [Generic Edit] Character (1)
    ,'Y'   IVAPSS -- APS Substitute [Generic Edit] Character (1)
    ,'                    '   IVCIRV -- Item Revision Level - Customer/Supplier [Generic Edit] String (20)
    ,''   IVADIND -- Adjustment Indicator [UDC (42 IA)] Character (1)
    ,''   IVBPIND -- Base Price Indicator [UDC (42 IP)] Character (1)
    ,''   IVCARDNO -- Card Number [UDC (40R CD)] String (4)      

FROM TSAMPSON.ANDYUPDATE ANDY

LEFT JOIN PRODDTA.F4104 F4104
ON andy.jde_part = F4104.IVITM
AND andy.jde_vendor = F4104.IVAN8
AND F4104.IVXRT = 'VN'

JOIN PRODDTA.F4101 F4101
ON andy.jde_part = F4101.IMITM

join PRODDTA.F0101 AB
ON ANDY.JDE_VENDOR = AB.ABAN8

WHERE F4104.IVITM IS NULL

