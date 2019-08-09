/*
    CV wipe for Project Fusion, Balco
    IR20190809 Tom Sampson
    VER0001
*/

-- //////////////////////////////////////// Filtered Purges ////////////////////////////////////////
-- ------------------------------------------ Address Book ------------------------------------------ 
DELETE FROM CVDTA.F0101Z2; -- zFile
COMMIT;

DELETE FROM CVDTA.F0101 -- address book
WHERE ABAN8 BETWEEN 72000 and 98999;
COMMIT;

DELETE FROM CVDTA.F0116 -- address
WHERE ALAN8 BETWEEN 72000 and 98999;
COMMIT;

DELETE FROM CVDTA.F0115 -- phone number
WHERE WPAN8 BETWEEN 72000 and 98999;
COMMIT;

DELETE FROM CVDTA.F01151 -- email addresses
WHERE EAAN8 BETWEEN 72000 and 98999;
COMMIT;

DELETE FROM CVDTA.F0111 -- contacts
WHERE WWAN8 BETWEEN 72000 and 98999;
COMMIT;

-- //////////////////////////////////////// Unfiltered Purges //////////////////////////////////////// 
-- ------------------------------------------ Customer Master ------------------------------------------ 
DELETE FROM CVDTA.F03012Z1; -- zFile
COMMIT;

DELETE FROM CVDTA.F03012 -- Customer Master
WHERE AIAN8 BETWEEN 72000 and 98999;
COMMIT;

-- ------------------------------------------ Location ------------------------------------------
DELETE FROM CVDTA.F4100; -- Location
COMMIT;

DELETE FROM CVDTA.F43091; -- Receipt routing
COMMIT;

-- ------------------------------------------ Item Master ------------------------------------------ 
DELETE FROM CVDTA.F4101Z1; --zFile
COMMIT;

DELETE FROM CVDTA.F4101; -- Item Master
COMMIT;

DELETE FROM CVDTA.F4102; -- Item Branch Plant
COMMIT;

DELETE FROM CVDTA.F4104; -- Item Cross Reference
COMMIT;

DELETE CVDTA.F4105Z1; -- Item Cost zFile
COMMIT;

DELETE FROM CVDTA.F4105; -- Item Cost
COMMIT;

DELETE FROM CVDTA.F41002; -- UOM Conversion
COMMIT;

DELETE FROM CVDTA.F41021; -- Item Location
COMMIT;

DELETE FROM CVDTA.F4108; -- Lot Master
COMMIT;

DELETE FROM CVDTA.F3002Z1; -- Bill of Materials zFile
COMMIT;

DELETE FROM CVDTA.F3002; -- Bill of Materials
COMMIT;

DELETE FROM CVDTA.F3003; -- Inventory OP Base (Steve)
COMMIT;

DELETE FROM CVDTA.F3003Z1; -- Routing zFile
COMMIT;

DELETE FROM CVDTA.F4141Z1; -- Cycle Count zFile
COMMIT;

DELETE FROM CVDTA.F4141; -- Cycle Count (Inventory Management)
COMMIT;

DELETE FROM CVDTA.F30026; -- Inventory OP Base (Tim)
COMMIT;

DELETE FROM CVDTA.F4111; -- Item Ledger
COMMIT;

-- ------------------------------------------ Sales Order ------------------------------------------ 
DELETE FROM CVDTA.F4201; -- Sales Order Header (Ron)
COMMIT;

DELETE FROM CVDTA.F4211; -- Sales Order Detail (Ron)
COMMIT;

DELETE FROM CVDTA.F4209; -- Held Orders (Tim) 
COMMIT;

DELETE FROM CVDTA.F42019; -- S.O. History Header (Tim/Ron)4
COMMIT;

DELETE FROM CVDTA.F42119; -- S.O. History Detail (Tim/Ron)
COMMIT;

DELETE FROM CVDTA.F42199; -- Sales Order  Detail Ledger File (Ron)
COMMIT;

DELETE FROM CVDTA.F3460; -- Forecast File (Tim) 
COMMIT;

DELETE FROM CVDTA.F42150; -- SO Commission (Ron) 
COMMIT;

DELETE FROM CVDTA.F42911; -- SO Tag (Ron) 
COMMIT;

DELETE FROM CVDTA.F49219; -- SO Detail Tag (Ron) 
COMMIT;

DELETE FROM CVDTA.F42420; -- Audit transition (Ron) 
COMMIT;

DELETE FROM CVDTA.F42160; -- SO Detail commission (Ron) 
COMMIT;

DELETE FROM CVDTA.F4229; -- Sales Summary History File (Ron)
COMMIT;

DELETE FROM CVDTA.FF00165; -- Media Object
COMMIT;

DELETE FROM CVDTA.F00166; -- Media Object
COMMIT;


-- ------------------------------------------ Work Order Tables ------------------------------------------ 
DELETE FROM CVDTA.F4801; -- WO Master
COMMIT;

DELETE FROM CVDTA.F3111; -- Part List
COMMIT;

DELETE FROM CVDTA.F3112; -- Routing
COMMIT;

DELETE FROM CVDTA.F3102; -- Cost File
COMMIT;

DELETE FROM CVDTA.F31122; -- Work Order Transaction File
COMMIT;


-- ------------------------------------------ Purchasing ------------------------------------------ 
DELETE FROM CVDTA.F4301; -- P.O. Header File (Tim) 
COMMIT;

DELETE FROM CVDTA.F4311; -- P.O. Detail File (Tim) 
COMMIT;

DELETE FROM CVDTA.F43199; -- P.O. Detail Ledger File; -- Flexible Version (Tim)
COMMIT;

DELETE FROM CVDTA.F43092; -- Purchase Order Receipt Routing File (Tim)
COMMIT;

DELETE FROM CVDTA.F43121; -- Purchase Order Receiver File (Tim)
COMMIT;


-- ------------------------------------------ Quality Test Results ------------------------------------------ 
DELETE FROM CVDTA.F3711; -- Quality Test Results
COMMIT;

DELETE FROM CVDTA.F40318; -- Quality Reference
COMMIT;

DELETE FROM CVDTA.F3703; -- non-conforming test
COMMIT;


-- ------------------------------------------ ECO ------------------------------------------ 
DELETE FROM CVDTA.F3013; -- Parts list detail
COMMIT;

DELETE FROM CVDTA.F3011; -- BOM Change File
COMMIT;

-- ------------------------------------------ Compliance ------------------------------------------ 
DELETE FROM CVDTA.F5542TAG; -- SO tracking
COMMIT;

DELETE FROM CVDTA.F5541TAG; -- Compliance labels
COMMIT;


-- //////////////////////////////////////// EOF ////////////////////////////////////////