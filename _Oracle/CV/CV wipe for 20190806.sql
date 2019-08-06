/*
    CV wipe for Project Fusion, Balco
    IR20190806 Tom Sampson
    VER0001
*/

-- //////////////////////////////////////// Unfiltered Purges //////////////////////////////////////// 


-- ---------- Location 
DELETE FROM CVDTA.F4100; -- Location
COMMIT;

DELETE FROM CVDTA.F43091; -- receipt routing
COMMIT;

-- ---------- Pause until GWSI does a reload of Location Master 
-- ---------- Reload/create receipt routing 

-- ---------- Item Master - PDM 
DELETE FROM CVDTA.F4101; -- Item Master
COMMIT;

DELETE FROM CVDTA.F4102; -- Item Branch file
COMMIT;

DELETE FROM CVDTA.F4104; -- cross reference
COMMIT;

DELETE FROM CVDTA.F4105; -- cost
COMMIT;

DELETE FROM CVDTA.F41002; -- unit of measure conversion
COMMIT;

DELETE FROM CVDTA.F41021; -- Inventory balance
COMMIT;

DELETE FROM CVDTA.F4108; -- Lot Master
COMMIT;

DELETE FROM CVDTA.F3002; -- BOM
COMMIT;

DELETE FROM CVDTA.F3003; -- routing
COMMIT;

DELETE FROM CVDTA.F30026; -- cost component
COMMIT;

DELETE FROM CVDTA.F4111; -- Item Ledger
COMMIT;

-- ---------- Sales Order - Ron 
DELETE FROM CVDTA.F4201; -- header
COMMIT;

DELETE FROM CVDTA.F4211; -- detail
COMMIT;

DELETE FROM CVDTA.F4209; -- held orders
COMMIT;

DELETE FROM CVDTA.F42019; -- header history
COMMIT;

DELETE FROM CVDTA.F42119; -- detail history
COMMIT;

DELETE FROM CVDTA.F42199; -- Sales Order Ledger
COMMIT;

DELETE FROM CVDTA.F3460; -- forecastin
COMMIT;

DELETE FROM CVDTA.F42150; -- SO commission
COMMIT;

DELETE FROM CVDTA.F42911; -- SO Tag
COMMIT;

DELETE FROM CVDTA.F49219; -- SO detail Tag
COMMIT;

DELETE FROM CVDTA.F42420; -- Audit transition
COMMIT;

DELETE FROM CVDTA.F42160; -- SO Detail commission
COMMIT;

DELETE FROM CVDTA.F4229; -- Sales Summary history
COMMIT;

DELETE FROM CVDTA.FF00165; -- Media Object
COMMIT;

DELETE FROM CVDTA.FF00166; -- Media Object
COMMIT;

-- ---------- Work order Tables 
DELETE FROM CVDTA.F4801; -- WO master
COMMIT;

DELETE FROM CVDTA.F3111; -- Parts List
COMMIT;

DELETE FROM CVDTA.F3112; -- Routing
COMMIT;

DELETE FROM CVDTA.F3102; -- Cost
COMMIT;

DELETE FROM CVDTA.F31122; -- Work order transaction file
COMMIT;

-- ---------- Purchasing 
DELETE FROM CVDTA.F4301; -- PO header
COMMIT;

DELETE FROM CVDTA.F4311; -- PO detail
COMMIT;

DELETE FROM CVDTA.F43199; -- Purchase Order Ledger
COMMIT;

DELETE FROM CVDTA.F43092; -- Receipt routing
COMMIT;

DELETE FROM CVDTA.F43121; -- PO receiver
COMMIT;

-- ---------- Quality Test Results 
DELETE FROM CVDTA.F3711; -- Quality Test results
COMMIT;

DELETE FROM CVDTA.F40318; -- Quality Reference
COMMIT;

DELETE FROM CVDTA.F3703; -- non conforming test
COMMIT;

-- ---------- ECO 
DELETE FROM CVDTA.F3013; -- Parts list detail
COMMIT;

DELETE FROM CVDTA.F3011; -- BOM Change File
COMMIT;

-- ---------- Compliance 
DELETE FROM CVDTA.F5542tag; -- SO tracking
COMMIT;

DELETE FROM CVDTA.F5541tag; -- Compliance labels
COMMIT;

