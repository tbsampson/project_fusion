
-- //////////////////////////////////////// Filtered Purges ////////////////////////////////////////
-- ------------------------------------------ Address Book ------------------------------------------ 
DELETE CVDTA.F0101Z2; -- zFile
COMMIT;

DELETE FROM CVDTA.F0101 -- address book
WHERE ABAN8 BETWEEN 72000 and 98999;
COMMIT;

DELETE FROM CVDTA.F0111 -- contacts
WHERE WWAN8 BETWEEN 72000 and 98999;
COMMIT;

DELETE FROM CVDTA.F01112 -- Related Person
WHERE CPAN8 BETWEEN 72000 and 98999;
COMMIT;

DELETE FROM CVDTA.F0115 -- phone number
WHERE WPAN8 BETWEEN 72000 and 98999;
COMMIT;

DELETE FROM CVDTA.F01151 -- email addresses
WHERE EAAN8 BETWEEN 72000 and 98999;
COMMIT;

DELETE FROM CVDTA.F0116 -- address
WHERE ALAN8 BETWEEN 72000 and 98999;
COMMIT;

DELETE FROM CVDTA.F0150  -- Address Organization Structure
WHERE MAOSTP = ''   -- This prevents deleting hierarchies created during configuration for Sales Reps and other specific types 
AND MAPA8 BETWEEN 72000 AND 98999;
COMMIT;

DELETE FROM CVDTA.F01161 -- alternate address
WHERE WLAN8 BETWEEN 72000 and 98999; -- BETWEEN 72000 and 98999;
COMMIT;

DELETE FROM CVDTA.F0401 -- Vendor Master
WHERE A6AN8 BETWEEN 72000 and 98999; -- BETWEEN 72000 and 98999;
COMMIT;

-- ------------------------------------------ Customer Master ------------------------------------------ 
DELETE CVDTA.F03012Z1;
COMMIT;

DELETE CVDTA.F03012
WHERE AIAN8 BETWEEN 72000 and 98999;
COMMIT;

-- ------------------------------------------ Item Master ------------------------------------------ 
DELETE CVDTA.F4101Z1; --zFile
COMMIT;

DELETE CVDTA.F4101 
WHERE IMITM BETWEEN 51000 AND 70000; -- Item Master
COMMIT;

DELETE CVDTA.F4102
WHERE IBITM BETWEEN 51000 AND 70000; -- Item Branch Plant
COMMIT;

DELETE CVDTA.F4105 
WHERE COITM BETWEEN 51000 AND 70000; -- Item Cost
COMMIT;

DELETE CVDTA.F4141 
WHERE PJITM BETWEEN 51000 AND 70000; -- Cycle Counts
COMMIT;

DELETE CVDTA.F41021
WHERE LIITM BETWEEN 51000 AND 70000; -- Item Location
COMMIT;

DELETE CVDTA.F4111 
WHERE ILITM BETWEEN 51000 AND 70000; -- Item Ledger
COMMIT;

DELETE CVDTA.F4101 
WHERE IMITM BETWEEN 51000 AND 70000; -- Item Master
COMMIT;

DELETE CVDTA.F4102
WHERE IBITM BETWEEN 51000 AND 70000; -- Item Branch Plant
COMMIT;

DELETE CVDTA.F4105 
WHERE COITM BETWEEN 51000 AND 70000; -- Item Cost
COMMIT;

DELETE CVDTA.F4141 
WHERE PJITM BETWEEN 51000 AND 70000; -- Cycle Counts
COMMIT;

DELETE CVDTA.F41021
WHERE LIITM BETWEEN 51000 AND 70000; -- Item Location
COMMIT;

DELETE CVDTA.F4111 
WHERE ILITM BETWEEN 51000 AND 70000; -- Item Ledger
COMMIT;

-- ------------------------------------------ Item Cross Reference ------------------------------------------ 
DELETE CVDTA.F4104
WHERE IVITM BETWEEN 51000 AND 70000;
COMMIT;

-- ------------------------------------------ UOM Conversion ------------------------------------------ 
DELETE CVDTA.F41002;
COMMIT;

-- ------------------------------------------ Bill of Materials ------------------------------------------ 
DELETE CVDTA.F3002Z1; -- zFile
COMMIT;

DELETE CVDTA.F3002;
COMMIT;

-- ------------------------------------------ Item Cost ------------------------------------------ 
DELETE CVDTA.F4105Z1; -- zFile
COMMIT;

DELETE CVDTA.F4105
WHERE COITM BETWEEN 51000 AND 70000;
COMMIT;

-- ------------------------------------------ Cycle Count ------------------------------------------ 

DELETE CVDTA.F4141Z1 -- zFile
COMMIT;

DELETE CVDTA.F41021
WHERE LIITM BETWEEN 51000 AND 57000;
COMMIT;

DELETE CVDTA.F4141
WHERE PJITM BETWEEN 51000 AND 70000;
COMMIT;

-- //////////////////////////////////////// Unfiltered Purges //////////////////////////////////////// 
DELETE CVDTA.F42019; -- S.O. History Header (Tim/Ron)4
COMMIT;

DELETE CVDTA.F42119; -- S.O. History Detail (Tim/Ron)
COMMIT;

DELETE CVDTA.F3460; -- Forecast File (Tim) 
COMMIT;

DELETE CVDTA.F3403; -- Branch Relationships Master File (Tim)
COMMIT;

DELETE CVDTA.F4301; -- P.O. Header File (Tim) 
COMMIT;

DELETE CVDTA.F4311; -- P.O. Detail File (Tim) 
COMMIT;

DELETE CVDTA.F43199; -- P.O. Detail Ledger File; -- Flexible Version (Tim)
COMMIT;

DELETE CVDTA.F43090; -- Supplier/Item Relationships (Tim) 
COMMIT;

DELETE CVDTA.F4322; -- Purchasing Tolerance Rules (Tim)
COMMIT;

DELETE CVDTA.F41061; -- Supplier Price/Catalog File (Tim) 
COMMIT;

DELETE CVDTA.F43211; -- Supplier Schedule Master File (Tim) 
COMMIT;

DELETE CVDTA.F43121; -- Purchase Order Receiver File (Tim)
COMMIT;

DELETE CVDTA.F43092; -- Purchase Order Receipt Routing File (Tim)
COMMIT;

DELETE CVDTA.F4209; -- Held Orders (Tim) 
COMMIT;

DELETE CVDTA.F41021; -- Item Location File (Tim) 
COMMIT;

DELETE CVDTA.F4201; -- Sales Order Header (Ron)
COMMIT;

DELETE CVDTA.F4211; -- Sales Order Detail (Ron)
COMMIT;

DELETE CVDTA.F42199; -- Sales Order  Detail Ledger File (Ron)
COMMIT;

DELETE CVDTA.F4209; -- Held Orders (Ron)
COMMIT;

DELETE CVDTA.F49211; -- Sales Order Detail Tag File (Ron)
COMMIT;

DELETE CVDTA.F4229; -- Sales Summary History File (Ron)
COMMIT;

DELETE CVDTA.F30026; -- Inventory OP Base (Tim)
COMMIT;

DELETE CVDTA.F3003; -- Inventory OP Base (Steve)
COMMIT;

DELETE CVDTA.F30006; -- Product Data Management (Steve)
COMMIT;
