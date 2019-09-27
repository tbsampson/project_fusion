
CREATE TABLE TSAMPSON.ABC_PD_20190928 AS

SELECT *
FROM
(
SELECT

 F41021.LIITM
,F41021.LIMCU
,F4102.IBLITM
,F41021.LILOCN
,F41021.LIPBIN
,F4102.IBABCM
,F41021.LIGLPT
,F41021.LIPQOH
,F41021.LINCDJ LINCDJ_BEFORE
	,(to_char(to_date(to_char(to_date(substr(119278, 2, 5), 'YYDDD'), 'MM/DD/YYYY'), 'MM/DD/YYYY') + (
				CAST(CEIL((
							ROW_NUMBER() OVER (
								ORDER BY F4102.IBITM
								)
							) / 71) AS INTEGER) * 7 -- CHANGE "A" DIV HERE
				), 'YYYY') - 1900
		) * 1000 + to_char(to_date(to_char(to_date(substr(119278, 2, 5), 'YYDDD'), 'MM/DD/YYYY'), 'MM/DD/YYYY') + (
			CAST(CEIL((
						ROW_NUMBER() OVER (
							ORDER BY F4102.IBITM
							)
						) / 71) AS INTEGER) * 7 -- CHANGE "A" DIV HERE
			), 'DDD') LINCDJ_AFTER
,to_date(to_char(to_date(substr((to_char(to_date(to_char(to_date(substr(119278, 2, 5), 'YYDDD'), 'MM/DD/YYYY'), 'MM/DD/YYYY') 
        + (	CAST(CEIL((ROW_NUMBER() OVER (ORDER BY F4102.IBITM)) / 71) AS INTEGER) * 7), 'YYYY') - 1900) * 1000  -- CHANGE "A" DIV HERE
        + to_char(to_date(to_char(to_date(substr(119278, 2, 5), 'YYDDD'), 'MM/DD/YYYY'), 'MM/DD/YYYY')
        + (CAST(CEIL((ROW_NUMBER() OVER (ORDER BY F4102.IBITM)) / 71) AS INTEGER) * 7), 'DDD'),2,5),'YYDDD'),'MM/DD/YYYY'),'MM/DD/YYYY') LINCDJ_AFTER_GD -- CHANGE "A" DIV HERE

FROM PRODDTA.F41021 F41021

JOIN PRODDTA.F4102 F4102
	ON F4102.IBITM = F41021.LIITM
    AND F4102.IBMCU = F41021.LIMCU
    AND F4102.IBGLPT = F41021.LIGLPT
    
WHERE (F4102.IBABCM = 'A'
	AND F41021.LIPQOH <> 0)
    OR (F4102.IBABCM = 'A' AND F41021.LIPBIN = 'P' AND F41021.LILOCN = 'SHIP01' AND F41021.LIPQOH = 0) 
    
UNION

SELECT

 F41021.LIITM
,F41021.LIMCU
,F4102.IBLITM
,F41021.LILOCN
,F41021.LIPBIN
,F4102.IBABCM
,F41021.LIGLPT
,F41021.LIPQOH
,F41021.LINCDJ LINCDJ_BEFORE
	,(to_char(to_date(to_char(to_date(substr(119278, 2, 5), 'YYDDD'), 'MM/DD/YYYY'), 'MM/DD/YYYY') + (
				CAST(CEIL((
							ROW_NUMBER() OVER (
								ORDER BY F4102.IBITM
								)
							) / 11) AS INTEGER) * 7 -- CHANGE "B" DIV HERE
				), 'YYYY') - 1900
		) * 1000 + to_char(to_date(to_char(to_date(substr(119278, 2, 5), 'YYDDD'), 'MM/DD/YYYY'), 'MM/DD/YYYY') + (
			CAST(CEIL((
						ROW_NUMBER() OVER (
							ORDER BY F4102.IBITM
							)
						) / 11) AS INTEGER) * 7 -- CHANGE "B" DIV HERE
			), 'DDD') LINCDJ_AFTER
,to_date(to_char(to_date(substr((to_char(to_date(to_char(to_date(substr(119278, 2, 5), 'YYDDD'), 'MM/DD/YYYY'), 'MM/DD/YYYY') 
        + (	CAST(CEIL((ROW_NUMBER() OVER (ORDER BY F4102.IBITM)) / 11) AS INTEGER) * 7), 'YYYY') - 1900) * 1000  -- CHANGE "B" DIV HERE
        + to_char(to_date(to_char(to_date(substr(119278, 2, 5), 'YYDDD'), 'MM/DD/YYYY'), 'MM/DD/YYYY')
        + (CAST(CEIL((ROW_NUMBER() OVER (ORDER BY F4102.IBITM)) / 11) AS INTEGER) * 7), 'DDD'),2,5),'YYDDD'),'MM/DD/YYYY'),'MM/DD/YYYY') LINCDJ_AFTER_GD -- CHANGE "B" DIV HERE

FROM PRODDTA.F41021 F41021

JOIN PRODDTA.F4102 F4102
	ON F4102.IBITM = F41021.LIITM
    AND F4102.IBMCU = F41021.LIMCU
    AND F4102.IBGLPT = F41021.LIGLPT
    
WHERE (F4102.IBABCM = 'B'
	AND F41021.LIPQOH <> 0)
    OR (F4102.IBABCM = 'B' AND F41021.LIPBIN = 'P' AND F41021.LILOCN = 'SHIP01' AND F41021.LIPQOH = 0)

UNION

SELECT

 F41021.LIITM
,F41021.LIMCU
,F4102.IBLITM
,F41021.LILOCN
,F41021.LIPBIN
,F4102.IBABCM
,F41021.LIGLPT
,F41021.LIPQOH
,F41021.LINCDJ LINCDJ_BEFORE
	,(to_char(to_date(to_char(to_date(substr(119278, 2, 5), 'YYDDD'), 'MM/DD/YYYY'), 'MM/DD/YYYY') + (
				CAST(CEIL((
							ROW_NUMBER() OVER (
								ORDER BY F4102.IBITM
								)
							) / 3) AS INTEGER) * 7 -- CHANGE "C" DIV HERE
				), 'YYYY') - 1900
		) * 1000 + to_char(to_date(to_char(to_date(substr(119278, 2, 5), 'YYDDD'), 'MM/DD/YYYY'), 'MM/DD/YYYY') + (
			CAST(CEIL((
						ROW_NUMBER() OVER (
							ORDER BY F4102.IBITM
							)
						) / 3) AS INTEGER) * 7 -- CHANGE "C" DIV HERE
			), 'DDD') LINCDJ_AFTER
,to_date(to_char(to_date(substr((to_char(to_date(to_char(to_date(substr(119278, 2, 5), 'YYDDD'), 'MM/DD/YYYY'), 'MM/DD/YYYY') 
        + (	CAST(CEIL((ROW_NUMBER() OVER (ORDER BY F4102.IBITM)) / 3) AS INTEGER) * 7), 'YYYY') - 1900) * 1000  -- CHANGE "C" DIV HERE
        + to_char(to_date(to_char(to_date(substr(119278, 2, 5), 'YYDDD'), 'MM/DD/YYYY'), 'MM/DD/YYYY')
        + (CAST(CEIL((ROW_NUMBER() OVER (ORDER BY F4102.IBITM)) / 3) AS INTEGER) * 7), 'DDD'),2,5),'YYDDD'),'MM/DD/YYYY'),'MM/DD/YYYY') LINCDJ_AFTER_GD  -- CHANGE "C" DIV HERE

FROM PRODDTA.F41021 F41021

JOIN PRODDTA.F4102 F4102
	ON F4102.IBITM = F41021.LIITM
    AND F4102.IBMCU = F41021.LIMCU
    AND F4102.IBGLPT = F41021.LIGLPT
    
WHERE (F4102.IBABCM = 'C'
	AND F41021.LIPQOH <> 0)
    OR (F4102.IBABCM = 'C' AND F41021.LIPBIN = 'P' AND F41021.LILOCN = 'SHIP01' AND F41021.LIPQOH = 0)

) ABC
ORDER BY

 ABC.IBABCM
