/*
    F0101Z2 - Address Book - Ship To
    VER0001 -  Tom Sampson
*/
-- CREATE VIEW _SHIPTO_NEW AS

SELECT

 'JDE'		SZEDUS -- EDI - User ID [Generic Edit] String (10)
,'BAL0003'	SZEDBT -- EDI - Batch Number [Generic Edit] String (15)
,(
    ROW_NUMBER() OVER (
        ORDER BY CUST_ADDRESS.ROWID
        )
 ) + 74600	SZEDTN -- EDI - Transaction Number [Generic Edit] String (22)
,0			SZEDLN -- EDI - Line Number [Generic Edit] Numeric (7)
,''			SZEDCT -- EDI - Document Type [Generic Edit] String (2)
,'JDEAB'	SZTYTN -- Type - Transaction [UDC (00 TT)] String (8)
,''			SZEDFT -- EDI - Translation Format [Generic Edit] String (10)
,''			SZEDDT -- EDI - Transmission Date [Generic Edit] Date (6)
,''			SZDRIN -- Direction Indicator [UDC (00 DN)] Character (1)
,''			SZEDDL -- EDI - Detail Lines Processed [Generic Edit] Numeric (5)
,'N'		SZEDSP -- EDI - Successfully Processed [Generic Edit] Character (1)
,''			SZPNID -- Trading Partner ID [Generic Edit] String (15)
,'A'		SZTNAC -- Transaction Action [UDC (00 TA)] String (2)
,(
    ROW_NUMBER() OVER (
        ORDER BY CUST_ADDRESS.ROWID
        )
 ) + 74600  SZAN8 -- Address Number [Generic Edit] Numeric (8)
,'BC_' + LTRIM(RTRIM(CUST_ADDRESS.CUSTOMER_ID)) + '_' + LTRIM(RTRIM(CAST(CUST_ADDRESS.ADDR_NO AS CHAR))) 
			SZALKY -- Long Address Number [Generic Edit] String (20)
,''			SZTAX -- Tax ID [Generic Edit] String (20)
,LEFT(LTRIM(RTRIM(REPLACE(REPLACE(CUST_ADDRESS.NAME, '.', ''), ',', ''))), 40)
			SZALPH -- Name - Alpha [Generic Edit] String (40)
,''			SZDC -- Description - Compressed [Generic Edit] String (40)
,'          20'
			SZMCU -- Business Unit [Generic Edit] String (12)
,''			SZSIC -- Industry Classification Code [UDC (01 SC)] String (10)
,''			SZLNGP -- Language [UDC (01 LP)] String (2)
,'CS'		SZAT1 -- Search Type [UDC (01 ST)] String (3)
,''			SZCM -- Credit Message [UDC (00 CM)] String (2)
,'2'		SZTAXC -- Person/Corporation Code [UDC (H00 TA)] Character (1)
,'N'		SZAT2 -- AR/AP Netting Indicator [UDC (H01 AV)] Character (1)
,'N'		SZAT3 -- HRM Records Exist [UDC (H01 AV)] Character (1)
,'N'		SZAT4 -- Address Type - 4 [UDC (H01 AV)] Character (1)
,'Y'		SZATR -- Address Type - Receivables [UDC (H01 AR)] Character (1)
,'N'		SZAT5 -- Address Type - 5 [UDC (H01 AV)] Character (1)
,'N'		SZATP -- Address Type - Payables [UDC (H01 AS)] Character (1)
,'N'		SZATPR -- Address Type - Code Purchaser [Generic Edit] Character (1)
,'N'		SZAB3 -- Address Book - MiscellaneousCode(future) [UDC (01 EP)] Character (1)
,'N'		SZATE -- Address Type - Employee [UDC (H01 AR)] Character (1)
,''			SZSBLI -- Subledger Inactive Code [UDC (00 SI)] Character (1)
,dbo.JDEJulian(GETDATE())
			SZEFTB -- Date - Beginning Effective [Generic Edit] Date (6)
