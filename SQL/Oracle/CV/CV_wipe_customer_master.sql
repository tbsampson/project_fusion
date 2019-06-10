/*
    CV Customer Master Preparations
    -- BV R03010Z
*/

-- Check zFile
SELECT COUNT(*)
FROM CVDTA.F03012Z1;

/* -- Clear zFile
DELETE CVDTA.F03012Z1;
COMMIT;
*/

/* -- Clear E1 tables
DELETE CVDTA.F03012
WHERE AIAN8 BETWEEN BETWEEN 72000 and 98999;
COMMIT;
*/
