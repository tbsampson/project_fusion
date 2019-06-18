
/*
    F4101Z1 Item Master - backup and clear.sql
    Run this in oracle prior to loading zFile.
    BV R4101Z1I
*/
/*
    First create a backup
*/
-- Clear backup tables
DROP TABLE TSAMPSON.CVDTA_F4101	 PURGE; -- Item Master
DROP TABLE TSAMPSON.CVDTA_F4102	 PURGE; -- Item Branch Plant
DROP TABLE TSAMPSON.CVDTA_F4105	 PURGE; -- Item Cost
DROP TABLE TSAMPSON.CVDTA_F4141	 PURGE; -- Cycle Counts
DROP TABLE TSAMPSON.CVDTA_F41021 PURGE; -- Item Location
DROP TABLE TSAMPSON.CVDTA_F4111	 PURGE; -- Item Ledger

-- Backup All CVDTA tables first
CREATE TABLE TSAMPSON.CVDTA_F4101	AS SELECT * FROM CVDTA.F4101; -- Item Master
CREATE TABLE TSAMPSON.CVDTA_F4102 	AS SELECT * FROM CVDTA.F4102; -- Item Branch Plant
CREATE TABLE TSAMPSON.CVDTA_F4105 	AS SELECT * FROM CVDTA.F4105;-- Item Cost
CREATE TABLE TSAMPSON.CVDTA_F4141 	AS SELECT * FROM CVDTA.F4141; -- Cycle Counts
CREATE TABLE TSAMPSON.CVDTA_F41021 	AS SELECT * FROM CVDTA.F41021;-- Item Location
CREATE TABLE TSAMPSON.CVDTA_F4111 	AS SELECT * FROM CVDTA.F4111; -- Item Ledger

-- Make a place for data we are about to import
DELETE CVDTA.F4101 
WHERE IMITM BETWEEN 51000 AND 70000; -- Item Master

DELETE CVDTA.F4102
WHERE IBITM BETWEEN 51000 AND 70000; -- Item Branch Plant
 
DELETE CVDTA.F4105 
WHERE COITM BETWEEN 51000 AND 70000; -- Item Cost

DELETE CVDTA.F4141 
WHERE PJITM BETWEEN 51000 AND 70000; -- Cycle Counts

DELETE CVDTA.F41021
WHERE LIITM BETWEEN 51000 AND 70000; -- Item Location

DELETE CVDTA.F4111 
WHERE ILITM BETWEEN 51000 AND 70000; -- Item Ledger
COMMIT;

-- clear zFile
DELETE CVDTA.F4101Z1;
COMMIT;

-- EOF