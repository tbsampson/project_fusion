-- this file has turned into a scratch pad, .ignore

-- backup tables first
CREATE TABLE TSAMPSON.CRPDTA_F41021	AS SELECT * FROM CRPDTA.F41021;
CREATE TABLE TSAMPSON.CRPDTA_F4102	AS SELECT * FROM CRPDTA.F4102;




-- start update code

UPDATE CRPDTA.F41021 F41021
   SET F41021.LINCDJ = (SELECT t2.LINCDJ_AFTER
                         FROM TSAMPSON.ABC_3 t2CREATE
                        	WHERE F41021.LIITM = t2.LIITM
							AND F41021.LIMCU = t2.LIMCU
                            AND F41021.LILOCN = t2.LILOCN 
							AND F41021.LIPBIN = t2.LIPBIN
						)

 WHERE EXISTS           (SELECT 1
                          FROM TSAMPSON.ABC_3 t2
                        	WHERE F41021.LIITM = t2.LIITM
							AND F41021.LIMCU = t2.LIMCU
                            AND F41021.LILOCN = t2.LILOCN 
							AND F41021.LIPBIN = t2.LIPBIN
						);

-- end update code



SELECT 
     F4102.IBITM
	,F4102.IBLITM
	,F4102.IBAITM
	,F4102.IBABCM
	,F41021.LINCDJ
	,(
		to_char(to_date(to_char(to_date(substr(F41021.LINCDJ, 2, 5), 'YYDDD'), 'MM/DD/YYYY'), 'MM/DD/YYYY') + (
				CAST(CEIL((
							ROW_NUMBER() OVER (
								ORDER BY F4102.IBITM
								)
							) / 65) AS INTEGER) * 7
				), 'YYYY') - 1900
		) * 1000 + to_char(to_date(to_char(to_date(substr(F41021.LINCDJ, 2, 5), 'YYDDD'), 'MM/DD/YYYY'), 'MM/DD/YYYY') + (
			CAST(CEIL((
						ROW_NUMBER() OVER (
							ORDER BY F4102.IBITM
							)
						) / 65) AS INTEGER) * 7
			), 'DDD') NEW_LINCDJ
FROM CRPDTA.F41021 F41021
JOIN CRPDTA.F4102 F4102
	ON F4102.IBITM = F41021.LIITM
WHERE F4102.IBABCM = 'A'
	AND F41021.LINCDJ <> 0




UPDATE CRPDTA.F41021 F41021
   SET F41021.LINCDJ = (SELECT t2.NEW_LINCDJ
                         FROM TSAMPSON.ABC_CONV t2
                        	WHERE F41021.LIITM = t2.LIITM
							AND F41021.LIMCU = t2.LIMCU
							AND F41021.LIGLPT = t2.LIGLPT
							AND F41021.LINCDJ <> 0
						)

 WHERE EXISTS (
    SELECT 1
      FROM TSAMPSON.A t2
     WHERE F41021.LIITM = t2.LIITM )



UPDATE CRPDTA.F41021 t1
   SET t1.LINCDJ = (SELECT t2.NEW_LINCDJ
                          FROM TSAMPSON.A t2
                         WHERE t2.LIITM = t1.LIITM)
 WHERE EXISTS
      (SELECT 1
         FROM t2
        WHERE t1.LIITM = t2.LIITM);



merge into CRPDTA.F41021 F41021 
using (select * from TSAMPSON.A) t1
on (F41021.LIITM = t1.LIITM)
when matched then update
set
   F41021.LINCDJ = t1.NEW_LINCDJ





CREATE TABLE TSAMPSON.C

AS

SELECT

     C.LIITM
    ,C.NEW_LINCDJ

FROM
    (
        SELECT 
            F41021.LIITM
            ,(
                to_char(to_date(to_char(to_date(substr(F41021.LINCDJ, 2, 5), 'YYDDD'), 'MM/DD/YYYY'), 'MM/DD/YYYY') + (
                        CAST(CEIL((
                                    ROW_NUMBER() OVER (
                                        ORDER BY F4102.IBITM
                                        )
                                    ) / 8) AS INTEGER) * 7
                        ), 'YYYY') - 1900
                ) * 1000 + to_char(to_date(to_char(to_date(substr(F41021.LINCDJ, 2, 5), 'YYDDD'), 'MM/DD/YYYY'), 'MM/DD/YYYY') + (
                    CAST(CEIL((
                                ROW_NUMBER() OVER (
                                    ORDER BY F4102.IBITM
                                    )
                                ) / 8) AS INTEGER) * 7
                    ), 'DDD') NEW_LINCDJ
        FROM CRPDTA.F41021 F41021
        JOIN CRPDTA.F4102 F4102
            ON F4102.IBITM = F41021.LIITM
        WHERE F4102.IBABCM = 'C'
            AND F41021.LINCDJ <> 0
    ) C
	

    /*
UPDATE CRPDTA.F41021 F41021
   SET F41021.LINCDJ = (SELECT t2.NEW_LINCDJ
                         FROM TSAMPSON.ABC_CONV t2
                        	WHERE F41021.LIITM = t2.LIITM
							AND F41021.LIMCU = t2.LIMCU
							AND F41021.LILOCN = t2.LILOCN
							AND F41021.LINCDJ <> 0
						)
                        

SELECT * FROM TSAMPSON.ABC_CONV

SELECT LINCDJ FROM CRPDTA.F41021
WHERE LINCDJ IS NOT NULL
*/

SELECT 
 F41021.LIITM
,F41021.LIMCU
,F41021.LILOCN
,F41021.LINCDJ
,t2.LINCDJ OLD_LINCDJ

FROM CRPDTA.F41021 F41021

JOIN TSAMPSON.CRPDTA_F41021 t2
ON F41021.LIITM = t2.LIITM
AND F41021.LIMCU = t2.LIMCU
AND F41021.LILOCN = t2.LILOCN

WHERE  F41021.LINCDJ <> 0
