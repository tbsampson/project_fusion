/*
    F03012Z1 Customer Master - backup and clear.sql
    Run this in oracle prior to loading zFile.
    -- BV R03010Z
*/
/*
    First create a backup
*/
-- Clear backup tables
DROP TABLE TSAMPSON.CVDTA_F03012		PURGE; 	-- address book
COMMIT;

-- Backup All CVDTA tables first
CREATE TABLE TSAMPSON.CVDTA_F03012	AS SELECT * FROM CVDTA.F03012; -- accounts receivable

-- Make a place for data we are about to import
DELETE FROM CVDTA.F03012 -- address book
WHERE AIAN8 BETWEEN 72000 and 98999;

-- clear zFile
DELETE CVDTA.F03012Z1
COMMIT;

-- EOF
