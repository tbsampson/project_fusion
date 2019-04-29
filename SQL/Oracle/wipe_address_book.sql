-- Batch app name in JDE: R01010Z

-- check zFile
SELECT *
FROM CVDTA.F0101Z2

-- delete zFile content
DELETE CVDTA.F0101Z2
COMMIT;

-- If, after import/update, address book needs to be wiped...

DELETE FROM CVDTA.F0101 -- address book
WHERE ABAN8 > 72000;

DELETE FROM CVDTA.F0111 -- contacts
WHERE WWAN8 > 72000;

DELETE FROM CVDTA.F0115 -- phone number
WHERE WPAN8 > 72000;

DELETE FROM CVDTA.F0116 -- address
WHERE ALAN8 > 72000;

COMMIT;


