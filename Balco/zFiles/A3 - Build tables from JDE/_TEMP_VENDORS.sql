SELECT
	 ABAN8 "ID1"
	,ABALKY "ID2"
	,ABALPH "DESC"

FROM CVDTA.F0101

WHERE ABAT1 = 'V' AND SUBSTR(ABALKY,1,3) = 'BC_';