,ABC.LIITM
,ABC.IBLITM
,ABC.LIMCU
,ABC.LILOCN
,ABC.LIPBIN
;

/*
CREATE TABLE TSAMPSON.F41021_PD_20190928 -- backup F41021 first
AS SELECT * FROM PRODDTA.F41021;

UPDATE PRODDTA.F41021 F41021
   SET F41021.LINCDJ = (SELECT t2.LINCDJ_AFTER
                         FROM TSAMPSON.ABC_TEST_CV_20190920 t2
                        	WHERE F41021.LIITM = t2.LIITM
							AND F41021.LIMCU = t2.LIMCU
                            AND F41021.LILOCN = t2.LILOCN 
							AND F41021.LIPBIN = t2.LIPBIN
                            AND F41021.LIGLPT = t2.LIGLPT
                            AND F41021.LIPQOH = t2.LIPQOH
						), F41021.LITDAY = 130000

 WHERE EXISTS           (SELECT 1
                          FROM TSAMPSON.ABC_TEST_CV_20190920 t2                        
                        	WHERE F41021.LIITM = t2.LIITM
							AND F41021.LIMCU = t2.LIMCU
                            AND F41021.LILOCN = t2.LILOCN 
							AND F41021.LIPBIN = t2.LIPBIN
                            AND F41021.LIGLPT = t2.LIGLPT
                            AND F41021.LIPQOH = t2.LIPQOH
						);
                        
COMMIT;


*/