,BT.SZAN8	SZAN81 -- Address Number - 1st [Generic Edit] Numeric (8)
,''			SZAN82 -- Address Number - 2nd [Generic Edit] Numeric (8)
,''			SZAN83 -- Address Number - 3rd [Generic Edit] Numeric (8)
,''			SZAN84 -- Address Number - 4th [Generic Edit] Numeric (8)
,''			SZAN86 -- Address Number - 5th [Generic Edit] Numeric (8)
,''			SZAN85 -- Factor/Special Payee [Generic Edit] Numeric (8)
,''			SZAC01 -- Category Code - Address Book 01 [UDC (01 01)] String (3)
,''			SZAC02 -- Category Code - Address Book 02 [UDC (01 02)] String (3)
,''			SZAC03 -- Category Code - Address Book 03 [UDC (01 03)] String (3)
,''			SZAC04 -- Category Code - Address Book 04 [UDC (01 04)] String (3)
,''			SZAC05 -- Category Code - Address Book 05 [UDC (01 05)] String (3)
,''			SZAC06 -- Category Code - Address Book 06 [UDC (01 06)] String (3)
,''			SZAC07 -- Category Code - Address Book 07 [UDC (01 07)] String (3)
,''			SZAC08 -- Category Code - Address Book 08 [UDC (01 08)] String (3)
,''			SZAC09 -- Category Code - Address Book 09 [UDC (01 09)] String (3)
,''			SZAC10 -- Category Code - Address Book 10 [UDC (01 10)] String (3)
,''			SZAC11 -- Sales Region [UDC (01 11)] String (3)
,''			SZAC12 -- Category Code - Address Book 12 [UDC (01 12)] String (3)
,''			SZAC13 -- Category Code - Address Book 13 [UDC (01 13)] String (3)
,''			SZAC14 -- Category Code - Address Book 14 [UDC (01 14)] String (3)
,''			SZAC15 -- Category Code - Address Book 15 [UDC (01 15)] String (3)
,''			SZAC16 -- Category Code - Address Book 16 [UDC (01 16)] String (3)
,''			SZAC17 -- Category Code - Address Book 17 [UDC (01 17)] String (3)
,''			SZAC18 -- Category Code - Address Book 18 [UDC (01 18)] String (3)
,''			SZAC19 -- Category Code - Address Book 19 [UDC (01 19)] String (3)
,''			SZAC20 -- Category Code - Address Book 20 [UDC (01 20)] String (3)
,''			SZAC21 -- Category Code - Address Book 21 [UDC (01 21)] String (3)
,''			SZAC22 -- Category Code - Address Book 22 [UDC (01 22)] String (3)
,''			SZAC23 -- Category Code - Address Book 23 [UDC (01 23)] String (3)
,''			SZAC24 -- Category Code - Address Book 24 [UDC (01 24)] String (3)
,''			SZAC25 -- Category Code - Address Book 25 [UDC (01 25)] String (3)
,''			SZAC26 -- Category Code - Address Book 26 [UDC (01 26)] String (3)
,''			SZAC27 -- Category Code - Address Book 27 [UDC (01 27)] String (3)
,''			SZAC28 -- Category Code - Address Book 28 [UDC (01 28)] String (3)
,''			SZAC29 -- Category Code - Address Book 29 [UDC (01 29)] String (3)
,''			SZAC30 -- Category Code - Address Book 30 [UDC (01 30)] String (3)
,''			SZGLBA -- G/L Bank Account [Generic Edit] String (8)
,0			SZPTI -- Time - Scheduled In [Generic Edit] Numeric (6)
,0			SZPDI -- Date - Scheduled In [Generic Edit] Date (6)
,''			SZMSGA -- Action - Message Control [UDC (H01 MR)] Character (1)
,''			SZRMK -- Name - Remark [Generic Edit] String (30)
,''			SZTXCT -- Certificate Tax Exemption [Generic Edit] String (20)
,''			SZTX2 -- Tax ID - Additional - Individual [Generic Edit] String (20)
,''			SZALP1 -- Secondary Alpha Name [Generic Edit] String (40)
,''			SZURCD -- User Reserved Code [Generic Edit] String (2)
,0			SZURDT -- User Reserved Date [Generic Edit] Date (6)
,0			SZURAT -- User Reserved Amount [Generic Edit] Numeric (15)
,0			SZURAB -- User Reserved Number [Generic Edit] Numeric (8)
,LEFT(LTRIM(RTRIM(CUST_ADDRESS.SHIPTO_ID)),15)
			SZURRF -- User Reserved Reference [Generic Edit] String (15)
