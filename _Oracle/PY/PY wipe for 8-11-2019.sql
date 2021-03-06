/*
    PY wipe for Project Fusion, Balco
    IR20190809 Tom Sampson
    VER0001
*/

-- //////////////////////////////////////// Filtered Purges ////////////////////////////////////////
-- ------------------------------------------ Address Book ------------------------------------------ 
DELETE FROM CRPDTA.F0101Z2; -- zFile
COMMIT;

DELETE FROM CRPDTA.F0101 -- address book
WHERE ABAN8 BETWEEN 72000 AND 98999 OR ABAN8 > 100000;
COMMIT;

DELETE FROM CRPDTA.F0116 -- address
WHERE ALAN8 BETWEEN 72000 AND 98999 OR ALAN8 > 100000;
COMMIT;

DELETE FROM CRPDTA.F0115 -- phone number
WHERE WPAN8 BETWEEN 72000 AND 98999 OR WPAN8 > 100000;
COMMIT;

DELETE FROM CRPDTA.F01151 -- email addresses
WHERE EAAN8 BETWEEN 72000 AND 98999 OR EAAN8 > 100000;
COMMIT;

DELETE FROM CRPDTA.F0111 -- contacts
WHERE WWAN8 BETWEEN 72000 AND 98999 OR WWAN8 > 100000;
COMMIT;

DELETE FROM CRPDTA.F0401 -- vendor records
WHERE A6AN8 BETWEEN 72000 AND 98999 OR A6AN8 > 100000;
COMMIT;

-- //////////////////////////////////////// Unfiltered Purges //////////////////////////////////////// 
-- ------------------------------------------ Customer Master ------------------------------------------ 
DELETE FROM CRPDTA.F03012Z1; -- zFile
COMMIT;

DELETE FROM CRPDTA.F03012 -- Customer Master
WHERE AIAN8 BETWEEN 72000 AND 98999 OR AIAN8 > 100000;
COMMIT;

-- ------------------------------------------ Location ------------------------------------------
DELETE FROM CRPDTA.F4100; -- Location
COMMIT;

DELETE FROM CRPDTA.F43091; -- Receipt routing
COMMIT;

-- ------------------------------------------ Item Master ------------------------------------------ 
DELETE FROM CRPDTA.F4101Z1; --zFile
COMMIT;

DELETE FROM CRPDTA.F4101; -- Item Master
COMMIT;

DELETE FROM CRPDTA.F4102; -- Item Branch Plant
COMMIT;

DELETE FROM CRPDTA.F4104; -- Item Cross Reference
COMMIT;

DELETE CRPDTA.F4105Z1; -- Item Cost zFile
COMMIT;

DELETE FROM CRPDTA.F4105; -- Item Cost
COMMIT;

DELETE FROM CRPDTA.F41002; -- UOM Conversion
COMMIT;

DELETE FROM CRPDTA.F41021; -- Item Location
COMMIT;

DELETE FROM CRPDTA.F4108; -- Lot Master
COMMIT;

DELETE FROM CRPDTA.F3002Z1; -- Bill of Materials zFile
COMMIT;

DELETE FROM CRPDTA.F3002; -- Bill of Materials
COMMIT;

DELETE FROM CRPDTA.F3003; -- Inventory OP Base aka Routing (Steve)
COMMIT;

DELETE FROM CRPDTA.F3003Z1; -- Routing zFile
COMMIT;

DELETE FROM CRPDTA.F4141Z1; -- Cycle Count zFile
COMMIT;

DELETE FROM CRPDTA.F4140; -- Cycle Count Header (Inventory Management)
COMMIT;

DELETE FROM CRPDTA.F4141; -- Cycle Count (Inventory Management)
COMMIT;

DELETE FROM CRPDTA.F30026; -- Inventory OP Base (Tim)
COMMIT;

DELETE FROM CRPDTA.F4111; -- Item Ledger
COMMIT;

-- ------------------------------------------ Sales Order ------------------------------------------ 
DELETE FROM CRPDTA.F4201; -- Sales Order Header (Ron)
COMMIT;

