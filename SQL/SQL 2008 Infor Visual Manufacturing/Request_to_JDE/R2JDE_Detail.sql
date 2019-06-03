/*
	Custom Detail for Request to E1 integration
	IR 20190420
	Tom Sampson
	VER0004
*/
USE Requests;

DECLARE @OrderID INTEGER, @SectionID INTEGER

SET @OrderID = 55722
SET @SectionID = 205521

SELECT DISTINCT

	 Orders.OrderID                  	"BD55BORDER"
	,QuoteSectionItems.SectionID        "BD55BSECID"
	,QuoteSectionItems.ItemID           "BD55BLINE"
	,'N'                                "BDEDSP"
	,Systems.SystemNumber            	"BDAITM"
	,CAST((QuoteSectionItems.Quantity * (1 + CAST(ROUND((QuoteSectionCommissions.Commission  / (Subtotal.Amount - QuoteSections.Discount)),5) AS DECIMAL(4,2)))) * 10000 AS INTEGER)
										"BDUORG" -- Qty
	,CAST(((QuoteSectionItems.UnitPrice - (QuoteSectionItems.UnitPrice * dbo.fn_findDiscount(SystemCategories.CategoryID, Subtotal.Amount))) + ((QuoteSectionItems.UnitPrice - (QuoteSectionItems.UnitPrice * dbo.fn_findDiscount(SystemCategories.CategoryID, Subtotal.Amount))) * (CAST(ROUND(ISNULL(NULLIF(QuoteSectionCommissions.Commission,0)  / NULLIF(Subtotal.Amount - QuoteSections.Discount,0),0),5) AS DECIMAL(4,2))))) * 10000 AS BIGINT)	
										"BDUPRC" -- per unit price
	,CAST((QuoteSectionItems.UnitPrice - (QuoteSectionItems.UnitPrice * dbo.fn_findDiscount(SystemCategories.CategoryID, Subtotal.Amount))) * 10000 AS BIGINT)
                                        "BDADSA" -- discount
	,CAST(CAST((((QuoteSectionItems.Quantity * QuoteSectionItems.UnitPrice) / NULLIF(Subtotal.Amount,0)) * QuoteSectionCommissions.Commission)/NULLIF(QuoteSectionItems.Quantity,0) AS NUMERIC(12,4)) * 10000 AS INTEGER)
                                        "BDIPRV"
	,CASE 
		WHEN LEFT(RTRIM(LTRIM(QuoteSectionItems.Custom)),60) IS NULL THEN ''
		ELSE LEFT(RTRIM(LTRIM(QuoteSectionItems.Custom)),60)
	 END                                "BDTXLN"
	,''                                 "BDKCOO"
	,''                                 "BDDOCO"
	,''                                 "BDDCTO"
	,''                                 "BDLIND"
	,''                                 "BDUSER"
	,''                                 "BDPID"
	,''                                 "BDUPMJ"
	,''                                 "BDUPMT"
	,''                                 "BDJOBN"	

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

	 Orders.OrderID AS                  "BD55BORDER"
	,QuoteSectionItems.SectionID        "BD55BSECID"
	,LTRIM(RTRIM(CAST(RIGHT(DATEPART(HOUR, GETDATE()),2) AS CHAR)))
		+ LTRIM(RTRIM(CAST(RIGHT(DATEPART(MINUTE, GETDATE()),2) AS CHAR)))
		+ LTRIM(RTRIM(CAST(RIGHT(DATEPART(SECOND, GETDATE()),2) AS CHAR)))	
		+ LTRIM(RTRIM(CAST(RIGHT(DATEPART(MILLISECOND, GETDATE()),2) AS CHAR)))
	                                    "BD55BLINE"
	,'N'                                "BDEDSP"
	,'FREIGHT' AS                       "BDAITM"
	,10000                              "BDUORG"
	,CAST(Orders.ShippingAmount * 10000 AS INTEGER)              "BDUPRC"
	,0                                  "BDADSA"
	,0                                  "BDIPRV"
	,ShippingCosts.ShippingDescription  "BDTXLN"
	,''                                 "BDKCOO"
	,''                                 "BDDOCO"
	,''                                 "BDDCTO"
	,''                                 "BDLIND"
	,''                                 "BDUSER"
	,''                                 "BDPID"
	,''                                 "BDUPMJ"
	,''                                 "BDUPMT"
	,''                                 "BDJOBN"	
	
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
	