,''			SZMLNM -- Name - Mailing [Generic Edit] String (40)
,''			SZMLN1 -- Secondary Mailing Name [Generic Edit] String (40)
/*,CASE 
			WHEN CUST_ADDRESS.ADDR_1 IS NOT NULL
				AND LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)), 1) <= '9'
				AND LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)), 1) <> '%'
				AND LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)), 1) <> '#'
				AND LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)), 1) <> '('
				AND LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)) <> ''
				THEN LTRIM(RTRIM(LEFT(ISNULL(LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)), ''), 40)))
			WHEN CUST_ADDRESS.ADDR_2 IS NOT NULL 
				AND LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 1) <= '9'
				AND LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 1) <> '%'
				AND LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 1) <> '#'
				AND LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 1) <> '('
				AND CUST_ADDRESS.ADDR_2 NOT LIKE '%@%'
				THEN LTRIM(RTRIM(LEFT(ISNULL(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), ''), 40)))
			ELSE ''
			END */
,CASE
	WHEN BT.SZAT1 = 'C' THEN BT.SZADD1
	ELSE ISNULL(LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)),40),'')
 END
			SZADD1 -- Address Line 1 [Generic Edit] String (40)
/*,CASE 
			WHEN CUST_ADDRESS.ADDR_1 IS NOT NULL 
				AND LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)), 1) <= '9'
				AND LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)), 1) <> '%'
				AND LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)), 1) <> '#'
				AND LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)), 1) <> '('
				AND LTRIM(RTRIM(CUST_ADDRESS.ADDR_1)) <> ''
				AND (
					LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 3) = 'STE'
					OR LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 5) = 'SUITE'
					OR LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 3) = '1ST'
					OR LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 4) = 'BLDG'
					OR LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), 8) = 'BUILDING'
					)
				THEN LTRIM(RTRIM(LEFT(ISNULL(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)), ''), 40)))
			ELSE ''
			END*/
,CASE
	WHEN BT.SZAT1 = 'C' THEN BT.SZADD2
	ELSE ISNULL(LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_2)),40),'')
 END
			SZADD2 -- Address Line 2 [Generic Edit] String (40)
,CASE
	WHEN BT.SZAT1 = 'C' THEN BT.SZADD3
	ELSE ISNULL(LEFT(LTRIM(RTRIM(CUST_ADDRESS.ADDR_3)),40),'')
 END
			SZADD3 -- Address Line 3 [Generic Edit] String (40)
,''			SZADD4 -- Address Line 4 [Generic Edit] String (40)
,CASE 
			WHEN LEN(CUST_ADDRESS.ZIPCODE) <= 12
				THEN LTRIM(RTRIM(CUST_ADDRESS.ZIPCODE))
			ELSE ''
			END
			SZADDZ -- Postal Code [Generic Edit] String (12)
,CASE 
			WHEN LEN(CUST_ADDRESS.CITY) <= 25
				THEN LTRIM(RTRIM(CUST_ADDRESS.CITY))
			ELSE ''
			END
			SZCTY1 -- City [Generic Edit] String (25)
,CASE 
	WHEN BT.SZAT1 = 'C' THEN BT.SZCTR
	WHEN BT.SZAT1 <> 'C' AND LEFT(CUST_ADDRESS.ZIPCODE,5) BETWEEN '00000' AND '99999' THEN 'US' 
	ELSE 'CA' 
 END		SZCTR -- Country [UDC (00 CN)] String (3)
,CASE
	WHEN ISNULL(LEFT(LTRIM(RTRIM(CUST_ADDRESS.STATE)),2),'') 	IN ('','*','AB','AI','AK','AL','AM','AR','AU','AZ','BC','CA','CN','CO','CT','CZ','DC','DE','DF','FL','GA','HI','IA','ID','IL','IN','KS','KY','LA','MA','MB','MD','ME','MI','MN','MO','MS','MT','MX','NB','NC','ND','NE','NF','NH','NJ','NL','NM','NS','NSW','NT','NU','NV','NY','NZ','OH','OK','ON','OR','PA','PE','PR','QC','RI','RJ','RS','SA','SC','SD','SK','SP','TAS','TN','TX','UT','VA','VI','VIC','VT','WA','WI','WV','WY','YT','ZZ')
		THEN ISNULL(LEFT(LTRIM(RTRIM(CUST_ADDRESS.STATE)),2),'')
		ELSE ''
 END
			SZADDS -- State [UDC (00 S)] String (3)
