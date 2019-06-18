/*
    F41002 - UOM Conversion.sql
    Tom Sampson
    IR 20190501
*/


SELECT
 '            '                                                 UMMCU --Business Unit String(12)
-- ,PART.ID
,CAST(IM1.SZITM AS INTEGER)									    UMITM --Item Number - Short Numeric(8)
,CASE
    WHEN PART_UNITS_CONV.FROM_UM = 'BG' THEN 'BC'
    WHEN PART_UNITS_CONV.FROM_UM = 'GL' THEN 'GA'
    WHEN PART_UNITS_CONV.FROM_UM = 'GRAMS' THEN 'GM'
    WHEN PART_UNITS_CONV.FROM_UM = 'M' THEN 'MT'
    ELSE PART_UNITS_CONV.FROM_UM
 END                                                            UMUM --Unit of Measure String(2)
,CASE
    WHEN PART_UNITS_CONV.TO_UM = 'BG' THEN 'BC'
    WHEN PART_UNITS_CONV.TO_UM = 'GL' THEN 'GA'
    WHEN PART_UNITS_CONV.TO_UM = 'GRAMS' THEN 'GM'
    WHEN PART_UNITS_CONV.TO_UM = 'M' THEN 'MT'
    ELSE PART_UNITS_CONV.TO_UM
 END                                                            UMRUM --Related Unit of Measure String(2)
,''                                                             UMUSTR --Unit of Measure Structure Character(1)
,CAST(PART_UNITS_CONV.CONVERSION_FACTOR * 100000000 AS BIGINT)   UMCONV --Conversion Factor Numeric(15)
,'100000000'                                                             UMCNV1 --Conversion Factor - Secondary to Primary Numeric(15)
,'TSAMPSON'                                                     UMUSER --User ID String(10)
,'F41002'                                                       UMPID --Program ID String(10)
,''                                                             UMJOBN --Work Station ID String(10)
,dbo.JDEJulian(GETDATE())                                       UMUPMJ --Date - Updated Date(6)
,''                                                             UMTDAY --Time of Day Numeric(6)
,''                                                             UMEXPO --Exclude from PO Character(1)
,''                                                             UMEXSO --Exclude from SO Character(1)
,''                                                             UMPUPC --Code Purchase Price Code Integer(11)
,''                                                             UMSEPC --Code Sales Price Code Integer(11)

FROM PART PART

JOIN _ITEM_MASTER_1_TABLE IM1
	ON IM1.SZAITM = PART.ID

JOIN _ITEM_MASTER_SIDE _ITEM_MASTER_SIDE
	ON LTRIM(RTRIM(_ITEM_MASTER_SIDE.SZAITM)) = LTRIM(RTRIM(PART.ID))

JOIN PART_UNITS_CONV PART_UNITS_CONV
	ON PART_UNITS_CONV.PART_ID = PART.ID
	AND PART.STOCK_UM = PART_UNITS_CONV.FROM_UM

WHERE PART.ABC_CODE <> 'Z'

ORDER BY PART.ID