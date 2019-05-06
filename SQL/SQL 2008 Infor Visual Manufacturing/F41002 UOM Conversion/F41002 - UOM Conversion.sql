/*
    F41002 - UOM Conversion.sql
    Tom Sampson
    IR 20190501
*/SELECT

 '       20001'   UMMCU --Business Unit String(12)
,CAST(PART.ROWID + 50000 AS INTEGER)   UMITM --Item Number - Short Numeric(8)
,PART_UNITS_CONV.FROM_UM   UMUM --Unit of Measure String(2)
,PART_UNITS_CONV.TO_UM   UMRUM --Related Unit of Measure String(2)
,''   UMUSTR --Unit of Measure Structure Character(1)
,PART_UNITS_CONV.CONVERSION_FACTOR * 10000000   UMCONV --Conversion Factor Numeric(15)
,''   UMCNV1 --Conversion Factor - Secondary to Primary Numeric(15)
,'TSAMPSON'   UMUSER --User ID String(10)
,'F41002'   UMPID --Program ID String(10)
,''   UMJOBN --Work Station ID String(10)
,(DATEPART(year, GETDATE())-1900)*1000 + DATEPART(dayofyear, GETDATE())   UMUPMJ --Date - Updated Date(6)
,''   UMTDAY --Time of Day Numeric(6)
,''   UMEXPO --Exclude from PO Character(1)
,''   UMEXSO --Exclude from SO Character(1)
,''   UMPUPC --Code Purchase Price Code Integer(11)
,''   UMSEPC --Code Sales Price Code Integer(11)

FROM PART_UNITS_CONV PART_UNITS_CONV

JOIN PART PART
	ON PART_UNITS_CONV.PART_ID = PART.ID

JOIN _ITEM_MASTER_SIDE _ITEM_MASTER_SIDE
	ON _ITEM_MASTER_SIDE.NEW_ID = CAST(PART.ROWID + 50000 AS INTEGER)