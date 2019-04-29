/*
	Custom Detail for Request to E1 integration
	IR 20190420
	Tom Sampson
	VER0002
*/
USE Requests;

DECLARE @OrderID INTEGER, @SectionID INTEGER

SET @OrderID = 55722
SET @SectionID = 205515

SELECT DISTINCT

	 Orders.OrderID AS                  "55BORDER"
	,QuoteSectionItems.SectionID        "55BSECID"
	,QuoteSectionItems.ItemID           "55BLINE"
	,''                                 "EDSP"
	,Systems.SystemNumber AS            "AITM"
	,QuoteSectionItems.Quantity         "UORG"
	,CAST((QuoteSectionItems.UnitPrice) AS NUMERIC(12,2)) AS 
                                        "UPRC"
	,CAST(ISNULL(dbo.fn_findDiscount(SystemCategories.CategoryID, (QuoteSectionItems.UnitPrice * QuoteSectionItems.Quantity)),0) * QuoteSectionItems.UnitPrice AS DECIMAL (12,4)) 
                                        "ADSA"
	,CAST((((QuoteSectionItems.Quantity * QuoteSectionItems.UnitPrice) / NULLIF(Subtotal.Amount,0)) * QuoteSectionCommissions.Commission)/NULLIF(QuoteSectionItems.Quantity,0) AS NUMERIC(12,4)) AS 
                                        "IPRV"
	,CASE 
		WHEN LEFT(RTRIM(LTRIM(QuoteSectionItems.Custom)),60) IS NULL THEN ''
		ELSE LEFT(RTRIM(LTRIM(QuoteSectionItems.Custom)),60)
	 END                                "TXLN"
	,''                                 "KCOO"
	,''                                 "DOCO"
	,''                                 "DCTO"
	,''                                 "LIND"
	,''                                 "USER"
	,''                                 "PID"
	,''                                 "UPMJ"
	,''                                 "UPMT"
	,''                                 "JOBN"	

FROM QuoteSectionItems QuoteSectionItems

JOIN QuoteSections QuoteSections
	ON QuoteSectionItems.SectionID = QuoteSections.SectionID

JOIN Orders Orders
	ON Orders.QuoteID = QuoteSections.QuoteID

JOIN ShippingCosts ShippingCosts
	ON Orders.ShippingID = ShippingCosts.ShippingID
	
INNER JOIN Systems Systems 
	ON QuoteSectionItems.SystemID = Systems.SystemID
	
INNER JOIN
	(
		SELECT 
			 SectionID
			, CAST(SUM(Quantity * UnitPrice) AS decimal(13,3)) AS Amount
			, CAST(SUM(Quantity * UnitWeight) AS decimal(13,3)) AS Weight
		FROM
			QuoteSectionItems QIT
		GROUP BY
			SectionID
	) Subtotal 
	ON QuoteSectionItems.SectionID = Subtotal.SectionID
	
JOIN RepCompanies RepCompanies
	ON 	Orders.RepID = RepCompanies.RepID

JOIN
	QuoteSectionCommissions QuoteSectionCommissions 
			ON QuoteSectionItems.SectionID = QuoteSectionCommissions.SectionID
			AND QuoteSectionCommissions.RepID = Orders.RepID

LEFT JOIN SystemCategories SystemCategories
	ON Systems.CategoryID = SystemCategories.CategoryID
WHERE 
	Orders.OrderID = @OrderID
	AND QuoteSectionItems.SectionID = @SectionID

UNION ALL

SELECT TOP 1

	 Orders.OrderID AS                  "55BORDER"
	,QuoteSectionItems.SectionID        "55BSECID"
	,LTRIM(RTRIM(CAST(RIGHT(DATEPART(HOUR, GETDATE()),2) AS CHAR)))
		+ LTRIM(RTRIM(CAST(RIGHT(DATEPART(MINUTE, GETDATE()),2) AS CHAR)))
		+ LTRIM(RTRIM(CAST(RIGHT(DATEPART(SECOND, GETDATE()),2) AS CHAR)))	
		+ LTRIM(RTRIM(CAST(RIGHT(DATEPART(MILLISECOND, GETDATE()),2) AS CHAR)))
	                                    "55BLINE"
	,''                                 "EDSP"
	,'FREIGHT' AS                       "AITM"
	,1                                  "UORG"
	,Orders.ShippingAmount              "UPRC"
	,0                                  "ADSA"
	,0                                  "IPRV"
	,ShippingCosts.ShippingDescription  "TXLN"
	,''                                 "KCOO"
	,''                                 "DOCO"
	,''                                 "DCTO"
	,''                                 "LIND"
	,''                                 "USER"
	,''                                 "PID"
	,''                                 "UPMJ"
	,''                                 "UPMT"
	,''                                 "JOBN"	
	
FROM 
	QuoteSectionItems QuoteSectionItems

JOIN QuoteSections QuoteSections
	ON QuoteSectionItems.SectionID = QuoteSections.SectionID

JOIN Orders Orders
	ON Orders.QuoteID = QuoteSections.QuoteID

JOIN ShippingCosts ShippingCosts
	ON Orders.ShippingID = ShippingCosts.ShippingID
	
INNER JOIN
	Systems Systems ON QuoteSectionItems.SystemID = Systems.SystemID
	
INNER JOIN
	(	SELECT	SectionID
				,CAST(SUM(Quantity * UnitPrice) AS decimal(13,3)) AS Amt
				,CAST(SUM(Quantity * UnitWeight) AS decimal(13,3)) AS Lbs
		FROM	QuoteSectionItems QIT
		WHERE	SectionID = @SectionID
		GROUP BY	SectionID) "SubT"
	
	ON (QuoteSectionItems.SectionID = "SubT".SectionID)
	
JOIN RepCompanies RepCompanies
	ON 	Orders.RepID = RepCompanies.RepID

JOIN
	QuoteSectionCommissions QuoteSectionCommissions 
			ON QuoteSectionItems.SectionID = QuoteSectionCommissions.SectionID
			AND QuoteSectionCommissions.RepID = Orders.RepID

JOIN Customers Customers
	ON Orders.CustomerID = Customers.CustomerID

JOIN CustomerAddresses CustomerAddresses
	ON Customers.CustomerID = CustomerAddresses.CustomerID

JOIN Quotes Quotes
	ON Orders.QuoteID = Quotes.QuoteID

LEFT JOIN Users Users
	ON Quotes.UserID = Users.UserID

LEFT JOIN Permissions Permissions
	ON Users.SecurityLevel = Permissions.PermissionID	

WHERE 
	Orders.OrderID = @OrderID
	AND QuoteSectionItems.SectionID = @SectionID

ORDER BY
	 Orders.OrderID
	,QuoteSectionItems.SectionID
	,QuoteSectionItems.ItemID