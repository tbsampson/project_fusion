

DELETE FROM CVDTA.F4101Z1; --zFile
COMMIT;

DELETE FROM CVDTA.F4101; -- Item Master
COMMIT;

DELETE FROM CVDTA.F4102; -- Item Branch Plant
COMMIT;

DELETE FROM CVDTA.F41021; -- Item Location
COMMIT;

DELETE FROM CVDTA.F4141Z1; -- Cycle Count zFile
COMMIT;

DELETE FROM CVDTA.F4140; -- Cycle Count Header (Inventory Management)
COMMIT;

DELETE FROM CVDTA.F4141; -- Cycle Count (Inventory Management)
COMMIT;

DELETE FROM CVDTA.F4111; -- Item Ledger
COMMIT;

DELETE FROM CVDTA.F03B11 -- Open AR Balance
COMMIT;

