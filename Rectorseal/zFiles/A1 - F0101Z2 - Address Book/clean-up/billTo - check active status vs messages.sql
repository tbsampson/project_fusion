
SELECT DISTINCT

	 -- MBBWCPP.BWGGNB -- Invoice Number
	 MBBWCPP.BWCANB	"CUST_NO"-- Customer number
	,100000 + CAST(SUBSTR(TRIM(MBBWCPP.BWCANB), 1, LENGTH(TRIM(MBBWCPP.BWCANB)) - 2) AS INTEGER) JDE_ID
	,CUSMAS.ACREC	-- Customer status	 
	,CASE
		when replace(MBALREP.ALCNTX,'DO NOT USE','') <> MBALREP.ALCNTX 
			or replace(MBALREP.ALCNTX,'DO NO USE','') <> MBALREP.ALCNTX
			or replace(MBALREP.ALCNTX,'NO LONGER','') <> MBALREP.ALCNTX
			or replace(MBALREP.ALCNTX,'BRANCH','') <> MBALREP.ALCNTX
			or replace(MBALREP.ALCNTX,'OUT ','') <> MBALREP.ALCNTX
			or replace(MBALREP.ALCNTX,'(Moved','') <> MBALREP.ALCNTX
			or replace(MBALREP.ALCNTX,'Branch Closed','') <> MBALREP.ALCNTX
			or replace(MBALREP.ALCNTX,'MOVED','') <> MBALREP.ALCNTX
			or replace(MBALREP.ALCNTX,'Moved','') <> MBALREP.ALCNTX
			or replace(MBALREP.ALCNTX,'BUSINESS SOLD','') <> MBALREP.ALCNTX
			or replace(MBALREP.ALCNTX,'DO NOT SELL','') <> MBALREP.ALCNTX
			or replace(MBALREP.ALCNTX,'CHAPTER','') <> MBALREP.ALCNTX	
			or replace(MBALREP.ALCNTX,'CLOSED','') <> MBALREP.ALCNTX			
			or replace(MBALREP.ALCNTX,'CEASED','') <> MBALREP.ALCNTX				
			or replace(MBALREP.ALCNTX,'SOLD','') <> MBALREP.ALCNTX		
			or replace(MBALREP.ALCNTX,'CUST','') <> MBALREP.ALCNTX			
			or replace(MBALREP.ALCNTX,'Do Not Use','') <> MBALREP.ALCNTX		
			
				
				then '1'
		else ''
	 END DNU	
	,MBBWCPP.BWAQTX	-- Customer name
	,CUSCRSRF.GRPNO	-- GROUP# QS36F
	,CASE
		WHEN CUSCRSRF.GRPNO <> 0 THEN SUBSTR(CUSCRSRF.GRPNO ,2,5)
		ELSE ''
	 END MAIN_GROUP	
	,CASE
		WHEN CUSCRSRF.GRPNO <> 0 THEN SUBSTR(CUSCRSRF.GRPNO ,1,1)
		ELSE ''
	 END SUB_GROUP
	,IFNULL(GRPWSG.GRPNM,'') GROUP_NAME
	,CUSCRSRF.ENTGRP	-- ENTITY GROUP MAPICS
	,CUSCRSRF.MKT	-- MARKET QS36F
	,CUSCRSRF.TERR	-- TERRITORY QS36F
	,CUSCRSRF.SLSREP	-- SALES REP MAPICS
	,CUSCRSRF.CUSCLS	-- CUST. CLASS MAPICS
	-- ,CUSCRSRF.MKTANL	-- MARKET ANALYS MAPICS
	-- ,CUSCRSRF.TERTRY	-- TERRITORY MAPICS
	-- ,CUSCRSRF.MKTERR	-- MKTERR QS36F
	,CUSCRSRF.BYGRCD	-- BUYING GROUP CODE
	,CUSCRSRF.BYGRDS	-- GROUP DESCRIPTION
	,RTRIM(MBALREP.ALCLTX) ADDRLINE1
	,RTRIM(MBALREP.ALCMTX) ADDRLINE2
	,RTRIM(MBALREP.ALCNTX) ADDRLINE3
	,MBALREP.ALCQTX CONTACTNAME
	,MBALREP.ALCRTX PHONENUM
	,MBALREP.ALCOCD COUNTRYCODE
    ,COUNTRY_REF.A2
	,RTRIM(MBALREP.ALBYCD) STATE
	,RTRIM(MBALREP.ALCPTX) CITY
	,RTRIM(MBALREP.ALCVCD) POSTALCODE    
--	,MBALREP.ALE2ST ADDRTYPE
--	,MBALREP.ALCUCD ADDRCODE	
	
FROM AMFLIB.MBBWCPP MBBWCPP -- Historical customer order

JOIN AMFLIB.MBF9REP MBF9REP -- Invoice header
ON MBBWCPP.BWGGNB  =  MBF9REP.FEGGNB -- invoice number

JOIN AMFLIB.MBALREP MBALREP -- address table
     ON MBBWCPP.BWAENB = MBALREP.ALAENB -- Company Number
    AND MBBWCPP.BWCANB = MBALREP.ALCANB -- Customer Number

LEFT JOIN TOMQRY.COUNTRY_REF COUNTRY_REF -- country code a3 to a2 conversion
     ON MBALREP.ALCOCD = COUNTRY_REF.A3

JOIN AMFLIB.CUSMAS CUSMAS -- CUSTOMER MASTER
     ON MBBWCPP.BWAENB = CUSMAS.COMNO -- Company number
    AND MBBWCPP.BWCANB = CUSMAS.CUSNO -- Customer number

LEFT JOIN RSF.CUSCRSRF CUSCRSRF -- CUSTOMER CROSS REF
	 ON CUSMAS.CUSNO = CUSCRSRF.CUSNO8

LEFT JOIN QS36F.GRPWSG GRPWSG -- CUSTOMER GROUPS
	 ON CUSCRSRF.SGROUP = GRPWSG.GROUP


WHERE MBF9REP.FEGHNB > 1160101
AND MBALREP.ALE2ST = 1 -- Address type
AND MBALREP.ALCUCD = 1 -- Address code
AND MBF9REP.FEIZVA > 0 --	Total invoice amount


ORDER BY 
	 CASE
		WHEN CUSCRSRF.GRPNO <> 0 THEN SUBSTR(CUSCRSRF.GRPNO ,2,5)
		ELSE ''
	 END -- MAIN_GROUP	
	 ,CASE
		WHEN CUSCRSRF.GRPNO <> 0 THEN SUBSTR(CUSCRSRF.GRPNO ,1,1)
		ELSE ''
	 END -- SUB_GROUP
