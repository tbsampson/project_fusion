SELECT
    IBITM
    ,IBLITM
    ,IBAITM
    ,ABC_CODE_2 IBABCM
    ,ORIG_DATE LINCDJ
    ,AKA_ORIG_DATE
    ,ADD_DAYS
    ,NEW_DATE
FROM
    (
        SELECT

            F4102.IBITM
            ,F4102.IBLITM
            ,F4102.IBAITM
        --   ,F4102.IBABCS ABC_CODE_1
            ,F4102.IBABCM ABC_CODE_2
        --   ,F4102.IBABCI ABC_CODE_3
            ,F41021.LINCDJ ORIG_DATE
            ,to_date(to_char(to_date(substr(F41021.LINCDJ,2,5),'YYDDD'),'MM/DD/YYYY'),'MM/DD/YYYY') AKA_ORIG_DATE
            ,CAST(CEIL((ROW_NUMBER() OVER (ORDER BY F4102.IBITM))/65) AS INTEGER) * 7 ADD_DAYS
            ,to_date(to_char(to_date(substr(F41021.LINCDJ,2,5),'YYDDD'),'MM/DD/YYYY'),'MM/DD/YYYY') + (CAST(CEIL((ROW_NUMBER() OVER (ORDER BY F4102.IBITM))/65) AS INTEGER) * 7) NEW_DATE

        FROM CVDTA.F4102 F4102

        JOIN CVDTA.F41021 F41021
            ON F4102.IBITM = F41021.LIITM

        WHERE F4102.IBABCM = 'A'
            AND F41021.LINCDJ <> 0



        UNION

        SELECT

            F4102.IBITM
            ,F4102.IBLITM
            ,F4102.IBAITM
        --   ,F4102.IBABCS ABC_CODE_1
            ,F4102.IBABCM ABC_CODE_2
        --   ,F4102.IBABCI ABC_CODE_3
            ,F41021.LINCDJ ORIG_DATE
            ,to_date(to_char(to_date(substr(F41021.LINCDJ,2,5),'YYDDD'),'MM/DD/YYYY'),'MM/DD/YYYY') AKA_ORIG_DATE
            ,CAST(CEIL((ROW_NUMBER() OVER (ORDER BY F4102.IBITM))/16) AS INTEGER) * 7 ADD_DAYS
            ,to_date(to_char(to_date(substr(F41021.LINCDJ,2,5),'YYDDD'),'MM/DD/YYYY'),'MM/DD/YYYY') + (CAST(CEIL((ROW_NUMBER() OVER (ORDER BY F4102.IBITM))/16) AS INTEGER) * 7) NEW_DATE

        FROM CVDTA.F4102 F4102

        JOIN CVDTA.F41021 F41021
            ON F4102.IBITM = F41021.LIITM

        WHERE F4102.IBABCM = 'B'
            AND F41021.LINCDJ <> 0

        UNION

        SELECT

            F4102.IBITM
            ,F4102.IBLITM
            ,F4102.IBAITM
        --   ,F4102.IBABCS ABC_CODE_1
            ,F4102.IBABCM ABC_CODE_2
        --   ,F4102.IBABCI ABC_CODE_3
            ,F41021.LINCDJ ORIG_DATE
            ,to_date(to_char(to_date(substr(F41021.LINCDJ,2,5),'YYDDD'),'MM/DD/YYYY'),'MM/DD/YYYY') AKA_ORIG_DATE
            ,CAST(CEIL((ROW_NUMBER() OVER (ORDER BY F4102.IBITM))/8) AS INTEGER) * 7 ADD_DAYS
            ,to_date(to_char(to_date(substr(F41021.LINCDJ,2,5),'YYDDD'),'MM/DD/YYYY'),'MM/DD/YYYY') + (CAST(CEIL((ROW_NUMBER() OVER (ORDER BY F4102.IBITM))/8) AS INTEGER) * 7) NEW_DATE

        FROM CVDTA.F4102 F4102

        JOIN CVDTA.F41021 F41021
            ON F4102.IBITM = F41021.LIITM

        WHERE F4102.IBABCM = 'C'
            AND F41021.LINCDJ <> 0

    ) X

ORDER BY X.IBABCM, X.IBITM