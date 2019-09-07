/*
    PROD wipe for Project Fusion, Balco
    IR20190809 Tom Sampson
    VER0001
*/

-- //////////////////////////////////////// Filtered Purges ////////////////////////////////////////
-- ------------------------------------------ Address Book ------------------------------------------ 
DELETE FROM PRODDTA.F0101Z2; -- zFile
COMMIT;

DELETE FROM PRODDTA.F0101 -- address book
WHERE ABAN8 BETWEEN 72000 AND 98999 OR ABAN8 > 100000;
COMMIT;

DELETE FROM PRODDTA.F0116 -- address
WHERE ALAN8 BETWEEN 72000 AND 98999 OR ALAN8 > 100000;
COMMIT;

DELETE FROM PRODDTA.F0115 -- phone number
WHERE WPAN8 BETWEEN 72000 AND 98999 OR WPAN8 > 100000;
COMMIT;

DELETE FROM PRODDTA.F01151 -- email addresses
WHERE EAAN8 BETWEEN 72000 AND 98999 OR EAAN8 > 100000;
COMMIT;

DELETE FROM PRODDTA.F0111 -- contacts
WHERE WWAN8 BETWEEN 72000 AND 98999 OR WWAN8 > 100000;
COMMIT;

DELETE FROM PRODDTA.F0401 -- vendor records
WHERE A6AN8 BETWEEN 72000 AND 98999 OR A6AN8 > 100000;
COMMIT;

-- //////////////////////////////////////// Unfiltered Purges //////////////////////////////////////// 
-- ------------------------------------------ Customer Master ------------------------------------------ 
DELETE FROM PRODDTA.F03012Z1; -- zFile
COMMIT;

DELETE FROM PRODDTA.F03012 -- Customer Master
WHERE AIAN8 BETWEEN 72000 AND 98999 OR AIAN8 > 100000;
COMMIT;

-- ------------------------------------------ Location ------------------------------------------
-- DELETE FROM PRODDTA.F4100; -- Location
-- COMMIT;

-- DELETE FROM PRODDTA.F43091; -- Receipt routing
-- COMMIT;

-- ------------------------------------------ Item Master ------------------------------------------ 
DELETE FROM PRODDTA.F4101Z1; --zFile
COMMIT;

DELETE FROM PRODDTA.F4101; -- Item Master
COMMIT;

DELETE FROM PRODDTA.F4102; -- Item Branch Plant
COMMIT;

DELETE FROM PRODDTA.F4104; -- Item Cross Reference
COMMIT;

DELETE FROM PRODDTA.F4105Z1; -- Item Cost zFile
COMMIT;

DELETE FROM PRODDTA.F4105; -- Item Cost
COMMIT;

DELETE FROM PRODDTA.F41002; -- UOM Conversion
COMMIT;

DELETE FROM PRODDTA.F41021; -- Item Location
COMMIT;

DELETE FROM PRODDTA.F4108; -- Lot Master
COMMIT;

DELETE FROM PRODDTA.F3002Z1; -- Bill of Materials zFile
COMMIT;

DELETE FROM PRODDTA.F3002; -- Bill of Materials
COMMIT;

DELETE FROM PRODDTA.F3003; -- Inventory OP Base aka Routing (Steve)
COMMIT;

DELETE FROM PRODDTA.F3003Z1; -- Routing zFile
COMMIT;

DELETE FROM PRODDTA.F4141Z1; -- Cycle Count zFile
COMMIT;

DELETE FROM PRODDTA.F4140; -- Cycle Count Header (Inventory Management)
COMMIT;

DELETE FROM PRODDTA.F4141; -- Cycle Count (Inventory Management)
COMMIT;

DELETE FROM PRODDTA.F30026; -- Inventory OP Base (Tim)
COMMIT;

DELETE FROM PRODDTA.F4111; -- Item Ledger
COMMIT;

DELETE FROM PRODDTA.F43090; -- Suppliers for Tim
COMMIT;

-- ------------------------------------------ Sales Order ------------------------------------------ 
DELETE FROM PRODDTA.F4201; -- Sales Order Header (Ron)
COMMIT;

