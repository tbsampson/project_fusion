UPDATE CRPDTA.F41021 F41021
   SET F41021.LINCDJ = (SELECT t2.LINCDJ_AFTER
                         FROM TSAMPSON.ABC_TEST_PY4 t2
                        	WHERE F41021.LIITM = t2.LIITM
							AND F41021.LIMCU = t2.LIMCU
                            AND F41021.LILOCN = t2.LILOCN 
							AND F41021.LIPBIN = t2.LIPBIN
                            AND F41021.LIGLPT = t2.LIGLPT
                            AND F41021.LIPQOH = t2.LIPQOH
						), F41021.LITDAY = 130000

 WHERE EXISTS           (SELECT 1
                          FROM TSAMPSON.ABC_TEST_PY4 t2                        
                        	WHERE F41021.LIITM = t2.LIITM
							AND F41021.LIMCU = t2.LIMCU
                            AND F41021.LILOCN = t2.LILOCN 
							AND F41021.LIPBIN = t2.LIPBIN
                            AND F41021.LIGLPT = t2.LIGLPT
                            AND F41021.LIPQOH = t2.LIPQOH
						);
COMMIT;