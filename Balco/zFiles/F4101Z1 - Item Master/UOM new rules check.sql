use BALCO;

SELECT
	 A.SZAITM
	,A.SZDSC1
	,A.NEW_UOM
	,A.OLD_UOM
	,UOM_RULES
	,CASE
		WHEN A.NEW_UOM <> '' THEN A.NEW_UOM
		WHEN A.NEW_UOM = '' AND A.OLD_UOM <> '' THEN A.OLD_UOM
		WHEN A.NEW_UOM = '' AND A.OLD_UOM = '' THEN A.UOM_RULES
	 ELSE '' 
	 END FINAL_UOM
	,A.SZLNTY
	
FROM
	(


		SELECT DISTINCT

		IM1.SZAITM
		,IM1.SZDSC1
		,ISNULL(PO_LINE.PURCHASE_UM,'') NEW_UOM
		,ISNULL(OLD.PURCHASE_UM,'') OLD_UOM
		,CASE 
			WHEN 
				IM1.SZSTKT = 'M' -- Stocking Type
				OR IM1.SZLNTY = 'D' -- Line Type
				OR LEFT(IM1.SZAITM,2) = 'CE'
				OR LEFT(IM1.SZAITM,2) = 'IS'
				OR LEFT(IM1.SZAITM,3) = 'RFS'
				OR LEFT(IM1.SZAITM,3) = 'PCS'
				THEN ISNULL(PART.STOCK_UM,'') 
			WHEN 
				LEFT(UPPER(IM1.SZDSC1),3) = 'EXT'
				OR LEFT(UPPER(IM1.SZDSC1),5) = 'PLATE'
				THEN 'SF'
			WHEN
				LEFT(UPPER(IM1.SZDSC1),3) = 'BAR'
				OR LEFT(UPPER(IM1.SZDSC1),5) = 'ANGLE'
				OR LEFT(UPPER(IM1.SZDSC1),4) = 'SEAL'
				OR LEFT(UPPER(IM1.SZDSC1),3) = 'SIL'
				THEN 'FT'
			WHEN 
				LEFT(UPPER(IM1.SZDSC1),6) = 'HRDWRE'
				OR LEFT(UPPER(IM1.SZDSC1),5) = 'SCREW'
				THEN 'EA'		
			ELSE ''
		  END UOM_RULES
		  ,IM1.SZLNTY
		  	
		FROM PART PART

		JOIN PART_LOCATION PART_LOCATION
			ON PART_LOCATION.PART_ID = PART.ID

		JOIN LOCATION LOCATION
			ON PART_LOCATION.LOCATION_ID = LOCATION.ID

		LEFT JOIN _ITEM_MASTER_SIDE IM1
			ON LTRIM(RTRIM(IM1.SZLITM)) = LTRIM(RTRIM(PART.ID))
			
			

		LEFT JOIN _OLD_UOM OLD
		ON OLD.PART_ID = IM1.SZAITM

		LEFT JOIN 
			(
				SELECT DISTINCT
					POL2.PART_ID
					,POL2.PURCHASE_UM
				FROM
					(
						SELECT
							PART_ID
							,MAX(DESIRED_RECV_DATE) RC_DATE

						FROM PURC_ORDER_LINE
						WHERE PURCHASE_UM IS NOT NULL
							AND LTRIM(RTRIM(PURCHASE_UM)) <> ''
						GROUP BY PART_ID
					) POL1

				JOIN PURC_ORDER_LINE POL2
					ON POL1.RC_DATE = POL2.DESIRED_RECV_DATE
					AND POL1.PART_ID = POL2.PART_ID
			) PO_LINE

			ON PART.ID = PO_LINE.PART_ID
	) A
WHERE A.SZAITM IS NOT NULL
-- AND A.SZLNTY = 'D'

ORDER BY A.SZAITM