DELETE FROM CRPDTA.F4211; -- Sales Order Detail (Ron)
COMMIT;

DELETE FROM CRPDTA.F4209; -- Held Orders (Tim) 
COMMIT;

DELETE FROM CRPDTA.F42019; -- S.O. History Header (Tim/Ron)4
COMMIT;

DELETE FROM CRPDTA.F42119; -- S.O. History Detail (Tim/Ron)
COMMIT;

DELETE FROM CRPDTA.F42199; -- Sales Order  Detail Ledger File (Ron)
COMMIT;

DELETE FROM CRPDTA.F3460; -- Forecast File (Tim) 
COMMIT;

DELETE FROM CRPDTA.F42150; -- SO Commission (Ron) 
COMMIT;

DELETE FROM CRPDTA.F49211; -- SO Tag (Ron) 
COMMIT;

DELETE FROM CRPDTA.F49219; -- SO Detail Tag (Ron) 
COMMIT;

DELETE FROM CRPDTA.F42420; -- Audit transition (Ron) 
COMMIT;

DELETE FROM CRPDTA.F42160; -- SO Detail commission (Ron) 
COMMIT;

DELETE FROM CRPDTA.F4229; -- Sales Summary History File (Ron)
COMMIT;

DELETE FROM CRPDTA.F00165; -- Media Object
COMMIT;

DELETE FROM CRPDTA.F00166; -- Media Object
COMMIT;


-- ------------------------------------------ Work Order Tables ------------------------------------------ 
DELETE FROM CRPDTA.F4801; -- WO Master
COMMIT;

DELETE FROM CRPDTA.F3111; -- Part List
COMMIT;

DELETE FROM CRPDTA.F3112; -- Routing
COMMIT;

DELETE FROM CRPDTA.F3102; -- Cost File
COMMIT;

DELETE FROM CRPDTA.F31122; -- Work Order Transaction File
COMMIT;


-- ------------------------------------------ Purchasing ------------------------------------------ 
DELETE FROM CRPDTA.F4301; -- P.O. Header File (Tim) 
COMMIT;

DELETE FROM CRPDTA.F4311; -- P.O. Detail File (Tim) 
COMMIT;

DELETE FROM CRPDTA.F43199; -- P.O. Detail Ledger File; -- Flexible Version (Tim)
COMMIT;

DELETE FROM CRPDTA.F43092; -- Purchase Order Receipt Routing File (Tim)
COMMIT;

DELETE FROM CRPDTA.F43121; -- Purchase Order Receiver File (Tim)
COMMIT;


-- ------------------------------------------ Quality Test Results ------------------------------------------ 
DELETE FROM CRPDTA.F3711; -- Quality Test Results
COMMIT;

DELETE FROM CRPDTA.F40318; -- Quality Reference
COMMIT;

DELETE FROM CRPDTA.F3703; -- non-conforming test
COMMIT;


-- ------------------------------------------ ECO ------------------------------------------ 
DELETE FROM CRPDTA.F3013; -- Parts list detail
COMMIT;

DELETE FROM CRPDTA.F3011; -- BOM Change File
COMMIT;

-- ------------------------------------------ Compliance ------------------------------------------ 
DELETE FROM CRPDTA.F5542TAG; -- SO tracking
COMMIT;

DELETE FROM CRPDTA.F5541TAG; -- Compliance labels
COMMIT;

-- ------------------------------------------ Open AR Balance ------------------------------------------ 
DELETE FROM CRPDTA.F03B11Z1; -- AR/GL zFile
COMMIT;

DELETE FROM CRPDTA.F03B11 WHERE GLDCT = 'XI' OR GLDCT = 'XM'; -- Open AR Balance
COMMIT;

DELETE FROM CRPDTA.F0911 WHERE GLDCT = 'XI' OR GLDCT = 'XM';
COMMIT;

DELETE FROM CRPDTA.F0902 WHERE RPDCT = 'XI' OR RPDCT = 'XM';
COMMIT;

-- //////////////////////////////////////// EOF ////////////////////////////////////////