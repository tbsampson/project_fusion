SELECT DISTINCT

                 ITEMASA.ITNBR "ID"
                ,CAST(TRIM(ITEMASA.ITDSC) AS VARCHAR(30)) "Description"
                ,CASE 
                    WHEN ITEMASA.ITTYP = 'F' THEN 'Feature'
                    WHEN ITEMASA.ITTYP = 'K' THEN 'Kit'
                    WHEN ITEMASA.ITTYP = '0' THEN 'Phantom'
                    WHEN ITEMASA.ITTYP = '1' THEN 'Assy/Sub'
                    WHEN ITEMASA.ITTYP = '2' THEN 'Fabric.'
                    WHEN ITEMASA.ITTYP = '3' THEN 'Raw Mat'
                    WHEN ITEMASA.ITTYP = '4' THEN 'Purchased'
                    WHEN ITEMASA.ITTYP = '9' THEN 'User Opt'
                    ELSE 'Other'
                  END 	"Type"                  
                ,IFNULL(ITEMASC.CMDTY,'') "CC"                   
                ,IFNULL(PROTYP.TYPDES,'') "Status"
                ,MBB2CPP.B2C8CD          "CQ" -- Unit of measure class                
                ,DECIMAL(ITEMASA.WEGHT,8,2) "lbs"
                ,CASE 
                    WHEN INTEGER(ITEMASA.UUD1IM) <= 99999
                    THEN INTEGER(LEFT(INTEGER(ITEMASA.UUD1IM),1))
                    WHEN INTEGER(ITEMASA.UUD1IM) > 99999
                    THEN INTEGER(LEFT(INTEGER(ITEMASA.UUD1IM),2))
                 END "L"
                ,INTEGER(LEFT(RIGHT(INTEGER(ITEMASA.UUD1IM),4),2))  "W"
                ,INTEGER(RIGHT(INTEGER(ITEMASA.UUD1IM),2))  "H"           
                ,ITEMASA.ITCLS 	"Cls"
                ,MBB0REP.B0GTTX "Class Desc"
                ,MBB2CPP.B2ADSB "Grp" --"Sales Group"
                ,IFNULL(MBJCREP.JCADSC,'')           "Group Desc"
                ,IFNULL(MBJCREP.JCADR0,'')           "Fam"
          		,IFNULL(MBJBREP.JBADSA,'')           "Family Desc"
                ,MBB2CPP.B2COCD         "Origin" -- Country code
                ,ITEMASA.UVOCIM "DC" -- delete code
                ,MBB2CPP.B2OEMN       "UPC" -- OEM Number
                ,ITEMASA.UVHCIM "HTS"
                ,ITEMASA.UU40IM "2of5"

FROM AMFLIB.ITEMASA ITEMASA

LEFT JOIN AMFLIB.MBB0REP MBB0REP -- Item Class Ref
                ON ITEMASA.ITCLS = MBB0REP.B0GLCD -- Item Class ID  

LEFT JOIN AMFLIB.MBB2CPP MBB2CPP -- Unit of measure ref
                ON CHAR(ITEMASA.ITNBR) = CHAR(MBB2CPP.B2AITX)
                                
LEFT JOIN AMFLIB.ITEMBL ITEMBL -- Item Master Detail
                ON ITEMASA.ITNBR = ITEMBL.ITNBR -- Product ID

LEFT JOIN AMFLIB.ITEMASC ITEMASC -- Item Master C (to get Commodity Class)
                ON ITEMASA.ITNBR = ITEMASC.ITNBR
                
LEFT JOIN RSF.PROTYP PROTYP
                ON ITEMASA.UVOCIM = PROTYP.OBSITM             
           
LEFT JOIN AMFLIB.MBJCREP MBJCREP
                ON MBB2CPP.B2ADSB = MBJCREP.JCADSB


-- Sales Family to Group/Family Ref
LEFT JOIN AMFLIB.MBJBREP MBJBREP
                ON MBJCREP.JCADR0 = MBJBREP.JBADR0 -- Item sales family code

/*
WHERE LEFT(ITEMASA.ITCLS,2) <> 'SP' -- no samples
	AND ITEMASA.ITCLS <> 'NONI' -- no non-inventory items
*/

/*
WHERE PROTYP.TYPDES <> 'Discontinued'
                AND PROTYP.TYPDES IS NOT NULL
                AND LEFT(ITEMASA.ITCLS,2) <> 'SP' -- no samples
                AND ITEMASA.ITTYP <> 3 -- no raw mats
                AND ITEMASA.ITNBR >= '0'
                AND MBB2CPP.B2ADSB IS NOT NULL AND MBB2CPP.B2ADSB <> '' -- has a buying group
*/
ORDER BY ITEMASA.ITNBR