,''			SZCOUN -- County [UDC (00 CT)] String (25)
,CASE 
			WHEN LEFT(REPLACE(CUST_ADDRESS.COUNTRY, '-', ''), 3) IS NOT NULL
				AND LEFT(REPLACE(CUST_ADDRESS.COUNTRY, '-', ''), 3) <> ''
				AND LEFT(LTRIM(RTRIM(CUST_ADDRESS.COUNTRY)), 1) <= '9'
				THEN LEFT(REPLACE(CUST_ADDRESS.COUNTRY, '-', ''), 3)
			ELSE ''
			END
			SZAR1 -- Phone Prefix [Generic Edit] String (6)
,CASE 
			WHEN CUST_ADDRESS.COUNTRY IS NOT NULL
				AND LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUST_ADDRESS.COUNTRY, '+', ''), ' ', ''), '-', ''), 10), 7), 3) + '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUST_ADDRESS.COUNTRY, '+', ''), ' ', ''), '-', ''), 10), 7), 4) <> ''
				AND LEFT(LTRIM(RTRIM(CUST_ADDRESS.COUNTRY)), 1) <= '9'
				THEN LEFT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUST_ADDRESS.COUNTRY, '+', ''), ' ', ''), '-', ''), 10), 7), 3) + '-' + RIGHT(RIGHT(LEFT(REPLACE(REPLACE(REPLACE(CUST_ADDRESS.COUNTRY, '+', ''), ' ', ''), '-', ''), 10), 7), 4)
			ELSE ''
			END
			SZPH1 -- Phone Number [Generic Edit] String (20)
,''			SZPHT1 -- Phone Number Type 1 [UDC (01 PH)] String (4)
,''			SZAR2 -- Phone Prefix 2 [Generic Edit] String (6)
,''			SZPH2 -- Phone Number 2 [Generic Edit] String (20)
,''			SZPHT2 -- Phone Number Type 2 [UDC (01 PH)] String (4)
,''			SZTORG -- Transaction Originator [Generic Edit] String (10)
,'TSAMPSON'
			SZUSER -- User ID [Generic Edit] String (10)
,'IMPORT'	SZPID -- Program ID [Generic Edit] String (10)
,''			SZJOBN -- Work Station ID [Generic Edit] String (10)
,dbo.JDEJulian(GETDATE())
			SZUPMJ -- Date - Updated [Generic Edit] Date (6)
,''			SZTDAY -- Time of Day [Generic Edit] Numeric (6)
,''			SZUPMT -- Time - Last Updated [Generic Edit] Numeric (6)
,''			SZPRGF -- Purge Flag [Generic Edit] Character (1)
,''			SZSCCLTP -- Shortcut Client Type (future) [UDC (98 CL)] String (2)
,BT.SZAN8	SZPA8 -- Address Number - Parent [Generic Edit] Numeric (8)
,''			SZTICKER -- Ticker [Generic Edit] String (10)
,''			SZEXCHG -- Stock Exchange [Generic Edit] String (10)
,''			SZDUNS -- DUNS Number [Generic Edit] String (13)
,''			SZCLASS01 -- Classification Code 01 [UDC (01 CA)] String (3)
,''			SZCLASS02 -- Classification Code 02 [UDC (01 CB)] String (3)
,''			SZCLASS03 -- Classification Code 03 [UDC (01 CC)] String (3)
,''			SZCLASS04 -- Classification Code 04 [UDC (01 CD)] String (3)
,''			SZCLASS05 -- Classification Code 05 [UDC (01 CE)] String (3)
,''			SZNOE -- Number Of Employee [Generic Edit] Numeric (15)
,''			SZGROWTHR -- Growth Rate [Generic Edit] Numeric (8)
,''			SZYEARSTAR -- Year Started [Generic Edit] String (15)
,''			SZAEMPGP -- Employee Group Approvals [UDC (43E AA)] String (5)
,''			SZACTIN -- Future Use Indicator [Generic Edit] Character (1)
,''			SZREVRNG -- Revenue range [UDC (01 RR)] String (5)
-- ,CUST_ADDRESS.ROWID SORT

FROM CUST_ADDRESS CUST_ADDRESS

JOIN _BILLTO_NEW BT
    ON BT.SZALKY = 'BC_' + CUST_ADDRESS.CUSTOMER_ID

JOIN _NEW_CUSTOMERS NC
	ON BT.SZALKY = 'BC_' + NEW_CUSTOMERS
	AND CUST_ADDRESS.ADDR_NO = NC.ADDR_NO

WHERE BT.SZAT1 = 'CB'



