SELECT
     F0101.ABALKY 
    ,F0101.ABAN8
    
FROM CVDTA.F0101 F0101

WHERE F0101.ABAT1 = 'RE'
AND SUBSTR(F0101.ABALKY,1,3) = 'BC_';