DELETE FROM PRODDTA.F4211; -- Sales Order Detail (Ron)
COMMIT;

DELETE FROM PRODDTA.F4209; -- Held Orders (Tim) 
COMMIT;

DELETE FROM PRODDTA.F42019; -- S.O. History Header (Tim/Ron)4
COMMIT;

DELETE FROM PRODDTA.F42119; -- S.O. History Detail (Tim/Ron)
COMMIT;

DELETE FROM PRODDTA.F42199; -- Sales Order  Detail Ledger File (Ron)
COMMIT;

DELETE FROM PRODDTA.F42150; -- SO Commission (Ron) 
COMMIT;

DELETE FROM PRODDTA.F49211; -- SO Tag (Ron) 
COMMIT;

DELETE FROM PRODDTA.F49219; -- SO Detail Tag (Ron) 
COMMIT;

DELETE FROM PRODDTA.F42420; -- Audit transition (Ron) 
COMMIT;

DELETE FROM PRODDTA.F42160; -- SO Detail commission (Ron) 
COMMIT;

DELETE FROM PRODDTA.F4229; -- Sales Summary History File (Ron)
COMMIT;

DELETE FROM PRODDTA.F00165; -- Media Object
COMMIT;

DELETE FROM PRODDTA.F00166; -- Media Object
COMMIT;


-- ------------------------------------------ Work Order Tables ------------------------------------------ 
DELETE FROM PRODDTA.F4801; -- WO Master
COMMIT;

DELETE FROM PRODDTA.F3111; -- Part List
COMMIT;

DELETE FROM PRODDTA.F3112; -- Routing
COMMIT;

DELETE FROM PRODDTA.F3102; -- Cost File
COMMIT;

DELETE FROM PRODDTA.F31122; -- Work Order Transaction File
COMMIT;


-- ------------------------------------------ Purchasing ------------------------------------------ 
DELETE FROM PRODDTA.F4301; -- P.O. Header File (Tim) 
COMMIT;

DELETE FROM PRODDTA.F4311; -- P.O. Detail File (Tim) 
COMMIT;

DELETE FROM PRODDTA.F43199; -- P.O. Detail Ledger File; -- Flexible Version (Tim)
COMMIT;

DELETE FROM PRODDTA.F43092; -- Purchase Order Receipt Routing File (Tim)
COMMIT;

DELETE FROM PRODDTA.F43121; -- Purchase Order Receiver File (Tim)
COMMIT;


-- ------------------------------------------ Quality Test Results ------------------------------------------ 
DELETE FROM PRODDTA.F3711; -- Quality Test Results
COMMIT;

DELETE FROM PRODDTA.F40318; -- Quality Reference
COMMIT;

DELETE FROM PRODDTA.F3703; -- non-conforming test
COMMIT;


-- ------------------------------------------ ECO ------------------------------------------ 
DELETE FROM PRODDTA.F3013; -- Parts list detail
COMMIT;

DELETE FROM PRODDTA.F3011; -- BOM Change File
COMMIT;

-- ------------------------------------------ Compliance ------------------------------------------ 
DELETE FROM PRODDTA.F5542TAG; -- SO tracking
COMMIT;

DELETE FROM PRODDTA.F5541TAG; -- Compliance labels
COMMIT;

-- ------------------------------------------ Open AR Balance ------------------------------------------ 
DELETE FROM PRODDTA.F03B11Z1; -- AR/GL zFile
COMMIT;

DELETE FROM PRODDTA.F03B11 WHERE RPDCT = 'XI' OR RPDCT = 'XM'; -- Open AR Balance
COMMIT;

DELETE FROM PRODDTA.F0911 WHERE GLDCT = 'XI' OR GLDCT = 'XM';
COMMIT;

DELETE FROM PRODDTA.F0902 WHERE GBDCT = 'XI' OR GBDCT = 'XM';
COMMIT;

SELECT * FROM PRODDTA.F03B11;
-- //////////////////////////////////////// EOF ////////////////////////////////////////