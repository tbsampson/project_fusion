SELECT SZAITM
	,CASE 
		WHEN FINAL_UOM = ''
			THEN 'EA'
		WHEN FINAL_UOM = 'BG'
			THEN 'BC'
		WHEN FINAL_UOM = 'GL'
			THEN 'GA'
		WHEN FINAL_UOM = 'GRAMS'
			THEN 'GM'
		WHEN FINAL_UOM = 'M'
			THEN 'MT'
		ELSE FINAL_UOM
		END AS UOM
FROM (
	SELECT SZAITM
		,SZDSC1
		,NEW_UOM
		,OLD_UOM
		,UOM_RULES
		,CASE 
			WHEN A.NEW_UOM <> ''
				THEN A.NEW_UOM
			WHEN A.NEW_UOM = ''
				AND A.OLD_UOM <> ''
				THEN A.OLD_UOM
			WHEN A.NEW_UOM = ''
				AND A.OLD_UOM = ''
				THEN A.UOM_RULES
			ELSE ''
			END AS FINAL_UOM
		,SZLNTY
	FROM (
		SELECT DISTINCT IM1.SZAITM
			,IM1.SZDSC1
			,ISNULL(PO_LINE.PURCHASE_UM, '') AS NEW_UOM
			,ISNULL(OLD.PURCHASE_UM, '') AS OLD_UOM
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
                THEN 'LB'
			WHEN LEFT(UPPER(IM1.SZDSC1),5) = 'PLATE'
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
		FROM dbo.PART AS PART
		INNER JOIN dbo.PART_LOCATION AS PART_LOCATION ON PART_LOCATION.PART_ID = PART.ID
		INNER JOIN dbo.LOCATION AS LOCATION ON PART_LOCATION.LOCATION_ID = LOCATION.ID
		LEFT OUTER JOIN dbo._ITEM_MASTER_SIDE AS IM1 ON LTRIM(RTRIM(IM1.SZAITM)) = LTRIM(RTRIM(PART.ID))
		LEFT OUTER JOIN dbo._OLD_UOM AS OLD ON OLD.PART_ID = IM1.SZAITM
		LEFT OUTER JOIN (
			SELECT DISTINCT POL2.PART_ID
				,POL2.PURCHASE_UM
			FROM (
				SELECT PART_ID
					,MAX(DESIRED_RECV_DATE) AS RC_DATE
				FROM dbo.PURC_ORDER_LINE
				WHERE (PURCHASE_UM IS NOT NULL)
					AND (LTRIM(RTRIM(PURCHASE_UM)) <> '')
				GROUP BY PART_ID
				) AS POL1
			INNER JOIN dbo.PURC_ORDER_LINE AS POL2 ON POL1.RC_DATE = POL2.DESIRED_RECV_DATE
				AND POL1.PART_ID = POL2.PART_ID
			) AS PO_LINE ON PART.ID = PO_LINE.PART_ID
		) AS A
	WHERE (SZAITM IS NOT NULL)
	) AS B