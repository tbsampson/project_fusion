
SET SERVEROUTPUT ON;

DECLARE
  a_group_count     INTEGER;
  b_group_count     INTEGER;
  c_group_count     INTEGER;

BEGIN

-- a_group_count = Total A / 13 - quarterly
SELECT COUNT(*)/13 INTO a_group_count
        FROM PRODDTA.F41021 F41021
        JOIN PRODDTA.F4102 F4102
            ON F4102.IBITM = F41021.LIITM
            AND F4102.IBMCU = F41021.LIMCU
            AND F4102.IBGLPT = F41021.LIGLPT
        WHERE (F4102.IBABCM = 'A' AND F41021.LIPQOH <> 0);
        --    OR (F4102.IBABCM = 'A' AND F41021.LIPBIN = 'P' AND F41021.LILOCN = 'SHIP01' AND F41021.LIPQOH = 0);

--  b_group_count = Total B / 26 - biannualy   
SELECT COUNT(*)/26 INTO b_group_count
        FROM PRODDTA.F41021 F41021
        JOIN PRODDTA.F4102 F4102
            ON F4102.IBITM = F41021.LIITM
            AND F4102.IBMCU = F41021.LIMCU
            AND F4102.IBGLPT = F41021.LIGLPT
        WHERE (F4102.IBABCM = 'B' AND F41021.LIPQOH <> 0);
        --    OR (F4102.IBABCM = 'B' AND F41021.LIPBIN = 'P' AND F41021.LILOCN = 'SHIP01' AND F41021.LIPQOH = 0);
            
--  c_group_count = Total C / 52 - annualy
SELECT COUNT(*)/52 INTO c_group_count
        FROM PRODDTA.F41021 F41021
        JOIN PRODDTA.F4102 F4102
            ON F4102.IBITM = F41021.LIITM
            AND F4102.IBMCU = F41021.LIMCU
            AND F4102.IBGLPT = F41021.LIGLPT
        WHERE (F4102.IBABCM = 'C' AND F41021.LIPQOH <> 0);
        --    OR (F4102.IBABCM = 'C' AND F41021.LIPBIN = 'P' AND F41021.LILOCN = 'SHIP01' AND F41021.LIPQOH = 0);

dbms_output.put_line('a_group_count = ' || a_group_count);
dbms_output.put_line('b_group_count = ' || b_group_count);
dbms_output.put_line('c_group_count = ' || c_group_count);

END;